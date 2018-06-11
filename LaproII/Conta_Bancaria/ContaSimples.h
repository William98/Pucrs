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
            cout << "Depositado R$" << valor << endl;
        }

        void saque(double valor){
            if(saldo >= valor){
                saldo = saldo - valor;
                // Registrar transacao
                insereTransacao(valor, 'S');
                cout << "Sacado R$" << valor << endl;
            }else{
                cout << "Saldo insuficiente" << endl;
            }
        };

        void extrato(){
            cout << "===== EXTRATO DA CONTA =====" << endl;
            cout << "============================" << endl;
            cout << " INFORMACOES DO CLIENTE " << endl;
            cout << "Nro Conta: " << numeroConta << endl;
            cout << "Cliente: " << nomeCorrentista << endl;
            cout << "________ TRANSACOES ________" << endl;
            imprimeTransacoes();
            cout << "____________________________" << endl;
            cout << "Saldo: R$" << saldo << endl;
            cout << "============================" << endl;
        }
};
