#include <iostream>
#include "DataTransacao.h"

using namespace std;

class Transacao{
    private:
        DataTransacao data;
        double valor;
        char descricao; // D - Deposito, S - saque, E - extrato
    
    public:
        Transacao(DataTransacao date, double v, char desc){
            data = date;
            valor = v;
            descricao = desc;
        }
};