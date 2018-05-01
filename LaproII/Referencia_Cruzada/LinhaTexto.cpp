#include <iostream>
#include <fstream>

using namespace std;

#include "LinhaTexto.h"

void LinhaTexto::setTexto(string L)
{
    this->Linha = L;

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
    while(Linha[pos]!=' ')
    {
        pos++;
    }
    P=Linha.substr(0,pos);
    Linha.erase(0,pos+1);

    return 0;
}

int LinhaTexto::getNextPal (string &P, int p)
{
  // ajustar para pegar posicao
  return 0;
}

void LinhaTexto::removePontuacao()
{
    int pos=0;
    while(Linha[pos]!='\0')
    {
      if ((Linha[pos]=='.') || (Linha[pos]==','))
      {
        Linha.erase(pos,1);
      }
        pos++;
    }

}
