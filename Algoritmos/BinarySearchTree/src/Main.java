/*
 * Exercicios de Árvore de Pesquisa Binária
 * @author: Arthur D'Arisbo e Lucas Ribeiro
 *
 * */

public class Main {

    public static void main(String[] args) {
	// write your code here
        BinarySearchTree t = new BinarySearchTree();
        t.insert("e");
        t.insert("d");
        t.insert("a");
        System.out.println();;
        t.insert("b");
        t.insert("f");
        t.insert("c");
        System.out.println();
        t.insert("c");
        t.insert("e");
        t.insert("z");
        if(t.getSucessor("e") != null)
            System.out.println("Sucessor: " + t.getSucessor("e"));
        if(t.getPredecessor("e") != null)
            System.out.println("Predecessor: " + t.getPredecessor("e"));
        t.inOrder();
        System.out.println();
        t.preOrder();
        System.out.println();
        t.proOrder();

    }
}
