package televisao;

public class Tv{

  private class Canal{

    private int numeroCanal;
    private float frequencia;
    private Canal next;

    /* construtor */
    public Canal(int numeroCanal, float frequencia, Canal next){
        this.numeroCanal = numeroCanal;
        this.frequencia = frequencia;
        this.next = next;
    }

    /* Metodos do canal */
    public int getNome(){ return numeroCanal; }
    public float getFrequencia(){ return frequencia; }
    public Canal getNext(){ return next; }
    public void setNext(Canal c){ next = c;}

  }

  private boolean on;
  private boolean mute;
  private int volume;
  private int qtdCanais;
  private Canal canal; /* @TODO Obj canal atual */
  private Canal proxCanal;
  private Canal antCanal;

  /* Construtores */
  public Tv(){
    on = false;
    mute = false;
    volume = 0;
    qtdCanais = 0;
  }
  public Tv(boolean on, boolean mute, Canal canal, int volume){
    this.on = on;
    this.mute = mute;
    this.canal = canal;
    this.volume = volume;
  }

  /* Metodo para ligar/desligar TV */
  public void Power(){
    if(!on){ on = true; }
    else{ on = false; }
  }

  /* Metodo para obter volume */
  public int getVolume(){
    if(mute){
      System.out.System.out.println("MUTE");
      return 0;
    }
    return volume;
  }

  /* Metodo para aumentar Volume */
  public void aumentaVolume(){
    if(volume<100){
        volume++;
    }
    else{
        System.out.println("Volume está no máximo");
    }
  }

  /* Metodo para diminuir Volume */
  public void diminuiVolume(){
    if(volume>0){
      volume--;
    }
    else{
      System.out.println("Volume está no mínimo");
    }
  }

  /* @TODO Metodo storeCanal */
  public void storeCanal(int numero, float x, float y){
    canal = new Canal(numero, x, y, null);
    canal.setNext();
    qtdCanais++;
  }

  /* @TODO Metodo seleciona o canal atraves do numero */
  public void selecionaCanal(int n){


  }

  /* @TODO Metodo para aumentar Canal 0 até 100 */
  public void aumentaCanal(){

  }

  /* @TODO Metodo para diminuir Canal 0 até 100 */
  public void diminuiCanal(){

  }




}
