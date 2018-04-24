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
