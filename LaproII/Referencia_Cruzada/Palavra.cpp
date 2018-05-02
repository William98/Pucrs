#include <iostream>
#include <fstream>

using namespace std;

#include "Palavra.h"


Palavra::Palavra(string s){
    this->quantidade = 1;
    this->s = s;
    this->ListaDeOcorrencias = NULL;
    this->prox = NULL;
}

string Palavra::getS(){
    return s;
}

void Palavra::setS(string s){
    this->s = s;
}

Palavra* Palavra::getProx(){
    return prox;
}

void Palavra::setProx(Palavra* p){
    this->prox = p;
}

void Palavra::adicionaOcorrencia(int numeroParagrafo, int posicao){
    if(ListaDeOcorrencias == NULL)
        ListaDeOcorrencias = new Ocorrencia(numeroParagrafo, posicao);
    else{
        //Ocorrencia* oco = ListaDeOcorrencias->getProx();

    }

}


