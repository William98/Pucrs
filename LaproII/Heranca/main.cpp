#include <iostream>
#include <vector>

using namespace std;

#include "Estagiario.h"
#include "Visitante.h"

int main()
{

    vector <Pessoa*> PresentesNoEvento;
    vector <Pessoa*>::iterator k;

    Aluno P("Maria", "Assis", "Psico");
    //PresentesNoEvento[0] = &P;
    PresentesNoEvento.push_back(&P);

    //PresentesNoEvento[1] = new Estagiario();
    PresentesNoEvento.push_back(new Estagiario());

    Aluno *ptr;
    ptr = new Aluno("Joao","Protasio","EC");
    //PresentesNoEvento[2] = ptr;
    PresentesNoEvento.push_back(ptr);

    Visitante V;
    //PresentesNoEvento[3] = &V;
    PresentesNoEvento.push_back(&V);

    for(int i=0; i< PresentesNoEvento.size(); i++)
    {
        PresentesNoEvento[i]->imprime();//Late bidding
        cout << "----" << endl;
    }
    for(k=PresentesNoEvento.begin();k != PresentesNoEvento.end();k++)
    {
        //k->imprime(); // Não funciona
        // para chama um metodo de um objeto dentro da vector
        //Pessoa *aux; aux = *k; aux->imprime();
        // ou
        (*k)->imprime();
        cout << "----" << endl;
    }

    return 0;
}
