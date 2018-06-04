#include <iostream>
#include "DataTransacao.h"

using namespace std;

class Transacao{
    private:
        DataTransacao *data;
        double valor;
        char descricao; // D - Deposito, S - saque

    public:
        Transacao(int d, int m, int a, double v, char desc){
            data = new DataTransacao(d, m, a);
            valor = v;
            descricao = desc;
        }
};
