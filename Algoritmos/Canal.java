public class Canal{

  private String nome;
  private float frequencia[2];


  /* Getters and Setters */
  public void setNome(String nome){
    this.nome = nome;
  }
  public String getNome(){
    return nome;
  }

  public void setFrequencia(float frequenciaX, float frequenciaY){
    this.frequencia[0] = frequenciaX;
    this.frequencia[1] = frequenciaY;
  }
  public float getFrequencia(){

  }

}
