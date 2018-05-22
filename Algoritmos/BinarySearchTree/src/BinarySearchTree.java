public class BinarySearchTree {

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
    public void insert(int data){
        if(this.root == null)
            this.root = new Node(data);
        else{
            if(data > root.getElement()){
                if(this.right == null){
                    this.right = new BinarySearchTree();
                }
                this.right.insert(data);
            }else if(data < root.getElement()){
                if(this.left == null){
                    this.left = new BinarySearchTree();
                }
                this.left.insert(data);
            }
        }
    }

    // @TODO implementar verificação de strings atraves do metodo int compareToIgnoreCase(String str)
    public Boolean isExist(int data){
        if(this.root.getElement() == data)
            return true;
        if(this.root.getElement() > data)
            return left.isExist(data);
        if(this.root.getElement() < data)
            return right.isExist(data);
        return false;
    }

    public BinarySearchTree find(int data){
        if(isExist(data)){
         

        }


        return null;
    }

    // @TODO implementar com string
    public Node getSucessor(int data){
        if(isExist(data)){
            return this.right.getMinimum();
        }
        return null;
    }

    // @TODO implementar com string
    public Node getPredecessor(int data){
        if(isExist(data)){
            return this.left.getMaximum();
        }
        return null;
    }

    /*
    * Percurso em ordem simétrica
    * inorder(t.left)
    * print(t.element)
    * inorder(t.right)
    *
    * */

    /*
     * Percurso em pre ordem
     * print(t.element)
     * preorder(t.left)
     * preorder(t.right)
     *
     * */

}
