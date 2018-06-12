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

    list <Pessoa> VP;
    list <Pessoa>::iterator ptr;

    VP.push_back(Aluno("Joao", 25, "EC"));
    VP.push_back(Aluno("Maria", 32, "CC"));
    VP.push_back(Aluno("Carla", 4, "SI"));
    VP.push_back(Aluno("Abel", 30, "ES"));

//    VP.sort ( VP.begin(), VP.end(), ordena_por_nome);

    // percorrendo a lista sem indices
    for(ptr = VP.begin(); ptr != VP.end(); ptr++)
    {
//        cout << "Nome: " << ptr->getNome();
//        cout << " - Idade: " << ptr->getIdade() << endl;
        ptr->print();
    }

    return 0;
}
