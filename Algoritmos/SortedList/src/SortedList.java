/*
 * @authors Lucas Ribeiro
 *
 * 2 - Desenvolver a classe SortedList
 * Criar metodo Sort
 *  */

 class SortedList{
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
   private int size = 0;

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
   public void addElement(String d){
     if(isEmpty())
      addBetween(d, header, header.getNext());
    else{

    }
   }
   public void addBetween(String d, Node predecessor, Node successor) {
       Node newest = new Node(d, predecessor, successor);
       predecessor.setNext(newest);
       successor.setPrev(newest);
       size++;
   }


 }