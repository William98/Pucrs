#include <iostream>
#include <list>

using namespace std;

#include "ContaSimples.h"
#include "ContaCorrente.h"
#include "ContaPoupanca.h"

int main()
{
    list<Conta*> Clientes;
    list<Conta*>::iterator ptr;

    // Nro Conta, Nome, Saldo
    Clientes.push_back(new ContaSimples(1, "Lucas", 50));
    // Nro Conta, Nome, Saldo, Limite
    Clientes.push_back(new ContaCorrente(2, "Jonas", 100, 50));
    // Nro Conta, Nome, Saldo, Dia Aniversario
    Clientes.push_back(new ContaPoupanca(3, "Arthur", 160, 12));

    for(ptr=Clientes.begin();ptr != Clientes.end();ptr++){
        (*ptr)->deposito(100);
        (*ptr)->saque(260);
        (*ptr)->extrato();
        cin.get();
    }


    // int op;
    // while(true){
    //     menuBanco(op);
    //     switch(op){
    //         // Op. Lista Contas
    //         case 1:
    //             cout << "Operacao Seleciona: 3" << endl;
    //             break;
    //         // Op. Saldo Banco
    //         case 2:
    //             cout << "Operacao Seleciona: 3" << endl;
    //             break;
    //         // Op. Selecionar Conta
    //         case 3:
    //             cout << "Operacao Seleciona: 3" << endl;
    //             break;
    //         // Op. Sair
    //         case 9:
    //             cout << "TCHAU" << endl;
    //             return 0;
    //         // Op. Invalida
    //         default:
    //             cout << "OPERACAO INVALIDA!" << endl;
    //             break;
    //     }
    // }

    return 0;
}
