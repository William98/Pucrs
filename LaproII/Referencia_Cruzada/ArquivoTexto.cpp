#include <iostream>
#include <fstream>

using namespace std;

#include "ArquivoTexto.h"


int ArquivoTexto::openText(string Nome)
{
    arquivo.open("lorem.txt", ios::in);
    if(!arquivo)
    {
        cout << "Falha na abertura do arquivo." << endl;
        return 1;
    }
    cout << "Funcionou." <<endl;
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
