#include <iostream>
#include <iomanip>
using namespace std;

#include "Transacao.h"

class Conta
{
    Transacao *t;

    protected:
        int numeroConta;
        string nomeCorrentista;
        double saldo;

    public:
        Conta(int numero, string nome, double saldo){
            t = NULL;
            numeroConta = numero;
            nomeCorrentista = nome;
            saldo = saldo;
        }

        int getNumeroConta(){
            return numeroConta;
        }
        void setNumeroConta(int n){
            numeroConta = n;
        }

        string getNomeCorrentista(){
            return nomeCorrentista;
        }
        void setNomeCorrentista(string n){
            nomeCorrentista = n;
        }

        double getSaldo(){
            return saldo;
        }
        void setSaldo(double s){
            saldo = s;
        }

        /* Metodo responsavel pelo deposito */
        virtual void deposito(double valor){
            /* @override */
        }
        /* Metodo responsavel pelo saque */
        virtual void saque(double valor){
            /* @override */
        }
        /* Metodo responsavel pela impressao do extrato */
        virtual void extrato(){
            /* @override */
        }
        /* Metodo responsavel pela impressao da info da Conta */
        virtual void imprimeInfo(){
            /* @override */
        }
        /* Metodo responsavel por guardar transacao */
        void insereTransacao(double valor, char desc){
            Transacao *aux;
            Transacao *tmp = new Transacao(valor, desc);
            if(t == NULL){
                t = tmp;
            }else{
                aux = t;
                while(aux->getProx() != NULL){
                    aux = aux->getProx();
                }
                aux->setProx(tmp);
            }
        }

        /* Metodo de impressao das transacoes */
        void imprimeTransacoes(){
            if(t != NULL){
                Transacao *aux;
                aux = t;
                while(aux != NULL){
                    aux->imprime();
                    aux = aux->getProx();
                }
            }else{
                cout << "       Sem Transacoes       " << endl;
            }
        }
};
