/**
 * Classe ArrayQueue
 *
 * @author: Arthur D'Arisbo e Lucas Ribeiro
 * @methods: enqueue, dequeue, first, size and isEmpty
 * 
 */

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

  // enqueue(e): adiciona o elemento e ao final da fila;
  // @param String e - é o valor a ser adicionado na fila.
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
        /* Verifica se o tamanho foi removido algum item da fila e adiciona no "inicio" */
        if((fim == tamanho) && (inicio > 0)){
          fim = 0;
          dado[fim] = e;
          System.out.println("Item inserido " + dado[fim]);
          fim++;
          /* Senão insere o elemento no final da fila */
        }else{
          dado[fim] = e;
          System.out.println("Item inserido " + dado[fim]);
          fim++;
        }
      }
    }
  }

  // dequeue(): remove e retorna o primeiro elemento da fila;
  String dequeue(){
    // Verifica se a fila esta vazia antes de remover
    if(((inicio == 0) && (inicio == fim)) || ((inicio == fim) && (!fila_cheia))){
      System.out.println("Fila vazia.");
      return null;
    }else{
      // Verifica se o inicio da fila é igual ao tamanho original e move o indice para o proximo
      if(inicio == tamanho){
        inicio = 0;
      }
      inicio++;
    }
    return dado[inicio];
  }

  // first(): retorna o primeiro sem removê-lo;
  String first(){
    return dado[inicio];
  }
  // size(): retorna o número de elementos da fila;
  int size(){
    int size = 0; 
    // Verifica se a fila esta vazia.
    if(((inicio == 0) && (inicio == fim)) || ((inicio == fim) && (fila_cheia == false))){
      System.out.println("Fila vazia");
      return size;
    // Calcula o tamanho da fila
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
  public static void main(String[] args){
      ArrayQueue myQueue = new ArrayQueue(5);
      myQueue.enqueue("Neo"); 
      myQueue.enqueue("Trinity"); 	
      myQueue.enqueue("Smith"); 
      myQueue.enqueue("Morpheus"); 
      myQueue.enqueue("Alex");
      System.out.println("Primeiro: "+ myQueue.first());
      System.out.println("Queue size: " + myQueue.size());
      System.out.println("----------------------------------");
      myQueue.enqueue("Alexsander");
      System.out.println("Removendo da Fila.\nPrimeiro: "+myQueue.dequeue());
      System.out.println("----------------------------------");
      myQueue.enqueue("Alexsander");
      System.out.println("----------------------------------");
      System.out.println("Removendo da Fila.\nPrimeiro: "+myQueue.dequeue());
      System.out.println("----------------------------------");
      System.out.println("Removendo da Fila.\nPrimeiro: "+myQueue.dequeue());
      System.out.println("----------------------------------");
      System.out.println("Removendo da Fila.\nPrimeiro: "+myQueue.dequeue());
      System.out.println("----------------------------------");
      myQueue.enqueue("Lucas");
      myQueue.enqueue("Jonas");
      myQueue.enqueue("Vladmir");
      myQueue.enqueue("Arthur");
      System.out.println("----------------------------------");
  }
}
