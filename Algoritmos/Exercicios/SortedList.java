/*
 * 1 - Lista duplamente encadeada
 * Criar metodo Sort
 */

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
  public String removeFirst(){
    if(isEmpty()) return null;
    Node aux = header;
    header = header.getNext();
    size--;
    return aux.getElement();

  }
  public String removeLast(){
    if(isEmpty()) return null;
    Node aux = trailer;
    trailer = trailer.getPrev();
    size--;
    return aux.getElement();
  }
  public void addBetween(String d, Node predecessor, Node successor) {
      Node newest = new Node(d, predecessor, successor);
      predecessor.setNext(newest);
      successor.setPrev(newest);
      size++;
  }
// @TODO testar metodo Sort e Ajustar metodos de exclusão para padrão abaixo
  public void Sort(){
    Node aux1, aux2;
  }
  public void QuickSort(){

  }
// public Entry removeFirst() {
//    if (isEmpty()) return null;
//    return remove(header.getNext());
//  }
// public Entry removeLast() {}
// public String remove(Node n) {
//
//     size--;
//     return n.getElement();
// }
}

/* @TODO
 * 2 - Desenvolver a classe SortedList
 *
 */

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
