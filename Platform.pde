PImage platformSkin, platformSkin2;
class Platform
{
  float posX, posY, sizeX, sizeY;
  float speedUp;
  boolean FallPlat =false;
  int hitTime = 1;
  Platform(float posX, float posY, float sizeX, float sizeY)
  {
    this.posX = posX;
    this.posY = posY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.speedUp = 2;
    platformSkin = loadImage("./img/platform.png");
  }
  void genPlatform()
  {
    imageMode(CENTER);
    image(platformSkin, posX, posY, sizeX, sizeY);
  }


  boolean Fall() {
    posY += speedUp;
    speedUp+=0.002;
    // Check if the platform has reached a certain threshold
    if (posY > height) {
      FallPlat = true;
    }
    return FallPlat;
  }
}
