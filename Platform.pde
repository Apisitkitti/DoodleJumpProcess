class Platform
{
  float posX, posY,sizeX,sizeY,r,g,b;
  float indexPosX,indexPosY;
  Platform(float posX, float posY, float sizeX,float sizeY,float r,float g,float b)
  {
    this.posX = posX;
    this.posY = posY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.r = r;
    this.g = g;
    this.b = b;
  }
  void genPlatform()
  {
    rectMode(CENTER);
    fill(r,g,b);
    rect(posX, posY,sizeX,sizeY);
  }
  
}
