import processing.sound.*;
Platform[] platform = new Platform[100];
Player player;
float posX, posY, r, g, b;
int count = 0;
float indexPosX, indexPosY;
AudioIn input;
Amplitude amp;
void setup()
{
  frameRate(60);
  size(500, 1000);
  background(255);
  input = new AudioIn(this,0);
  input.start();
  
  amp = new Amplitude(this);
  amp.input(input);
  player = new Player(width/2,height-25, 5);
  createObtacle();
}
void draw()
{
  count++;
  background(255);
  player.playerCreator();
  jumpController();
  player.bounce(platform);
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
    posX = random(60, 400);
    posY = random(0, height);
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    if (indexPosX != posX && indexPosY != posY)
    {
      platform[i] = new Platform(posX, posY, 60, 10, r, g, b);
      indexPosX = posX;
      indexPosY = posY;
    }
  }
}

void Movement()
{
   float level = amp.analyze();

    if (level == 0)
    {
      player.playerLeft();
    }
    if (level >0 )
    {
      player.playerRight();
    }
  println(level);
}
void jumpController()
{
  if (count<=20 && player.jumpApprove)
  {
    player.playerJump();
  } 
  else if (player.posY  +player.sizeSquareY/2<=height)
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
