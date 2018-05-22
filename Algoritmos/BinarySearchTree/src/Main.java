public class Main {

    public static void main(String[] args) {
	// write your code here
        BinarySearchTree ab = new BinarySearchTree();
        ab.insert(41);
        ab.insert(21);
        ab.insert(29);
        ab.insert(11);
        ab.insert(32);
        ab.insert(65);
        ab.insert(50);
        ab.insert(91);
        ab.insert(72);
        ab.insert(99);

        if(ab.isExist(91)){
            System.out.println("Encontrado");
            //System.out.println("" + ab.getMinimum().getElement());
            System.out.println("Sucessor: " + ab.getSucessor(20));
            System.out.println();
        }

    }
}
