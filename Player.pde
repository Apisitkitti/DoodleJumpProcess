class Player
{
  int sizeCircle =30;
  int sizeSquareX =30;
  int sizeSquareY = 40;
  boolean jumpApprove = true;
  boolean fallApprove = false;
  float posX, posY, jumpForce;
  float speed = 10;
  
  Player(float posX, float posY, float jumpForce)
  {
    this.posX = posX;
    this.posY = posY;
    this.jumpForce = jumpForce;
  }
  void playerCreator()
  {
    fill(0);
    noStroke();
    ellipseMode(CENTER);
    rectMode(CENTER);
    rect(posX, posY, sizeSquareX, sizeSquareY);
    fill(#FF3B3B);
    ellipse(posX, posY-50, sizeCircle, sizeCircle);
  }
  void playerJump()
  {
    posY -= jumpForce;
  }
  void playerFall()
  {
    posY += jumpForce;
  }
  void playerLeft()
  {
    posX-=speed;
  }
  void playerRight()
  {
    posX+=speed;
  }
  void bounce()
  {
    if ((sizeSquareY/2)>=height)
    {
      posY+=jumpForce;
    }
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
        if (posX + sizeSquareX/2 > platform.posX &&  
            posX - sizeSquareX/2 < platform.posX + platform.sizeX &&  
            posY + sizeSquareY/2 > platform.posY &&  
            posY - sizeSquareY/2 < platform.posY + platform.sizeY && 
            player.jumpApprove == false) {
              posY = platform.posY - sizeSquareY/2; 
              count = 0; 
              player.jumpApprove = true; 
          
        }
    }
  }
}
