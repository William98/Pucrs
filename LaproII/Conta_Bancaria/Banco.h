#include "Conta.h"

using namespace std;

class Banco{

    string cliente[10] = {"Nicolas", "Vinicius", "Otavio", "Murilo", "Lucas", 
                            "Jonas", "Willian", "Vladmir", "Arthur", "Daniel"};

    double saldoInicial[5] = {0.0, 50.0, 150.0, 100.0, 75.0};
    
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