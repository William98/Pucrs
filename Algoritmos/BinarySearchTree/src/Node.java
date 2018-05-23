public class Node {
    String data;
    Node right;
    Node left;

    public Node(String data){
        this.data = data;
        this.right = null;
        this.left = null;
    }

    public String getElement(){
        return this.data;
    }

    public Node getRight() {
        return right;
    }

    public void setRight(Node right) {
        this.right = right;
    }

    public Node getLeft() {
        return left;
    }

    public void setLeft(Node left) {
        this.left = left;
    }
}
