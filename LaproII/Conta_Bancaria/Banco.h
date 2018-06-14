#include <list>

using namespace std;

#include "ContaSimples.h"
#include "ContaCorrente.h"
#include "ContaPoupanca.h"

class Banco{
    protected:
        string nome;
        double saldo;
        int numeroConta;
    private:
        list<Conta*> Clientes;
        list<Conta*>::iterator ptr;

    public:
        // Construtora
        Banco(string n){
            this->nome = n;
            this->saldo = 0.0;
            this->numeroConta = 1;
        }


        double getSaldo(){
            return saldo;
        }

        void setSaldo(double s){
            this->saldo = s;
        }

        int getNumeroConta(){
            return numeroConta;
        }

        // Incrementa numero da conta
        void incrementaNumero(){
            this->numeroConta = numeroConta + 1;
        }

        // Conta Simples - Nro Conta, Nome, Saldo
        void adicionaConta(string n, double s){
            Clientes.push_back(new ContaSimples(getNumeroConta(), n, s));
            incrementaNumero();
            cout << "Abertura de Conta Simples " << n << "cadastrado" << endl;
        }

        // Conta Corrente - Nro Conta, Nome, Saldo, Limite
        void adicionaConta(string n, double s, double l){
            Clientes.push_back(new ContaCorrente(getNumeroConta(), n , s, l));
            incrementaNumero();
            cout << "Abertura de Conta Corrente " << n << "cadastrado" << endl;
        }

        // Conta Poupanca - Nro Conta, Nome, Saldo, Dia Aniversario
        void adicionaConta(string n, double s, int d){
            Clientes.push_back(new ContaPoupanca(getNumeroConta(), n, s, d));
            incrementaNumero();
            cout << "Abertura de Conta Poupanca " << n << "cadastrado" << endl;
        }

        void listaContas(){
            for(ptr=Clientes.begin();ptr != Clientes.end();ptr++){
                (*ptr)->Info();
            }
        }

        Conta* selecionaConta(int num){
            ptr = Clientes.begin();
            while(ptr !=Clientes.end()){
                if((*ptr)->getNumeroConta() == num)
                    break; // retornar a conta 
                ptr++;
            }
        }

        // Metodo manual
        void imprimeSaldo(){
            double soma = 0;
            for(ptr=Clientes.begin();ptr != Clientes.end();ptr++){
                soma = (*ptr)->getSaldo();
            }
            setSaldo(soma);

            cout << "Saldo do Banco" << getSaldo() << endl;            
        }


};
