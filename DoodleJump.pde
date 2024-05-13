import processing.sound.*;
Platform[] platform = new Platform[6];
gameUI gameStart ;
Player player;
float posX, posY;
int count = 0;
float indexPosX, indexPosY;
boolean checkAlive;
PImage backgroundIMG;
AudioIn input;
Amplitude amp;
void setup()
{
  frameRate(60);
  size(500, 800);
  backgroundIMG = loadImage("./img/background.png");
  gameStart = new gameUI(width/2, height/2, 500, 600,false);
  input = new AudioIn(this, 0);
  input.start();
  amp = new Amplitude(this);
  amp.input(input);
  player = new Player(width/2, height-200, 5);
  createObtacle();
  checkAlive = true;
}
void draw()
{
  count++;
  background(backgroundIMG);
  if (gameStart.start && checkAlive)
  {
    gameStart.timeDraw();
    player.playerCreator();
    jumpController();
    player.bounce(platform);
    dead();
    player.warp();
    Movement();
    for (int i = 0; i<platform.length; i++) {
      platform[i].genPlatform();
      if (platform[i].Fall()) {
        spawnNewPlatform();
      }
    }
  } else
  {
    image(backgroundIMG,0,0);
    gameStart.UiDraw();
  }
}


void createObtacle()
{
  platform[0] = new Platform(width/2, height-100, 100, 10);
  float currentY = height - 100 -50;
  for (int i = 1; i<platform.length; i++)
  {//if platform even number will spawn plat 60-150
    posX =random(60, 400);
    posY = currentY;
    if (indexPosX != posX && indexPosY != posY)
    {
      platform[i] = new Platform(posX, posY, 80, 10);
      indexPosX = posX;
      indexPosY = posY;
      currentY -= random(70, 90);//Spawn Next Plat posY every -70
    }
  }
}


void spawnNewPlatform() {
  float currentY = platform[platform.length - 1].posY - random(70, 90);
  posX = random(60, 400);
  Platform newPlatform = new Platform(posX, currentY, 80, 10);

  // Shift existing platforms up and replace the last platform with the new one
  for (int i = 0; i < platform.length - 1; i++) {
    platform[i] = platform[i + 1];
  }
  platform[platform.length - 1] = newPlatform;
}


void Movement()
{
  float level = amp.analyze();
  if (keyPressed)
  {
    if (key == 'a')
    {
      player.playerLeft();
    }
    if (key == 'd' )
    {
      player.playerRight();
    }
  }
  if(level>0.01)
  {
    player.posY-= 5;
  }
}



void jumpController()
{
  if (count<=25 && player.jumpApprove)
  {
    player.playerJump();
  } else if (player.posY+player.sizeSquareY/2<=height)
  {
    player.playerFall();
    player.jumpApprove = false;
  } else
  {
    count = 0;
    player.jumpApprove = true;
  }
}
void dead()
{
  if(player.sizeSquareY+player.posY >= height)
  {
    checkAlive = false;
    gameStart.count = 0;
    player.posY = height-200;
    player.posX = width/2;
    createObtacle();
  }
}
void mousePressed()
{
  if (mouseX<gameStart.posX+gameStart.sizeX && mouseX>=gameStart.posX-gameStart.sizeX && mouseY<gameStart.posY+gameStart.sizeY && mouseY>gameStart.posY-gameStart.sizeY )
  {
    gameStart.start = true;
    checkAlive = true;
  }
}
