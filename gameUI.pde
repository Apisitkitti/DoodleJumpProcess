PImage menuGame, button;
PFont uiFont;
class gameUI
{
  int sizeX, sizeY;
  float posX, posY;
  int count;
  boolean start = false;
  int highscore;
  int score;
  gameUI(float posX, float posY, int sizeX, int sizeY, boolean start)
  {
    this.posX = posX;
    this.posY = posY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.start = start;
    menuGame = loadImage("./img/menu.png");
    button = loadImage("./img/button.png");
    uiFont = createFont("./font/al-seana.otf",10);
  }
  void UiDraw()
  {
    background(menuGame);
    imageMode(CENTER);
    image(button, posX, posY, sizeX, sizeY);
    textAlign(CENTER,BOTTOM);
    textFont(uiFont);
    textSize(40);
    fill(0);
    text("Highscore : "+ highscore, posX+120,posY+210);
  }
  void timeDraw()
  {
    textAlign(LEFT, TOP);
    textFont(uiFont);
    textSize(40);
    fill(0);
    text("score : "+ (count/100), 0, 0 );
    count++;
    if (highscore<(count/100))
    {
      highscore = count/100;
    }
  }
}
