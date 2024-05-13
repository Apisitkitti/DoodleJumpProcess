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
  }
  void UiDraw()
  {
    rectMode(CENTER);
    fill(0);
    stroke(0);
    rect(posX,posY,sizeX,sizeY);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize((sizeX/2)-50);
    text("Start", posX,posY);
  }
  void timeDraw()
  {
   textAlign(LEFT,TOP);
   fill(0);
   textSize(50);
   text("score : "+ (count/100),0,0 );
   count++;
  }
}
 
