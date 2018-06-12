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
            cout << "Depositado R$" << setprecision(2) << valor << endl;
        }

        void saque(double valor){
            if((saldo+limite) >= valor){
                saldo = saldo - valor;
                // Registrar transacao
                insereTransacao(-valor, 'S');
                cout << "Sacado R$" << valor << endl;
            }else{
                cout << "Saldo insuficiente" << endl;
            }
        }
        
        // Imprimi limites
        void extrato(){
            cout << "===== EXTRATO DA CONTA =====" << endl;
            cout << "============================" << endl;
            cout << " INFORMACOES DO CLIENTE " << endl;
            cout << "Nro Conta: " << numeroConta << endl;
            cout << "Cliente: " << nomeCorrentista << endl;
            cout << "________ TRANSACOES ________" << endl;
            imprimeTransacoes();
            cout << "____________________________" << endl;
            cout << "Saldo: R$ " << fixed << saldo << cout.precision(1) << endl;
            cout << "Limite: R$ " << fixed << limite << cout.precision(1) << endl;
            //cout << "Saldo:     R$" << saldo << endl;
            //cout << "Limite:    R$" << limite << endl;
            cout << "============================" << endl;
        }

};
