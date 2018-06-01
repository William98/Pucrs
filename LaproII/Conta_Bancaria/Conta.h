#include <iostream>
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
        void deposito(double valor){
            saldo = saldo + valor;
        }

        /* Metodo responsavel pelo saque */
        virtual double saque(double valor){
            if(saldo > valor){
                saldo = saldo - valor;
                return valor;
            }
        }

        /* Metodo responsavel pela impressao do extrato */
        virtual void extrato(){
            cout << "Nro Conta: " << numeroConta << endl;
            cout << "Cliente: " << nomeCorrentista << endl;
            /* Imprimir transacoes */
            cout << "Saldo: " << saldo << endl;
        }
};