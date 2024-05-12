class gameUI
{
  int sizeX, sizeY;
  float posX, posY;
  gameUI(float posX, float posY, int sizeX, int sizeY)
  {
    this.posX = posX;
    this.posY = posY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
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
   text("score : "+ (millis()/1000),0,0 );
  }
}
 
