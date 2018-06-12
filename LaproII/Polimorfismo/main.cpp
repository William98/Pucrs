#include <iostream>
using namespace std;

void imprime()
{
    cout << "**** " ;
}
class Pessoa
{
    string nome, endereco;
    Pessoa *prox;

public:
    int tipo;
    Pessoa ()
    {
        //out << "Pessoa::Construtora SEM parametros" << endl;
        tipo = 1;
    }
    Pessoa(string n, string e)
    {
        nome = n;
        endereco = e;
        tipo = 1;
        //cout << "Pessoa::Construtora COM parametros" << endl;
    }
    void setNome(string n)
    {
        nome = n;
    }
    void setEndereco(string e)
    {
        endereco = e;
    }
    void setProx(Pessoa *p)
    {
        prox = p;
    }
    Pessoa* getProx()
    {
        return prox;
    }
    virtual void imprime()
    {
        //::imprime(); // funcao global
        cout << nome << "  -  " << endereco ;
    }
    string getNome()
    {
        return nome;
    }
    string getEnd()
    {
        return endereco;
    }
};

class Aluno: public Pessoa  // Aluno é DERIVADA de pessoa
{
    // Pessoa: classe BASE
    // Aluno: classe DERIVADA
    string curso;
public:
    Aluno operator=(Pessoa P)
    {
        Aluno temp;
        cout << "Operator=" << endl;
        temp.setNome(getNome());
        temp.setEndereco(getEnd());
        temp.curso = "Indefinido";
        return temp;
    }
    Aluno():Pessoa("SEM NOME","SEM ENDERECO")
    {
        //cout << "Aluno::Construtora SEM parametros" << endl;
        curso = "SEM CURSO";
        tipo = 2;
    }
    Aluno(string n, string e, string c): Pessoa(n,e)
    {
        //cout << "Aluno::Construtora COM parametros" << endl;
        curso = c;
        tipo = 2;
    }
    void setCurso(string c)
    {
        curso = c;
        // nome = "asasasa"; // erro nome é privado em Pessoa
    }
    string getCurso()
    {
        return curso;
    }
    void imprime() // SOBRECARGA do método imprime
    {
        //cout << "Imprime da ALUNO  ";
        //cout << "Aluno: " << getNome() << " - ";
        //cout << "  -  " << endereco << endl;
        Pessoa::imprime();  //chama a imprime da PESSOA
        cout << " -c- " << curso ;
    }
};
class AlunoFormado: public Aluno
{
    int anoDeformatura;
public:
    AlunoFormado()
    {
        tipo = 3;
        cout << "AlunoFormado::Construtora SEM parametros" << endl;
    }
    AlunoFormado(string n, string e, string c, int ano): Aluno(n,e,c)
    {
        tipo = 3;
        anoDeformatura = ano;
    }

    void setAnoDeformatura(int a)
    {
        anoDeformatura = a;
    }
    int getAnoDeformatura()
    {
        return anoDeformatura;
    }
    void imprime() // SOBRECARGA do método imprime
    {
        Aluno::imprime();
        cout << " - " << anoDeformatura << endl;
    }
};

int main()
{
    Pessoa Povo[3];
    Pessoa P("Joao","Bento");
    Aluno A("Claudia","Assis", "Psico");
    AlunoFormado AF("Maria","Ipiranga", "Letras", 2010);

    Povo[0] = P;
    Povo[1] = A;
    Povo[2] = AF;

    for(int i=0; i<3; i++)
    {
        Povo[i].imprime();
        cout << endl;
        cout << "for bolado" << endl;
    }
    cout<< "=========="<< endl;
    Pessoa* PovoPTR[3];

    PovoPTR[0] = &P;
    PovoPTR[1] = &A;
    PovoPTR[2] = &AF;

    Pessoa* P1;
    Aluno* A1;
    AlunoFormado* AF1;
    for(int i=0; i<3; i++)
    {
        PovoPTR[i]->imprime(); // Late binding
        std::cout << endl;
    }

    return 0;
}
