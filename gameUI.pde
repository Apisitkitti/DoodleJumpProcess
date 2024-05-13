PImage menuGame,button;
PFont uiFont;
class gameUI
{
  int sizeX, sizeY;
  float posX, posY;
  int count;
  boolean start = false;
  gameUI(float posX, float posY, int sizeX, int sizeY,boolean start)
  {
    this.posX = posX;
    this.posY = posY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.start = start;
    menuGame = loadImage("./img/menu.png");
    button = loadImage("./img/button.png");
    uiFont = createFont("al-seana",50);
    
  }
  void UiDraw()
  {
    background(menuGame);
    imageMode(CENTER);
    image(button,posX,posY,sizeX,sizeY);
  }
  void timeDraw()
  {
   textAlign(LEFT,TOP);
   
   textFont(uiFont);
   fill(0);
   text("score : "+ (count/100),0,0 );
   count++;
  }
}
 
