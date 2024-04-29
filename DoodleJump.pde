Platform[] platform = new Platform[10];
Player player;
float posX, posY, r, g, b;
int count = 0;
float indexPosX, indexPosY;
void setup()
{
  frameRate(60);
  size(500, 500);
  background(255);
  player = new Player(width/2,height-25, 5);
  createObtacle();
}
void draw()
{
  count++;
  background(255);
  player.playerCreator();
  jumpController();
  player.bounce();
  player.warp();
  Movement();


  for (int i = 0; i<platform.length; i++)
  {
    platform[i].genPlatform();
  }
}


void createObtacle()
{
  for (int i = 0; i<platform.length; i++)
  {
    posX = random(100, 400);
    posY = random(0, 400);
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    if (indexPosX != posX && indexPosY != posY)
    {
      platform[i] = new Platform(posX+50, posY+20, 50, 10, r, g, b);
      indexPosX = posX;
      indexPosY = posY;
    }
  }
}


void Movement()
{
  if (keyPressed)
  {
    if (key == 'a')
    {
      player.playerLeft();
    }
    if (key == 'd')
    {
      player.playerRight();
    }
  }
}
void jumpController()
{
  if (count<=10 && player.jumpApprove)
  {
    player.playerJump();
  } 
  else if (player.posY+player.sizeSquareY/2<=height)
  {
   player.playerFall();
   player.jumpApprove = false; 
  }
  else
  {
    count = 0;
    player.jumpApprove = true;
  }
  
}
