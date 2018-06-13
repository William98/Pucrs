#ifndef _PESSOA_
#define _PESSOA_
using namespace std;

class Pessoa
{
private:
    Pessoa *prox;
    bool validaNome();

protected:
    string nome;
    string endereco;
    void ImprimeDadosPessoa() // só pode ser usada em classes derivadas
    {
       cout << "Nome: " << nome << " - Endereco:" << endereco << endl;
    }

public:
    Pessoa ()
    {
       // cout << "Rodou Construtora Pessoa SEM parametros" << endl;
    }
    Pessoa(string n, string e)
    {
        nome = n;
        endereco = e;
        //cout << "Rodou Construtora Pessoa COM parametros" << endl;
    }
    void setNome(string n)
    {
        nome = n;
    }
    void setProx(Pessoa *p)
    {
        prox = p;
    }
    Pessoa* getProx()
    {
        return prox;
    }
    virtual void imprime() = 0;  // Funcao virtual PURA
                                //  define uma classe abstrata
    string getNome()
    {
        return nome;
    }
    string getEnd()
    {
        return endereco;
    }
};
#endif // _PESSOA_#include <iostream>
