#include "Conta.h"

class ContaSimples: public Conta
{
    public:
        ContaSimples(int numero, string nome, double saldo):Conta(numero, nome, saldo){
            // Construtora
        }
        void deposito(double valor){
            saldo = saldo + valor;
            // Registrar transacao
            insereTransacao(valor, 'D');
            cout << "Depositado R$" << fixed << valor << cout.precision(1) << endl;
        }

        void saque(double valor){
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
            cout << "____________________________" << endl;
            cout << "Saldo: R$ " << fixed << saldo << cout.precision(1) << endl;
            //cout << "Saldo: R$" << saldo << endl;
            cout << "============================" << endl;
        }

        void imprimeInfo(){
            cout << "== INFORMACOES DO CLIENTE ==" << endl;
            cout << "Nro Conta: " << numeroConta << endl;
            cout << "Cliente: " << nomeCorrentista << endl;
            cout << "Saldo: R$ " << fixed << saldo << cout.precision(1) << endl;
            //cout << "Saldo: R$" << saldo << endl;
            cout << "============================" << endl;
        }
};
