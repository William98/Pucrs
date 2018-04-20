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
	
	public Node{
		private String data;
		private Node anterior;
		private Node proximo;
		
		public String getData(){ return data; }
		public void setData(String d){ this.data = d; }
		
		public Node getAnterior(){ return anterior; }
		public void setAnterior(Node a){ this.anterior = anterior; }
		
		public Node getProximo(){ return proximo; }
		public void setProximo(Node p){ this.proximo = proximo; }
	}
	
	private Node first = null;
	private Node last = null;
	private boolean fila_cheia = false;
	
	void enqueue(String d){
		if(last == null){
				
			
		}
	}
}
