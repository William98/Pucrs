public class BinarySearchTree {
    private class Node{
        private int data;
        public Node(int data){ this.data = data; }
        public int getElement(){ return this.data; }
    }

    private Node root;
    private BinarySearchTree right;
    private BinarySearchTree left;

    // Cria raiz vazia
    public BinarySearchTree(){
        this.root = null;
        this.right = null;
        this.left = null;
    }

    // Cria raiz com dado
    public BinarySearchTree(int data){
        this.root = new Node(data);
        this.right = null;
        this.left = null;
    }

    // Get e Set Raiz
    public Node getRoot() {
        return root;
    }
    public void setRoot(Node root) {
        this.root = root;
    }

    // Get e Set direita
    public BinarySearchTree getRight() {
        return right;
    }
    public void setRight(BinarySearchTree right) {
        this.right = right;
    }

    // Get e Set esquerda
    public BinarySearchTree getLeft() {
        return left;
    }
    public void setLeft(BinarySearchTree left) {
        this.left = left;
    }

    // getMaximum
    public Node getMaximum(){
        if(this.root == null){
            return null;
        }else{
            if(this.right != null){
                return right.getMaximum();
            }
            else{
                return root;
            }
        }
    }

    // getMinimum
    public Node getMinimum(){
        if(this.root == null){
            return null;
        }else{
            if(this.left != null){
                return left.getMinimum();
            }else{
                return root;
            }
        }
    }


    // @TODO implementar insercao ordenada atraves do metodo int compareToIgnoreCase(String str)
    public void insert(Node n){

    }

    //
    public Boolean exist(int data){
        if(this.root.getElement() == data)
            return true;

        return false;
    }

}
