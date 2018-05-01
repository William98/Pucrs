#ifndef PALAVRA_H_INCLUDED
#define PALAVRA_H_INCLUDED

using namespace std;

#include "Ocorrencia.h"

class Palavra{ // DEVE INCLUIR OCCORRENCIA.H
    string s;
    int quantidade;
    Palavra *prox;
    Ocorrencia *ListaDeOcorrencias;
    public:
        // Construtores
        Palavra(string s);
        // sets e gets para todos os atributos
        string getS();
        void setS(string s);
        Palavra* getProx();
        void setProx(Palavra* p);
        // insere uma ocorrência na lista
        void adicionaOcorrencia(int numeroParagrafo, int posicao);
};

#endif // PALAVRA_H_INCLUDED
