#include <iostream>
#include <fstream>

using namespace std;

#include "Ocorrencia.h"

Ocorrencia::Ocorrencia(){
    numero = 0;
    posicao = 0;
}

int Ocorrencia::getNumero(){
    return numero;
}
void Ocorrencia::setNumero(int n){
    numero = n;
}
int Ocorrencia::getPosicao(){
    return posicao;
}
void Ocorrencia::setPosicao(int p){
    posicao = p;
}
