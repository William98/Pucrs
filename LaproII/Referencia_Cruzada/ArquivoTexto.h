#ifndef ARQUIVOTEXTO_H_INCLUDED
#define ARQUIVOTEXTO_H_INCLUDED
#include <fstream>

class ArquivoTexto{
private:
        ifstream arquivo;
public:
        // Construtores
        int openText(string Nome);  // abre o arquivo que contém o texto
        int getNextLine(string &L); // retorna a próxima linha do arquivo, através do parâmetro L. Caso o arquivo tenha acabado,
                                     // retorna 1, caso contrário, retorna 0
        void closeText();
};

#endif // ARQUIVOTEXTO_H_INCLUDED
