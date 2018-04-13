public class ArrayQueue{

  private int capacity;
  private String data;
  private int inicio;
  private int fim;
  
  /* Construtores */
  public ArrayQueue(int c){
    this.capacity = c;
  }
  
  // enqueue(e): adiciona o elemento e ao final da fila;
  void enqueue(){}
  // dequeue(): remove e retorna o primeiro elemento da fila;
  void dequeue(){}
  // first(): retorna o primeiro sem removê-lo;
  void first(){}
  // size(): retorna o número de elementos da fila;
  void size(){}
  // isEmpty(): retorna um booleano indicando se a fila não contém elementos.
  void isEmpty(){}
  
  

}

FILA CIRCULAR (Exercício da professora com comentários)
#include <stdio.h>
#include <stdlib.h>
#define MAX 5
// Variaveis declaradas aqui são visiveis por todas as funções
int fila[MAX];
int inicio = 0;
int fim = 0;
int fila_cheia = 0;
//Insere um item no final da fila
int armazena(int novo) {
printf("Item a ser inserido na fila: %d\n", novo);
//indices de armazenamento e recuperação iguais, quando maiores do que zero indicam fila cheia. 
if ((fim > 0) && (fim == inicio)){
	printf("Fila cheia\n");
	fila_cheia = 1;
	return 0;
}
// indica que foram inseridos MAX elementos e não ocorreu nenhuma remoção, o que indica fila cheia. 
if ((fim == MAX) && inicio == 0) {
	printf("Fila cheia\n");
	fila_cheia = 1;
	return 0;
}
// Houve uma remoção e o fim deve ir para 0
if ((fim == MAX) && (inicio > 0)){
	fim = 0;
	fila_cheia = 1;
}
fila[fim] = novo; 
fim++;
printf("Inserção OK.\n");
}
//Remove um item da fila (o primeiro que entrou)
int remover() {
//Se inicio = 0 e fim = 0, a fila está vazia. Ou ainda, se foram inseridos 4 elementos (por exemplo) e removidos 4 elementos, fim e inicio irão apontar para a posição 5, indicando que a fila está vazia. 
if (((inicio == 0) && (inicio == fim)) || ((inicio == fim) && (fila_cheia == 0))){
	printf("Fila vazia.\n");
	return 0;
}
//Verifica se já foram removidos todos os elementos de fila[0] até fila[MAX-1]. Se isso já ocorreu, o próximo elemento a ser removido é o que está em fila[0].
if (inicio == MAX)
	inicio = 0;
inicio++;
return fila[inicio-1];
}
void mostrafila (){
    printf ("\n\nFim: %d - Inicio: %d \n\n", fim, inicio); 
    if (((inicio == 0) && (inicio == fim)) || ((inicio == fim) && (fila_cheia == 0))) {
        printf("Fila vazia!\n");
    }
    if (inicio < fim){
        for (int i = inicio; i < fim; i++) {
            printf("Fila: %d \n", fila[i]);
        }
    }
    if (fim < inicio){
        for (int i = inicio; i < MAX; i++) {
            printf("Fila: %d \n", fila[i]);
        }
        for (int i = 0; i < fim; i++) {
            printf("Fila: %d \n", fila[i]);
        }
    }
if ((fim > 0) && (inicio == fim)){
        for (int i=0; i<inicio; i++) {
            printf("Fila: %d \n", fila[i]);
            printf("Entrou!2\n");
        }
        for (int i=inicio; i<MAX; i++) {
            printf("Fila: %d \n", fila[i]);
            printf("Entrou!3\n");
        }
        
    }
}
