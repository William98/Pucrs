#include <iostream>
#include "DataTransacao.h"

using namespace std;

class Transacao{
    private:
        Transacao *prox;
        double valor;
        char descricao; // D - Deposito, S - Saque
        DataTransacao *data;

    public:
        Transacao(double v, char desc){
            data = new DataTransacao(10, 10, 2010); // 10-10-2010
            valor = v;
            descricao = desc;
        }

        void setProx(Transacao *p){
            prox = p;
        }

        Transacao *getProx(){
            return prox;
        }

        void setValor(double v){
            valor = v;
        }

        double getValor(){
            return valor;
        }

        void setDescricao(char d){
            descricao = d;
        }

        char getDescricao(){
            return descricao;
        }

        void imprime(){
            cout << "____________________________" << endl;
            data->imprime();
            cout << "Valor: R$" << getValor() << endl;
            char a = getDescricao();
            string desc = (a == 'D') ? "Deposito" : "Saque";
            cout << "Tipo: " << desc << endl;
            cout << "____________________________" << endl;
        }

};
