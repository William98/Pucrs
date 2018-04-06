#ifndef PALAVRA_H_INCLUDED
#define PALAVRA_H_INCLUDED
#include "Ocorrencia.h"

class Palavra{ // DEVE INCLUIR OCCORRENCIA.H
    string s;
    Palavra *prox;
    Ocorrencia *ListaDeOcorrencias;
    public:
        // Construtores

        // sets e gets para todos os atributos
        string getS();
        void setS(string p);
        // insere uma ocorrência na lista
        int  adicionaOcorrencia(int numeroParagrafo, int posicao);
};

#endif // PALAVRA_H_INCLUDED
