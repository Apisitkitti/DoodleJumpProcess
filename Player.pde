PImage character;
class Player
{
  int sizeSquareX =60;
  int sizeSquareY = 70;
  boolean jumpApprove = true;
  boolean fallApprove = false;
  float posX, posY, jumpForce,gravity;
  float speed = 10;
  
  Player(float posX, float posY, float jumpForce)
  {
    this.posX = posX;
    this.posY = posY;
    this.jumpForce = jumpForce;
    character = loadImage("./img/ninja.png");
  }
  void playerCreator()
  {
    imageMode(CENTER);
    image(character,posX,posY,sizeSquareX, sizeSquareY);
  }
  void playerJump()
  {
    posY -= jumpForce;
    gravity = 1;
  }
  void playerFall()
  {
    gravity = 3.2;
    posY += jumpForce+gravity;
    gravity = gravity+0.1;
  }
  void playerLeft()
  {
    posX-=speed;
  }
  void playerRight()
  {
    posX+=speed;
  }
  void warp()
  {
    if (posX-sizeSquareX/2 >width  )
    {
      posX = 0;
    }
    if (posX+sizeSquareX/2 < 0)
    {
      posX = width;
    }
  }
 
  void bounce(Platform[] p){ 
    for (Platform platform : p) {
        if(posX < platform.posX + platform.sizeX && posX + sizeSquareX > platform.posX && posY < platform.posY + platform.sizeY && posY + sizeSquareY > platform.posY && player.jumpApprove == false) {
            posY = platform.posY - sizeSquareY/2; 
            count = 0; 
            jumpApprove = true; // Assuming jumpApprove is a member variable of Player
        }
    }
  }
}
