#ifndef LISTAORDENADADEPALAVRAS_H_INCLUDED
#define LISTAORDENADADEPALAVRAS_H_INCLUDED

using namespace std;

#include "Palavra.h"

class ListaOrdenadaDePalavras // DEVE INCLUIR Palavra.h
{
    int qtdOcorrencias;
    Palavra *primPalavra;
    Palavra *ultPalavra;

    public:
        // Construtores
        ListaOrdenadaDePalavras();
        // insere uma ocorrência na lista, mantendo a lista em ordem alfabética
        int adicionaPalavra(string palavra, int numeroParagrafo);
        // verifica se a palavra já foi adicionada
        int existePalavra(string palavra, Palavra* p);
        // ordena a lista de palavras
        void ordenaLista();
        void imprimeListaPalavras();
};

#endif // LISTAORDENADADEPALAVRAS_H_INCLUDED
