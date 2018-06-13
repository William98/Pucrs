#include "Conta.h"

using namespace std;

class Banco{



    private:
        string nome;
        double saldo;
        Conta *conta;

    public:
        void listaContas(){


        }

        void int menu(){
            cout << "1 - Listar Contas" << endl;
            cout << "2 - Imprimir Saldo do Banco" << endl;
            cout << "3 - Extrato do Banco" << endl;

        }

};
