#include "Pessoa.h"
class Aluno: public Pessoa  // Aluno é DERIVADA de Pessoa
{                           // Pessoa: Classe BASE
    string curso;           // Aluno: Classe DERIVADA
public:
    Aluno():Pessoa()
    {
       // cout << "Rodou Construtora Aluno SEM parametros" << endl;
    }
    Aluno(string n, string e, string c):Pessoa("Aluno " + n,e)
    {
        curso = c;
       // cout << "Rodou Construtora Aluno COM parametros" << endl;
    }
    void setCurso(string c)
    {
        curso = c;
    }
    string getCurso()
    {
        return curso;
    }
    void imprime()  // SobreESCRITA de Método
    {
        ImprimeDadosPessoa(); // chama a imprime da Pessoa
        cout << curso << endl;
    }

};
