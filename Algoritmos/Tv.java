import java.util.Random;

public class Tv{

  private class Canal{

    private String nome;
    private float frequencia;
    private Canal next;

    /* construtor */
    public Canal(){nome = "Canal vazio"; frequencia = 0;}
    public Canal(String n, float f){nome = n; frequencia = f;}

  }

  private boolean on;
  private boolean mute;
  private int volume;
  /* @TODO Canais */
  private Canal canal = null; 
  private Canal first = null;
  private Canal last = null;
  private int size = 0;

  /* Construtor */
  public Tv(){
    on = false;
    mute = false;
    volume = 0;
  }
  
  /* Metodo para ligar/desligar TV */
  public void Power(){
    if(!on){ on = true; }
    else{ on = false; }
  }

  /* Metodo para obter volume */
  public void mute(){
    if(!mute){mute = true;}
    else{mute = false;}
  }

  /* Metodo para aumentar Volume */
  public void aumentaVolume(){
    if(!on)
      System.out.println("TV desligada");
    else{
      if(mute){
          System.out.println("MUTE");
      }else{
        if(volume<100){
            volume++;
        }
        else{
            System.out.println("Volume está no máximo");
        }
      }
    }
  }

  /* Metodo para diminuir Volume */
  public void diminuiVolume(){
    if(!on)
      System.out.println("TV desligada");
    else{
      if(mute){
          System.out.println("MUTE");
      }else{
          if(volume>0){
              volume--;
          }
          else{
              System.out.println("Volume está no mínimo");
          }
      }
    }
  }

  /*  Metodo storeCanal recebe como parametro o nome do canal */
  public void storeChannel(String n){
    float f = (float) (40.0 + Math.random() * (60.0 - 40.0)); // gera frequencia aleatoria
    Canal canal = new Canal(n, f);
    if (size == 0){
      last = canal;
      first = last;
    }
    else{
      last.next = canal;
      last = canal;
    }
    size++;
  }

  /* Metodo seleciona o canal atraves do nome. @TODO quando canal não existe  */
  public Canal selecionaCanal(String n){
    Canal aux = first;
    if(size == 0){
      return null;
    }
    for(int i = 0; i < size; i++){
      if(aux.nome == n){
          return aux;
      }
      aux = aux.next;
    }        
    return null;
  }

  /* @TODO Metodo para aumentar Canal 0 até 99 */
  public void aumentaCanal(){

  }

  /* @TODO Metodo para diminuir Canal 0 até 99 */
  public void diminuiCanal(){

  }

  /* Metodo para obter informações sobre os status da televisão*/
  public void getInfo(){
    if(on){
      System.out.println(""); // on/off
      if (!mute)
        System.out.println("Volume: "+this.volume); // volume  
      else    
        System.out.println("Volume mutado");
      System.out.println("Canal: "+this.canal.nome); // canal
    }else{
      System.out.println("Aparelho Desligado");
    }
  }

  public static void main(String[] args){
    Tv tv = new Tv();
    tv.Power(); // Ligo a TV
    
    // Cadastro canais aleatórios
    tv.storeChannel("GLOBO");
    tv.storeChannel("TVE");
    tv.storeChannel("SBT");
    tv.storeChannel("BAND");
    tv.storeChannel("RECORD");

    tv.canal = tv.selecionaCanal("TVE");

    tv.aumentaVolume();
    tv.mute(); // mute ON
    tv.aumentaVolume();
    tv.mute(); // mute OFF
    tv.aumentaVolume();
    tv.aumentaVolume();

    tv.getInfo();

    tv.diminuiVolume();
    tv.diminuiVolume();
    tv.diminuiVolume();
    tv.diminuiVolume(); // erro volume esta em zero

    tv.getInfo();

  }
}
