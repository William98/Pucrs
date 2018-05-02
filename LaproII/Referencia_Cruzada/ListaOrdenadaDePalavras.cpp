#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

#include "ListaOrdenadaDePalavras.h"

ListaOrdenadaDePalavras::ListaOrdenadaDePalavras(){
    this->qtdOcorrencias = 0;
    this->primPalavra = NULL;
    this->ultPalavra = NULL;
}

int ListaOrdenadaDePalavras::existePalavra(string palavra, Palavra* p){
    Palavra* aux = primPalavra;
    while(aux){
        if(aux->getS() == palavra){
            p = aux;
            return 1;
        }
        else{
            aux = aux->getProx();
        }
    }
    return 0;
}

int ListaOrdenadaDePalavras::adicionaPalavra(string palavra, int numeroParagrafo){
    // Verifica se exite palavra cadastrada e adiciona na primeira posicao
    if(primPalavra == NULL){
        Palavra* aux = new Palavra(palavra);
        primPalavra = aux;
        ultPalavra = aux;
        ultPalavra->adicionaOcorrencia(numeroParagrafo,0);
        qtdOcorrencias++;
    }else{
        // Verifica se a palavra ja foi cadastrada
        Palavra* aux;
        if(existePalavra(palavra, aux)){
            // Adiciona ocorrencia
            aux->adicionaOcorrencia(numeroParagrafo, 0);
        }
        else{
            // Falta inserir palavra de forma alfabetica na lista
            if(palavra[0] > ultPalavra->getS()[0])
                cout << palavra[0] << ">" << ultPalavra->getS()[0] << endl;
            else
                cout << palavra[0] << "<" << ultPalavra->getS()[0] << endl;
            aux = new Palavra(palavra);
            ultPalavra->setProx(aux);
            ultPalavra = aux;
            ultPalavra->adicionaOcorrencia(numeroParagrafo,0);
            qtdOcorrencias++;
        }
    }
    return qtdOcorrencias;
}

void ListaOrdenadaDePalavras::ordenaLista(){

}

void ListaOrdenadaDePalavras::imprimeListaPalavras(){
    Palavra* aux = primPalavra;
    while(aux){
//        cout << "Palavra: " << aux->getS() << endl;
        aux = aux->getProx();
    }
    cout << qtdOcorrencias << endl;

}
