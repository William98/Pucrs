#include <iostream>

using namespace std;

class DataTransacao{
    private:
        int dia;
        int mes;
        int ano;

    public:
        DataTransacao(int d, int m, int a){
            dia = d;
            mes = m;
            ano = a;
        }

        int getDia(){ return dia; }
        void setDia(int d){ dia = d; }

        int getMes(){ return mes; }
        void setMes(int m){ mes = m; }

        int getAno(){ return ano; }
        void setAno(int a){ ano = a; }

        void imprime(){
            cout << "Data Transaca: "<< getDia() << "/" << getMes() << "/" << getAno() << endl;
        }
};
