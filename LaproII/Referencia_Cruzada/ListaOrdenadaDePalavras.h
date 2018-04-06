#ifndef LISTAORDENADADEPALAVRAS_H_INCLUDED
#define LISTAORDENADADEPALAVRAS_H_INCLUDED
#include "Palavra.h"

class ListaOrdenadaDePalavras // DEVE INCLUIR Palavra.h
{
    int qtdOcorrencias;
    Palavra *primPalavra;

    public:
        // Construtores

        // insere uma ocorrência na lista, mantendo a lista em ordem alfabética
        int  adicionaPalavra(string palavra, int numeroParagrafo);
        void imprimeListaPalavras();
};

#endif // LISTAORDENADADEPALAVRAS_H_INCLUDED
