#include <iostream>
#include "STL-Pessoa.cpp"

using namespace std;

bool ordena_por_nome(Pessoa A, Pessoa B)
{
    if (A.getNome() < B.getNome())
       return true;
    return false;
}

int main()
{

    cout << "Hello world!" << endl;
	// @corrigido
    list <Pessoa*> VP;
    list <Pessoa*>::iterator ptr;

    VP.push_back(new Aluno("Joao", 25, "EC"));
    VP.push_back(new Aluno("Maria", 32, "CC"));
    VP.push_back(new Aluno("Carla", 4, "SI"));
    VP.push_back(new Aluno("Abel", 30, "ES"));

//    VP.sort ( VP.begin(), VP.end(), ordena_por_nome);

    // percorrendo a lista sem indices
    Pessoa *aux;
    for(ptr = VP.begin(); ptr != VP.end(); ptr++)
    {
        aux = *ptr;
//        cout << "Nome: " << ptr->getNome();
//        cout << " - Idade: " << ptr->getIdade() << endl;
        aux->print();
    }

    return 0;
}
