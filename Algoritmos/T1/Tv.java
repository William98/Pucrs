import java.util.Random;

public class Tv{

  private class Canal{
    private String nome;
    private float frequencia;
    /* construtor */
    public Canal(){nome = "Canal vazio"; frequencia = 0;}
    public void setCanal(String n, float f){nome = n; frequencia = f;}
  }
  
  /* Atributos Tv */
  private boolean on;
  private boolean mute;
  private int volume;
  /* Atributos Canais */
  private Canal canais[] = new Canal[100];
  private int nCanal = 0;
  /* Contrutor Tv */
  
  private Tv(){
      on = false;
      mute = false;
      volume = 0;
      /* Inicializa todos os canais vazios */
      for(int i = 0; i < 100; i++){
          canais[i] = new Canal();
      }
  }
  /* Metodos para alterar atributos volume, on/off e mute */
  public void Power(){
    if(!on){on = true;}
    else{on = false;}
  }
  /* Metodo para mute on/off */
  public void mute(){
      if(!mute){mute = true;}
      else{mute = false;}
  }
  /* Metodo para aumentar volume */
  public void upVolume(){
      if(!on || mute){
        System.out.println("Aparelho desligado ou MUTE");
      }else{
          if(volume < 100){
              volume++;
          }else{
              System.out.println("Volume no maximo.");
          }
      }
  }
  /* Metodo para diminuir volume */
  public void downVolume(){
      if(!on || mute){
        System.out.println("Aparelho desligado ou MUTE");
      }else{
          if(volume > 0){
              volume--;
          }else{
              System.out.println("Volume no minimo.");
          }
      }
  }
  /* Metodo para capturar volume */ 
  public int getVolume(){
      if(mute){
          return 0;
      }
      return volume;
  }
  /* Metodos para manipular canais store, select, up e down */
  private void storeChannel(int i, String nome){
      if(on){
          if(canais[i].frequencia == 0){
              float frequencia = (float) (40.0 + Math.random() * (60.0 - 40.0));
              canais[i].setCanal(nome, frequencia);
          }else{
              System.out.println("Canal ocupado");
          } 
      }else{
          System.out.println("Aparelho Desligado");
      }      
  }
  /* Metodo para selecionar canal */
  public void selectChannel(int i){
      if(on)
        nCanal = i;
      else
        System.out.println("Aparelho Desligado");
    }
  /* Metodo para aumentar canal */
  public Canal upChannel(){
      if(on){
          if(nCanal == 99)
            nCanal = 0;
          else
            nCanal++;
          return canais[nCanal]; 
      }
      return null;
  }
  /* Metodo para diminuir canal */
  public Canal downChannel(){
      if(on){
            if(nCanal == 0)
                nCanal = 99;
            else
                nCanal--;
            return canais[nCanal];
      }      
      return null;
  }
  /* Metodo para obter estado atual da TV */
  public void getInfo(){
      System.out.println("-------------------------------------------------------------");
      System.out.println((on == true)?"Aparelho: ligado":"Aparelho: desligado"); // on/off
      if(on){
          System.out.println("Volume: "+getVolume()); // volume
      
          System.out.println("Canal: "+nCanal); // numero
          System.out.println("Nome: "+canais[nCanal].nome); // nome
          System.out.println("Frequencia: "+canais[nCanal].frequencia); // frequencia
      
      }
      System.out.println("-------------------------------------------------------------");     
  }
  
  public static void main(String[] args){
      Tv tv = new Tv();
      tv.Power();
      
      tv.getInfo();
      
      tv.storeChannel(12, "GLOBO");
      tv.storeChannel(10, "BAND");
      tv.storeChannel(7, "TVE");
      tv.storeChannel(5, "SBT");
      tv.storeChannel(4, "RECORD");
      
      tv.upVolume();
      tv.upVolume();
      tv.upVolume();
      
      tv.selectChannel(12);
      tv.getInfo();
      tv.Power();
      tv.getInfo();
      tv.Power();
      tv.downChannel();
      tv.downChannel();
      
      tv.getInfo();
  }
}
