#include "Conta.h"

class ContaCorrente : public Conta
{
    private:
        double limite;

    public:

        ContaCorrente(int numero, string nome, double saldo, double l):Conta(numero, nome, saldo){
            limite = l;
        }

        double getLimite(){
            return limite;
        }
        void setLimite(double l){
            limite = l;
        }

        void deposito(double valor){
            saldo = saldo + valor;
            // Registrar transacao
            insereTransacao(valor, 'D');
            cout << "Depositado R$" << fixed << valor << cout.precision(1) << endl;
        }

        void saque(double valor){
            if((saldo+limite) >= valor){
                saldo = saldo - valor;
                // Registrar transacao
                insereTransacao(-valor, 'S');
                cout << "Sacado R$" << fixed << valor << cout.precision(1) << endl;
            }else{
                cout << "Saldo insuficiente" << endl;
            }
        }
        
        // Imprimi limites
        void extrato(){
            cout << "Limite: R$ " << fixed << limite << cout.precision(1) << endl;
            //cout << "Saldo:     R$" << saldo << endl;
            //cout << "Limite:    R$" << limite << endl;
            cout << "============================" << endl;
        }


};
