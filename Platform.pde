class Platform
{
  color platformColor;
  float posX, posY,sizeX,sizeY;
  Platform(float posX, float posY, float sizeX,float sizeY, color platformColor)
  {
    this.posX = posX;
    this.posY = posY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.platformColor = platformColor;
  }
  void genPlatform()
  {
    rectMode(CENTER);
    fill(platformColor);
    rect(posX, posY,sizeX,sizeY);
  }
  
}
