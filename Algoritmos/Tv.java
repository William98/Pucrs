public class Tv{

  private boolean on;
  private boolean mute;
  private int numeroCanal; /* @TODO criar classe canal */
  private int volume;

  /* Construtores */
  public Tv(){
    on = false;
    mute = false;
    volume = 0;
    numeroCanal = 0; //
  }
  public Tv(boolean on, boolean mute, int canal, int volume){
    this.on = on;
    this.mute = mute;
    this.numeroCanal = canal;
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

  /* @TODO Metodo para aumentar Canal 0 até 100 */
  public void aumentaCanal(){

  }

  /* @TODO Metodo para diminuir Canal 0 até 100 */
  public void diminuiCanal(){

  }




}
