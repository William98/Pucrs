#include <iostream>
using namespace std;
#include <algorithm>
#include <list>

class Pessoa
{
    string nome;
    int idade;
public:
    Pessoa(string no, int id)
    {
        idade = id;
        nome = no;
    }
    string getNome()
    {
        return nome;
    }
    int getIdade()
    {
        return idade;
    }
    virtual void print(){
        cout << "Nome: " << nome;
        cout << " - Idade: " << idade << endl;
    }
};

class Aluno: public Pessoa
{
    private:
        string curso;

    public:
        Aluno(string n, int i, string c):Pessoa(n, i){
            curso = c;
        }

        string getCurso(){
            return curso;
        }

        void print(){
            cout << "Curso: " << curso << endl;
        }
};



