#include <iostream>

using namespace std;

#include "ArquivoTexto.h"
#include "LinhaTexto.h"
#include "ListaOrdenadaDePalavras.h"

int main()
{
    int nLinha = 0, fimArquivo, fimLinha; // flags
    string Palavra, L;

    ListaOrdenadaDePalavras Lista; // objeto que gerencia a lista
    ArquivoTexto Arquivo; // objeto que gerencia o arquivo
    LinhaTexto Linha; // objeto que gerencia uma linha

    Arquivo.openText("lorem.txt");

    do  // laço que passa em cada linha do arquivo
    {
        fimArquivo = Arquivo.getNextLine(L);
        if (fimArquivo==1){
            cout << "Fim do arquivo" << endl;
            break;
        }
        nLinha++; // conta mais uma linha lida do arquivo
        Linha.setTexto(L); // define o texto da linha
        Linha.removePontuacao();
        do // laço que passa em cada palavra de uma linha
        {
            fimLinha = Linha.getNextPal(Palavra);
            if (fimLinha==1)
                break;
            if(Palavra.size() > 3){

                Lista.adicionaPalavra(Palavra, nLinha); // coloca a palavra na lista            }
          }
        } while (1);
    } while (1);
	// Imprime toda a lista de palavras e suas ocorrências
	Lista.imprimeListaPalavras();
    return 0;
}
