#include "Conta.h"

class ContaPoupanca : public Conta
{
    private:
        int diaAniversario;

    public:
        ContaPoupanca(int numero, string nome, double saldo, int dia):Conta(numero, nome, saldo){
            diaAniversario = dia;
        }

        int getDiaAniversario(){
            return diaAniversario;
        }
        void setDiaAniversario(int dia){
            diaAniversario = dia;
        }

        void deposito(double valor){
            saldo = saldo + valor;
            /* Registrar transacao */
            insereTransacao(valor, 'D');
            cout << "Depositado R$" << setprecision(2) << valor << endl;
        }

        void saque(double valor){
            if(saldo >= valor){
                saldo = saldo - valor;
                /* Registrar transacao */
                insereTransacao(-valor, 'S');
                cout << "Sacado R$" << setprecision(2) << valor << endl;
            }else{
                cout << "Saldo insuficiente" << endl;
            }
        }

        void extrato(){
            cout << "===== EXTRATO DA CONTA =====" << endl;
            cout << "============================" << endl;
            cout << " INFORMACOES DO CLIENTE " << endl;
            cout << "Nro Conta: " << numeroConta << endl;
            cout << "Cliente: " << nomeCorrentista << endl;
            cout << "Aniversario: " << diaAniversario << endl;
            cout << "________ TRANSACOES ________" << endl;
            /* Imprimir transacoes */
            imprimeTransacoes();
            cout << "____________________________" << endl;
            cout << "Saldo: R$ " << fixed << saldo << cout.precision(1) << endl;
            //cout << "Saldo: R$" << saldo << endl;
            cout << "============================" << endl;
        }
};
