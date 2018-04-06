#ifndef OCORRENCIA_H_INCLUDED
#define OCORRENCIA_H_INCLUDED

class Ocorrencia{
        int numero; // numero do parágrafo onde ocorreu a palavra.
        int posicao; // posição da palavra dentro do parágrafo
        Ocorrencia *prox;
    public:
        // Construtores ......
        Ocorrencia();

        // sets e gets para todos os atributos
        int getNumero();
        void setNumero(int n);
        int getPosicao();
        void setPosicao(int p);
};

#endif // OCORRENCIA_H_INCLUDED
