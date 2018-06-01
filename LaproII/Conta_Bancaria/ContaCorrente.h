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

};