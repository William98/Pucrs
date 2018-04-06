#ifndef LINHATEXTO_H_INCLUDED
#define LINHATEXTO_H_INCLUDED

class LinhaTexto {
        string Linha;
     public:
        // Construtores
        void setTexto(string L);  //Define a linha de texto a ser manipulada
         //retorna a próxima palavra da linha, através do parâmetro L.
         //Caso a linha tenha acabado, retorna 1, caso contrário, retorna 0
        int getNextPal (string &P);

};

#endif // LINHATEXTO_H_INCLUDED
