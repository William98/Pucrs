/*
 * @authors Lucas Ribeiro
 *
 * 1 - Lista duplamente encadeada
 * Criar metodo Sort
 *  */


public class DoublyLinkedList{
    private class Node {
        private String data;
        private Node prev;
        private Node next;

        public Node(String d, Node p, Node n) {
            data = d;
            prev = p;
            next = n;
        }
        public String getElement() { return data; }
        public Node getPrev() { return prev; }
        public Node getNext() { return next; }
        public void setPrev(Node p) { prev = p; }
        public void setNext(Node n) { next = n; }
    }

    private Node header;
    private Node trailer;
    private int size = 0 ;

    public DoublyLinkedList() {
        header = new Node(null, null, null);
        trailer = new Node(null, header, null);
        header.setNext(trailer);
    }
    public int size() { return size; }
    public boolean isEmpty() { return size == 0; }

    public String first() {
        if (isEmpty()) return null;
        return header.getNext().getElement();
    }

    public String last() {
        if (isEmpty()) return null;
        return trailer.getPrev().getElement();
    }

    public void addFirst(String d) {
        addBetween(d, header, header.getNext());
    }
    public void addLast(String d) {
        addBetween(d, trailer.getPrev(), trailer);
    }

    public void addBetween(String d, Node predecessor, Node successor) {
        Node newest = new Node(d, predecessor, successor);
        predecessor.setNext(newest);
        successor.setPrev(newest);
        size++;
    }

    public String removeFirst() {
        if (isEmpty()) return null;

        return remove(header.getNext());
    }
    public String removeLast() {
        if(isEmpty()) return null;
        return remove(trailer.getPrev());
    }
    public String remove(Node n) {
        Node ant = n.getPrev();
        Node prox = n.getNext();
        ant.setNext(prox);
        prox.setPrev(ant);
        size--;
        return n.getElement();
    }

    public void printList(){
        if(!isEmpty()){
            int cont = 1;
            Node aux = header;
            while(aux != trailer){
                System.out.println(cont + " - " + "String: " + aux.getElement());
                System.out.println();
                aux = aux.getNext();
                cont++;
            }
        }else{
            System.out.println("Lista Vazia");
        }

    }

    // @TODO Metodo não esta funcionando
    public void Sort(){
        if(size() > 0){

            Node aux1 = header;
            for (int i = 0; i < size; i++){
                int tam = size;
                for(int j = 0; j < tam - i; j++){
                    if(aux1.getElement().compareToIgnoreCase(aux1.getNext().getElement()) > 0) {
                        Node aux2 = aux1;
                        aux1 = aux1.getNext();
                        aux2.setNext(aux2);
                    }
                }
            }
        }else{
            System.out.println("Não foi possível ordenar.");
            System.out.println("LISTA VAZIA");
        }
    }


}

