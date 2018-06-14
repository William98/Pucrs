#include "Conta.h"

class ContaPoupanca : public Conta
{
    private:
        int diaAniversario;

    public:
        // Construtora
        ContaPoupanca(int numero, string nome, double saldo, int dia):Conta(numero, nome, saldo){
            diaAniversario = dia;
        }

        int getDiaAniversario(){
            return diaAniversario;
        }
        void setDiaAniversario(int dia){
            diaAniversario = dia;
        }

        void saque(double valor){
            Conta::saque(valor);
            if(saldo >= valor){
                saldo = saldo - valor;
                /* Registrar transacao */
                insereTransacao(-valor, 'S');
                cout << "Sacado R$" << fixed << valor << cout.precision(1) << endl;
            }else{
                cout << "Saldo insuficiente" << endl;
            }
        }

        void extrato(){
            Conta::extrato();
            cout << "Aniversario: " << diaAniversario << endl;
            cout << "============================" << endl;
        }

};
