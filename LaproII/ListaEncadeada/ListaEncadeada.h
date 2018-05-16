#include <iostream>
#ifndef LISTAENCADEADA_H_INCLUDED
#define LISTAENCADEADA_H_INCLUDED

#include "Pessoa.h"

class ListaEncadeada{

Pessoa *inicio;
Pessoa *fim;

public:

ListaEncadeada(){
    inicio = NULL;
    fim = NULL;
}

int estaVazia()
{
    if(inicio == NULL)
        return 1;
    else
        return 0;
}
void inserePessoaNoInicio(string fulano, string endereco)
{
    Pessoa *aux = new Pessoa(fulano, endereco);
    if(estaVazia() == 1){
        inicio = aux;
        fim = inicio;
    }else{
        aux->setProx(inicio);
        inicio = aux;
    }
}
void inserePessoaNoFinal(string fulano, string endereco)
{
    Pessoa *aux = new Pessoa(fulano, endereco);
    if(estaVazia() == 1){
        fim = aux;
        inicio = fim;
    }else{
        fim->setProx(aux);
        fim =aux;
    }
}
void imprimeLista()
{
    Pessoa *aux;
    aux = inicio;
    if (estaVazia() == 1)
    {
       cout << "Lista Vazia !" << endl;
       return; // encerra o método aqui
    }
    cout << "----- INICIO DA LISTA -----" << endl;
    while (aux != NULL)
    {
        aux->imprime();
        aux = aux->getProx();
    }
}

Pessoa *achaUltimo()
{
    if(estaVazia() == 1){
        return NULL;
    }else{
        return fim;
    }
}
Pessoa *buscaPessoa(string fulano, string endereco)
{
    if(estaVazia() == 1)
        return NULL;

    Pessoa *aux = inicio;
    while(aux){
        if((aux->getNome() == fulano)&&(aux->getEnd() == endereco)){
            return aux;
        }
        aux = aux->getProx();
    }
    return NULL;
}
Pessoa *buscaAnterior(string fulano)
{
    if(estaVazia() == 1)
        return NULL;

    if(inicio->getNome() == fulano)
        return NULL;

    Pessoa *aux, *prox;
    aux = inicio;
    while(aux!= NULL){
        prox = aux->getProx();
        if(prox == NULL)
            return NULL;
        if(prox->getNome() == fulano)
            return aux;
        aux = prox;
    }
}
Pessoa *retira(string Fulano, string endereco)
{

// Crie um método que retire um elemento da lista.
// Como parâmetro este método deve receber o nome de
// uma pessoa a ser buscada na lista.
// Caso o nome não exista na lista, o método deve devolver NULL.
// Lembre-se de fazer um teste específico para remover o 1o. elemento da
// lista
// O método NÃO deve "deletar" o nodo da memória.
// Dica: use o método "BuscaAnterior".
}
Pessoa *retiraDoInicio()
{
    Pessoa *aux = inicio;
    if(estaVazia() == 1)
        return NULL;
    if(inicio == fim){
            aux = inicio;
            inicio = fim = NULL;
            return aux;
    }
    aux = inicio;
    inicio = aux->getProx();
    return aux;
}
Pessoa *retiraDoFinal()
{
    Pessoa *aux = inicio;
    if(estaVazia() == 1)
        return NULL;
    if(fim == fim){
        aux = fim;
        inicio = fim = NULL;
        return aux;
    }
    while(aux->getProx()!=fim){
        aux = aux->getProx();
    }
    fim = aux;
    aux = aux->getProx();
    fim->setProx(NULL);

    return aux;
// Crie um método que remova um último elemento da lista.
// O método deve retornar um apontador para o elemento retirado da lista
// O método NÃO deve "deletar" o nodo da memória.
// Caso a lista esteja vazia, o método deve devolver NULL.
}
int remove(string Fulano, string endereco)
{
// Crie um método que remova um elemento da lista.
// O método deve "deletar" o nodo da memória.
// Dica: use o método "Retira".
}
void inserePessoaEmOrdem(string fulano, string endereco)
{
// Crie um método que coloque um elemento na lista, de forma que os elementos
// fiquem sempre em ordem crescente do nome da pessoa.
// Dica: Modifique o método de busca de forma que ele devolva um apontador
// para o primeiro nodo da lista no qual o atributo 'nome' seja "maior" que no
// nome a ser inserido na lista
}

};
#endif
