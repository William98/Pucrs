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

};