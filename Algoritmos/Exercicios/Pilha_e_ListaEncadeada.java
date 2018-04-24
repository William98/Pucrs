/*
 * @author: Arthur D'Arisbo e Lucas Ribeiro
 */

// Exercicio 2

// imprime Fila
void printQueue(){
      if(isEmpty()){
           System.out.println("Fila Vazia.");
      }else{
          if(first < last){
              for (int i = first; i < last; i++) {
                  System.out.println("Fila: "+ data[i]);
              }
            }
          if(last < first){
                for (int i = first; i < tamanho; i++) {
                    System.out.println("Fila: "+ data[i]);
                }
                for (int i = 0; i < last; i++) {
                    System.out.println("Fila: "+ data[i]);
                }
          }
          if((last > 0) && (first == last)){
              for (int i=0; i<first; i++) {
                  System.out.println("Fila: "+ data[i]);
                 }
              for (int i=first; i<tamanho; i++) {
                  System.out.println("Fila: "+ data[i]);
              }
          }
      }
}

// imprimi Pilha
void printStack(){
	if(isEmpty()){
		System.out.println("Pilha vazia");
	}
	else{
		for(int i = top; i > -1; i--){
			System.out.println("Pilha: "+ data[i]);
		}

	}
}

// Exercicio 4

class CircularlyLinkedQueue{

    private class Queue{
        private String dado;
        private Queue prev;
        private Queue next;
        public Queue(String d, Queue p, Queue n){
            dado = d;
            prev = p;
            next = n;
        }
        public String getDado(){ return dado; }
        public Queue getPrev(){ return prev; }
        public void setPrev(Queue p){ prev = p; }
        public Queue getNext(){ return next; }
        public void setNext(Queue n){ next = n; }
    }

    public Queue header = null;
    public Queue trailer = null;
    private int size = 0;
    private int limit = 10;

    public CircularlyLinkedQueue(){
        header = new Queue(null, null, null);
        trailer = new Queue(null, header, null);
        header.setNext(trailer);
    }

    public int getSize(){ return size; }

    public void addBetween(String d, Queue p, Queue n){
        Queue aux = new Queue(d, p, n);
        p.setNext(aux);
        n.setPrev(aux);
        size++;
    }

    public void enqueue(String d){
        if(size < 10)
            addBetween(d, header, header.getNext());
        else
            System.out.println("Fila Cheia");
    }

    public void dequeue(){
        if(size > 0){
            header = header.getNext();
            size--;
        }else{
            System.out.println("Fila Vazia");
        }
    }
}
