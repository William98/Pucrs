#include <iostream>
#ifndef PESSOA_H_INCLUDED
#define PESSOA_H_INCLUDED

using namespace std;

class Pessoa{
    string nome, endereco;
    Pessoa *prox;
public:
    Pessoa(string n, string e)
    {
        nome = n;
        endereco = e;
    }
    void setProx(Pessoa *p)
    {
        prox = p;
    }
    Pessoa *getProx()
    {
        return prox;
    }
    void imprime()
    {
        cout << "Pessoa: " << nome;
        cout << "  -  " << endereco << endl;
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
#endif
