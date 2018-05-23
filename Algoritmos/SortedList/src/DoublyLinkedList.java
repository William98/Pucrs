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
    /* Metodo para remover primeiro node sem a implementacao do remove */
    // public String removeFirst(){
    // if(isEmpty()) return null;
    // Node aux = header;
    // header = header.getNext();
    // size--;
    // return aux.getElement();

    // }
    /* Metodo para remover ultimo node sem a implementacao do remove */
    // public String removeLast(){
    // if(isEmpty()) return null;
    // Node aux = trailer;
    // trailer = trailer.getPrev();
    // size--;
    // return aux.getElement();
    // }

    public void addBetween(String d, Node predecessor, Node successor) {
        Node newest = new Node(d, predecessor, successor);
        predecessor.setNext(newest);
        successor.setPrev(newest);
        size++;
    }
    // @TODO Criar metodo Sort e Quick Sort
    public void Sort(){
    }
    public void QuickSort(){
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
}

