#include "Conta.h"

class ContaSimples: public Conta
{
    public:
        // Construtora
        ContaSimples(int numero, string nome, double saldo):Conta(numero, nome, saldo){
            // Sem atribuicoes
        }

        void saque(double valor){
            Conta::saque(valor);
            if(saldo >= valor){
                saldo = saldo - valor;
                // Registrar transacao
                insereTransacao(-valor, 'S');
                cout << "Sacado R$" << fixed << valor << cout.precision(1) << endl;
            }else{
                cout << "Saldo insuficiente" << endl;
            }
        };

        void extrato(){
            Conta::extrato();
            cout << "============================" << endl;
        }
};
