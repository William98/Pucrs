#include <iostream>
//#include "Conta.h"
#include "ContaSimples.h"

using namespace std;

int main()
{
    cout << "Hello world!" << endl;

    ContaSimples cs1 (1, "Lucas", 0.0);
    cs1.deposito(50);
    cs1.saque(50);
    cs1.deposito(50);
    cs1.saque(20);
    cs1.deposito(20);

    cs1.extrato();

    char a = 'D';
    string desc = (a == 'D') ? "Deposito" : "Saque";

    cout << desc << endl;




    return 0;
}
