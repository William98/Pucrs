#include <iostream>
#include <fstream>

using namespace std;

#include "Ocorrencia.h"

Ocorrencia::Ocorrencia(int n, int p){
    this->numero = n;
    this->posicao = p;
    this->prox = NULL;
}

int Ocorrencia::getNumero(){
    return numero;
}
void Ocorrencia::setNumero(int n){
    this->numero = n;
}
int Ocorrencia::getPosicao(){
    return posicao;
}
void Ocorrencia::setPosicao(int p){
    this->posicao = p;
}

Ocorrencia* Ocorrencia::getProx(){
    return prox;
}

void Ocorrencia::setProx(Ocorrencia* p){
    this->prox = p;
}
