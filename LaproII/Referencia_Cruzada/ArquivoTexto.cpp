#include <iostream>
#include <fstream>

using namespace std;

#include "ArquivoTexto.h"


int ArquivoTexto::openText(string Nome)
{
    arquivo.open(Nome, ios::in);
    if(!arquivo)
    {
        cout << "Falha na abertura do arquivo." << endl;
        return 1;
    }
    return 0;
}

int ArquivoTexto::genText(string Nome, string Texto){
    saida.open(Nome, ios::out);
    if(!saida){
        cout << "Falha na geracao do arquivo." << endl;
        return 1;
    }
    cout << "Funcionou." << endl;

    saida << Texto;
    saida.close();
    return 0;
}

int ArquivoTexto::getNextLine(string &L)
{
    if (!arquivo.eof())
    {
        getline(arquivo, L);

        return 0;
    }
    return 1;
}

void ArquivoTexto::closeText()
{
    arquivo.close();
}
