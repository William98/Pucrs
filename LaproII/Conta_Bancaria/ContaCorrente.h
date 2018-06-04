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
            cout << "Depositado R$" << setprecision(2) << valor << endl;
        }

        void saque(double valor){
            if((saldo+limite) => valor){
                saldo = saldo - valor;
                // Registrar transacao
                cout << "Sacado R$" << setprecision(2) << valor << endl;
            }else{
                cout << "Saldo insuficiente" << endl;
            }
        }

        void extrato(){
            cout << "Nro Conta: " << numeroConta << endl;
            cout << "Cliente: " << nomeCorrentista << endl;
            /* Imprimir transacoes */
            cout << "Saldo: " << saldo << endl;
            cout << "Dia do Aniversario: " << diaAniversario << endl;
        }

};
