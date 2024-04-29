class Player
{
  int sizeCircle =50;
  int sizeSquareX =50;
  int sizeSquareY = 50;
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
   if(jumpApprove)
   {
     posY -= jumpForce;
   }
   
  }
  void fallDown()
  {
    if(fallApprove)posY +=jumpForce;
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
    if((sizeSquareY/2)>=height)
    {
      posY+=jumpForce;
    }
  }
  void warp()
  {
    if(posX-sizeSquareX/2 >width  )
    {
      posX = 0;
    }
    if(posX+sizeSquareX/2 < 0)
    {
      posX = width;
    }
  }
}
