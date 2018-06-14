#include "Conta.h"

class ContaCorrente : public Conta
{
    private:
        double limite;

    public:
        // Construtora
        ContaCorrente(int numero, string nome, double saldo, double l):Conta(numero, nome, saldo){
            limite = l;
        }

        double getLimite(){
            return limite;
        }
        void setLimite(double l){
            limite = l;
        }

        void saque(double valor){
            Conta::saque(valor);
            if((saldo+limite) >= valor){
                saldo = saldo - valor;
                // Registrar transacao
                insereTransacao(-valor, 'S');
                cout << "Sacado R$" << fixed << valor << cout.precision(1) << endl;
            }else{
                cout << "Saldo insuficiente" << endl;
            }
        }
        
        void extrato(){
            Conta::extrato();
            cout << "Limite: R$ " << fixed << limite << cout.precision(1) << endl;
            cout << "============================" << endl;
        }


};
