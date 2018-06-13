#include "Aluno.h"
class Estagiario: public Aluno
{
protected:
    string departamento;
    float salario;
public:
    Estagiario():Aluno("Estagiario ", "Na PUCRS","Qualquer")
    {
        departamento = "--";
    }
    void imprime()
    {
        Aluno::imprime();
        cout << "Departamento:" << departamento << endl;
    }

};

