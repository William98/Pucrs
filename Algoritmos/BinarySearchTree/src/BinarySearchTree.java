public class BinarySearchTree {

    protected Node root;


    // Cria raiz vazia
    public BinarySearchTree(){ this.root = null; }

    // Get e Set Raiz
    public Node getRoot() {
        return root;
    }
    public void setRoot(Node root) {
        this.root = root;
    }

    public String findMin() {
        return findMin(root).getElement();
    }

    private Node findMin(Node n) {
        if(n != null){
            while(n.getLeft() != null)
                n = n.getLeft();
        }
        return n;
    }

    public String findMax() {
        return findMax(root).getElement();
    }
    private Node findMax(Node n) {
        if(n != null){
            while(n.getRight() != null)
                n = n.getRight();
        }
        return n;
    }

    public Boolean find(String d){
        if(find(d, root) != null)
            return true;
        return false;
    }

    public Node find(String d, Node n){
        if (n.getElement() == d)
            return n;
        else if ((d.compareToIgnoreCase(n.getElement()) > 0) && (n.getRight() != null))
            return find(d, n.getRight());
        else if ((d.compareToIgnoreCase(n.getElement()) <= 0) && (n.getLeft() != null))
            return find(d, n.getLeft());
        return null;
    }

    public void insert(String s) {
        root = insert(s, root);
    }

    private Node insert(String d, Node n){
        if (n == null)
            n = new Node(d);
        else if(d.compareToIgnoreCase(n.getElement()) <= 0)
            n.left = insert(d, n.getLeft());
        else if(d.compareToIgnoreCase(n.getElement()) > 0)
            n.right = insert(d, n.getRight());
        return n;
    }

    public String getSucessor(String d){
        Node aux = find(d, root);
        if (aux != null){
            if (aux.getRight() != null)
                return findMin(aux.getRight()).getElement();
            return aux.getElement();
        }
        return null;
    }

    public String getPredecessor(String d){
        Node aux = find(d, root);
        if (aux != null) {
            if (aux.getLeft() != null)
                return findMax(aux.getLeft()).getElement();
            return aux.getElement();
        }
        return null;
    }

    public void inOrder(){
        inOrder(root,0);
    }

    private static void inOrder(Node n, int i){
        String sp = "";
        for(int k=0; k<i; k++, sp+="|");
        if(n==null)
            System.out.println(sp+"*");
        else{
            inOrder(n.getLeft(), i+1);
            System.out.println(sp + n.getElement());
            inOrder(n.getRight(), i+1);
        }
    }

    public void preOrder(){
        preOrder(root, 0);
    }

    private static void preOrder(Node n, int i){
        String sp = "";
        for(int k=0; k<i; k++, sp+="|");
        if(n == null)
            System.out.println(sp+"*");
        else{
            System.out.println(sp + n.getElement());
            preOrder(n.getLeft(), i+1);
            preOrder(n.getRight(), i+1);
        }
    }

    public void proOrder(){
        proOrder(root, 0);
    }

    private static void proOrder(Node n, int i){
        String sp = "";
        for(int k=0; k<i; k++, sp+="|");
        if(n == null)
            System.out.println(sp+"*");
        else{
            proOrder(n.getLeft(), i+1);
            proOrder(n.getRight(), i+1);
            System.out.println(sp + n.getElement());
        }
    }

}
