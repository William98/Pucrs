public class ArrayQueue{

  private int tamanho;
  private boolean fila_cheia;
  private int inicio;
  private int fim;

  /* Construtores */
  public ArrayQueue(int tamanho){
    this.tamanho = tamanho;
    this.fila_cheia = false;
    this.inicio = 0;
    this.fim = 0;
  }

  // enqueue(e): adiciona o elemento e ao final da fila; @TODO Ajustar entrada de item
  void enqueue(){
    /* Se fim for maior que zero e for igual ao inicio indica que a fila esta cheia */
    if((fim > 0) && (fim == inicio)){
      fila_cheia = true;
      System.out.println("Fila Cheia");
    }else{
      if((fim == tamanho) && (inicio == 0)){
        fila_cheia = true;
        System.out.println("Fila Cheia");
      }else{
          /* */
          fim++;
          System.out.println("Item inserido.");
      }
    }
  }

  // dequeue(): remove e retorna o primeiro elemento da fila; @TODO remover item da vetor
  void dequeue(){
    if(((inicio == 0) && (inicio == fim)) || ((inicio == fim) && (fila_cheia == 0))){
      System.out.println("Fila vazia.");
    }else{
      if(inicio == tamanho){
        inicio = 0;
        inicio++;
      }
    }
  }

  // first(): retorna o primeiro sem removê-lo;
  int first(){
    return 0;
  }
  // size(): retorna o número de elementos da fila;
  int size(){
    return 0;
  }
  // isEmpty(): retorna um booleano indicando se a fila não contém elementos.
  boolean isEmpty(){
    if(((inicio == 0) && (inicio == fim)) || ((inicio == fim) && (fila_cheia == false)))
    return false;
  }



}
