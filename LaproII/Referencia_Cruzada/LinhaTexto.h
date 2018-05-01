#ifndef LINHATEXTO_H_INCLUDED
#define LINHATEXTO_H_INCLUDED

using namespace std;

class LinhaTexto {
        string Linha;
     public:
        // Construtores
        void setTexto(string L);  //Define a linha de texto a ser manipulada
        string getTexto();
         //retorna a próxima palavra da linha, através do parâmetro L.
         //Caso a linha tenha acabado, retorna 1, caso contrário, retorna 0
        int getNextPal (string &P);
        int getNextPal (string &P, int p);
        // Metodo que manipula a linha capturada e remove a pontuação do texto
        void removePontuacao();


};

#endif // LINHATEXTO_H_INCLUDED
