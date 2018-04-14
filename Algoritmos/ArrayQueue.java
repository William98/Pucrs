public class ArrayQueue{

  private int tamanho;
  private String[] dado;
  private boolean fila_cheia;
  private int inicio;
  private int fim;

  /* Construtores */
  public ArrayQueue(int tamanho){
    this.tamanho = tamanho;
    this.dado = new String[tamanho];
    this.fila_cheia = false;
    this.inicio = 0;
    this.fim = 0;
  }

  // enqueue(e): adiciona o elemento e ao final da fila; @TODO Ajustar entrada de item
  void enqueue(String e){
    /* Se o ultimo elemento da fila é não é a posicao zero e se o ultimo e o primeira são os mesmos */
    if((fim > 0) && (fim == inicio)){
      fila_cheia = true;
      System.out.println("Fila Cheia");
    }else{
      /* Verifica se a posicao do ultimo elemento da fila é igual ao tamanho e se o primeiro esta na posicao zero*/
      if((fim == tamanho) && (inicio == 0)){
        fila_cheia = true;
        System.out.println("Fila Cheia");
      }else{
        /*  */
        if((fim == tamanho) && (inicio > 0)){
          fim = 0;
          dado[fim] = e;
          fim++;
          System.out.println("Item inserido");
           /* Senão insere o elemento no final da fila */
        }else{
          dado[fim] = e;
          fim++;
          System.out.println("Item inserido.");
        }
      }
    }
  }

  // dequeue(): remove e retorna o primeiro elemento da fila; @TODO remover item da vetor
  void dequeue(){
    if(((inicio == 0) && (inicio == fim)) || ((inicio == fim) && (!fila_cheia))){
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
    return dado[inicio];
  }
  // size(): retorna o número de elementos da fila;
  int size(){
    int size = 0; 
    if(((inicio == 0) && (inicio == fim)) || ((inicio == fim) && (fila_cheia == false))){
      System.out.println("Fila vazia");
      return size;
    }else{
      if(inicio < fim)
        size = fim - inicio;
      if(fim < inicio)
        size = (tamanho - inicio) + fim;
      if((fim > 0) && (inicio == fim))
        size = inicio + (fim - tamanho);
    }
    return size;
  }
  // isEmpty(): retorna um booleano indicando se a fila não contém elementos. -- OK
  boolean isEmpty(){
    if(((inicio == 0) && (inicio == fim)) || ((inicio == fim) && (fila_cheia == false)))
      return true;
    else
      return false;
  }
}
