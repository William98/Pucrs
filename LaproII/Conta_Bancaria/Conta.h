#ifndef _CONTA_
#define _CONTA_

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
            this->numeroConta = numero;
            this->nomeCorrentista = nome;
            this->saldo = saldo;
        }

        int getNumeroConta(){
            return numeroConta;
        }
        void setNumeroConta(int n){
            this->numeroConta = n;
        }

        string getNomeCorrentista(){
            return nomeCorrentista;
        }
        void setNomeCorrentista(string n){
            this->nomeCorrentista = n;
        }

        double getSaldo(){
            return saldo;
        }
        void setSaldo(double s){
            this->saldo = s;
        }

        void Info(){
            cout << "Conta " << getNumeroConta() << " - ";
            cout << "Cliente " << getNomeCorrentista() << endl; 
        }

        /* Metodo responsavel pelo deposito */
        void deposito(double valor){
            saldo = saldo + valor;
            // Registrar transacao
            insereTransacao(valor, 'D');
            cout << "Depositado R$" << fixed << valor << cout.precision(1) << endl;
        }

        /* Metodo responsavel pelo saque */
        virtual void saque(double valor){
            cout << "Soliticado saque de R$" << fixed << valor << cout.precision(1) << endl; 
            /* @override */
        }

        /* Metodo responsavel pela impressao do extrato */
        virtual void extrato(){
            cout << "===== EXTRATO DA CONTA =====" << endl;
            cout << "============================" << endl;
            cout << "== INFORMACOES DO CLIENTE ==" << endl;
            cout << "Nro Conta: " << numeroConta << endl;
            cout << "Cliente: " << nomeCorrentista << endl;
            cout << "________ TRANSACOES ________" << endl;
            imprimeTransacoes();
            cout << "____________________________" << endl;
            cout << "Saldo: R$ " << fixed << saldo << cout.precision(1) << endl;
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

#endif
