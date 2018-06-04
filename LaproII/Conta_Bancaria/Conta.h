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

        }
        /* Metodo responsavel pelo saque */
        virtual void saque(double valor){

        }
        /* Metodo responsavel pela impressao do extrato */
        virtual void extrato(){

        }
};
