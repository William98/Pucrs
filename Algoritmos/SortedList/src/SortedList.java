/*
 * @author Lucas Ribeiro
 *
 *  */

class SortedList {
    private class Node {
        private String data;
        private Node prev;
        private Node next;

        public Node(String d, Node p, Node n) {
            data = d;
            prev = p;
            next = n;
        }

        public String getElement() {
            return data;
        }

        public Node getPrev() {
            return prev;
        }

        public Node getNext() {
            return next;
        }

        public void setPrev(Node p) {
            prev = p;
        }

        public void setNext(Node n) {
            next = n;
        }
    }

    private Node header;
    private Node trailer;
    private int size = 0;

    public SortedList(){
        header = new Node(null, null, null);
        trailer = new Node(null, header, null);
        header.setNext(trailer);
    }

    public int size() {
        return size;
    }

    public boolean isEmpty() {
        return size == 0;
    }

    public String first() {
        if (isEmpty())
            return null;
        return header.getNext().getElement();
    }

    public String last() {
        if (isEmpty())
            return null;
        return trailer.getPrev().getElement();
    }

    public void addFirst(String d) {
        addBetween(d, trailer, header.getNext());
    }

    public void addLast(String d) {
        addBetween(d, trailer.getPrev(), header);
    }

    public void addElement(String d) {
        if (isEmpty()) {
            addFirst(d);
        } else if (d.compareToIgnoreCase(header.getElement()) <= 0) {
            addBetween(d, trailer, header.getNext());
        } else if (d.compareToIgnoreCase(trailer.getElement()) > 0) {
            addBetween(d, trailer.getPrev(), header);
        } else {
            Node aux = header.getNext();
            while (aux.getElement().compareToIgnoreCase(d) < 0)
                aux = aux.getNext();
            addBetween(d, aux, aux.getNext());
        }
    }

    public void addBetween(String d, Node predecessor, Node successor) {
        Node newest = new Node(d, predecessor, successor);
        predecessor.setNext(newest);
        successor.setPrev(newest);
        size++;
    }

    public void printList(){
        if(!isEmpty()){
            int cont = 1;
            Node aux = header.getNext();
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


}