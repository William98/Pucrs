

#include "Pessoa.h"
class Visitante: public Pessoa  // Visitante é DERIVADA de Pessoa
{                           // Pessoa: Classe BASE
    string curso;           // Visitante: Classe DERIVADA
public:
    void imprime()
    {
        ImprimeDadosPessoa();
        cout << "(Visita)" << endl;
    }

};
