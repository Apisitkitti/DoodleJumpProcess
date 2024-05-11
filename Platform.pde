class Platform
{
  float posX, posY,sizeX,sizeY,r,g,b;
  boolean FallPlat =false;
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
   boolean Fall() {
    posY += 1.1;
    // Check if the platform has reached a certain threshold
    if (posY > height) {
      FallPlat = true;
    }
    return FallPlat;
  }
}
