/*
 * 1 - Lista duplamente encadeada
 * Criar metodo Sort
 */

public class DoublyLinkedList{
  private class Node {
    private Entry entry;
    private Node prev;
    private Node next;

    public Node(Entry e, Node p, Node n) {
        entry = e;
        prev = p;
        next = n;
    }
    public Entry getElement() { return entry; }
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
  public Entry first() {
      if (isEmpty()) return null;
      return header.getNext().getElement();
  }
  public Entry last() {
      if (isEmpty()) return null;
      return trailer.getPrev().getElement();
  }
  public void addFirst(Entry e) {
      addBetween(e, header, header.getNext());
  }
  public void addLast(Entry e) {
      addBetween(e, trailer.getPrev(), trailer);
  }
  /*public Entry removeFirst() {
      if (isEmpty()) return null;
      return remove(header.getNext());
  }*/
  // public Entry removeLast() {}
  public void addBetween(Entry e, Node predecessor, Node successor) {
      Node newest = new Node(e, predecessor, successor);
      predecessor.setNext(newest);
      successor.setPrev(newest);
      size++;
  }
  /* public Entry remove(Node node) {
      ...
      size--;
      return node.getElement;
  }*/

}

/*
 * 2 - Desenvolver a classe SortedList
 *
 */

 class SortedList{
   private class Node {
     private Entry entry;
     private Node prev;
     private Node next;

     public Node(Entry e, Node p, Node n) {
         entry = e;
         prev = p;
         next = n;
     }
     public Entry getElement() { return entry; }
     public Node getPrev() { return prev; }
     public Node getNext() { return next; }
     public void setPrev(Node p) { prev = p; }
     public void setNext(Node n) { next = n; }
   }


 }
