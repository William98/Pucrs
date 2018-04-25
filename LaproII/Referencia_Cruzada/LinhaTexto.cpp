#include <iostream>
#include <fstream>

using namespace std;

#include "LinhaTexto.h"

void LinhaTexto::setTexto(string L)
{
    Linha = L;

}
string LinhaTexto::getTexto()
{

    return Linha;
}

int LinhaTexto::getNextPal (string &P)
{
    int pos=0;
    if(Linha=="\0")
        return 1;
    removePontuacao();
    while(Linha[pos]!=' ')
    {
        pos++;
    }
    P=Linha.substr(0,pos);
    Linha.erase(0,pos+1);

    return 0;
}
void LinhaTexto::removePontuacao()
{
    int pos=0;
    while(Linha[pos]!='.')
    {
        pos++;

    }
    Linha.erase(pos,1);

}
