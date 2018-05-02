#include <iostream>

using namespace std;

#include "ArquivoTexto.h"
#include "LinhaTexto.h"
#include "ListaOrdenadaDePalavras.h"

int main()
{
    int nLinha = 0, fimArquivo, fimLinha; // flags
    string Palavra, L, arquivo;

    ListaOrdenadaDePalavras Lista; // objeto que gerencia a lista
    ArquivoTexto Arquivo; // objeto que gerencia o arquivo
    LinhaTexto Linha; // objeto que gerencia uma linha

//    cout << "Informe o nome do arquivo que deseja ler: " << endl;
//    cin >> arquivo;
//
//    Arquivo.openText(arquivo);
    Arquivo.openText("lorem.txt");

    do  // laço que passa em cada linha do arquivo
    {
        fimArquivo = Arquivo.getNextLine(L);
        if (fimArquivo==1){
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

//	cout << "Informe o nome que deseja armazenar os resultados: " << endl;
//	cin >> arquivo;
//
//	Arquivo.genText(arquivo, "texto");
    Arquivo.genText("arquivo.txt", "texto");
    return 0;
}
