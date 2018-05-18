/*
 * Exercicios Árvore Binária de Busca
 */
public class ArvoreBinaria{
  private class Node{
    private String data;
    public Node(String d){ data = d; }
    public String getElemento() { return data; }
  }
  
  private Node raiz;
  private ArvoreBinaria esquerda;
  private ArvoreBinaria direita;
  
  public ArvoreBinaria(){ }
  
  /* Get e Set Raiz */
  public void setRaiz(Node n){ this.raiz = n; }
  public Node getRaiz(){ return raiz; }
  
  /* Get e Set Esquerda */
  public void setEsquerda(ArvoreBinaria a){ this.esquerda = a; }
  public ArvoreBinaria getEsquerda(){ return esquerda; }
  
  /* Get e Set Direita */
  public void setDireita(ArvoreBinaria a){ this.direita = a; }
  public ArvoreBinaria getDireita(){ return direita; }
  
  /* Metodo de insercao */
  /* @TODO implementar insercao ordenada atraves do metodo int compareToIgnoreCase(String str)*/
  public void inserir(Node n){
    if(this.raiz == null)
     this.raiz = n;
    else{
      if(n.getElemento() > raiz.getElemento()){
        if(this.direita == null){
          this.direita = new ArvoreBinaria();
        }
        this.direita.inserir(n);
      }else if(n.getElemento() < raiz.getElemento()){
        if(this.esquerda == null){
          this.esquerda = new arvoreBinaria();
        }
        this.esquerda.inserir(n);
      }
    }
  }
  
  
}

/* https://www.tutorialspoint.com/java/java_string_comparetoignorecase.htm */
/* https://gist.github.com/leandrogualter/613689/c6e9405eb842e810035400cd15bf9f4049ffddbb */
