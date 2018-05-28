public class Main {

    public static void main(String[] args) {
        // write your code here
        DoublyLinkedList dll = new DoublyLinkedList();
        SortedList sl = new SortedList();

        dll.addLast("Neo");
        dll.addLast("Trinity");
        dll.addFirst("Morpheus");
        dll.addLast("Smith");
        dll.addFirst("Gandalf");
        dll.addFirst("Aragorn");
        dll.addFirst("Legolas");
        dll.addLast("Gimbli");

        System.out.println("-- LISTA DUPLAMENTE ENCADEADA --");
        System.out.println("--------------------------------");
        dll.printList();

        /* Ordenacao da Lista Duplamente Encadeada via Bubble Sort */
        dll.Sort();
        System.out.println("--       LISTA ORDENADA       --");
        System.out.println("--------------------------------");
        dll.printList();


        sl.addElement("Neo");
        sl.addElement("Trinity");
        sl.addElement("Morpheus");
        sl.addElement("Smith");
        sl.addElement("Gandalf");
        sl.addElement("Aragorn");
        sl.addElement("Legolas");
        sl.addElement("Gimbli");

        sl.printList();

        System.out.println("--------------");


    }
}