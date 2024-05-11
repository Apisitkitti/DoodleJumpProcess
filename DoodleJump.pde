import processing.sound.*;
Platform[] platform = new Platform[20];
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
  player = new Player(width/2,height-200, 5);
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
  

   for (int i = 0; i<platform.length; i++) {
    platform[i].genPlatform();
    if (platform[i].Fall()) {
      spawnNewPlatform();
    }
  }
}


void createObtacle()
{
  platform[0] = new Platform(width/2,height-100,500,10,r,g,b);
  float currentY = height - 100 -50; //Above Plat[0] posY>50 
  for (int i = 1; i<platform.length; i++)
  {
    if(i % 2 ==0){ //if platform even number will spawn plat 60-150
      posX =random(60,400); 
    }
    else{//if platform odd number will spawn plat 330-400
      posX = random(60,400);
    }
    //posX = random(60,400);//if don't want odd and even number
    //posY = random(0, height);
    posY = currentY;
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    if (indexPosX != posX && indexPosY != posY)
    {
      platform[i] = new Platform(posX, posY, 60, 10, r, g, b);
      indexPosX = posX;
      indexPosY = posY;
      currentY -= random(70,90);//Spawn Next Plat posY every -70
    }
  }
  
}
void spawnNewPlatform() {
  println("Spawn new Plat");
  float currentY = platform[platform.length - 1].posY - random(70, 90);
  posX = random(60,400);
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  
  Platform newPlatform = new Platform(posX, currentY, 60, 10, r, g, b);
  
  // Shift existing platforms up and replace the last platform with the new one
  for (int i = 0; i < platform.length - 1; i++) {
    platform[i] = platform[i + 1];
  }
  platform[platform.length - 1] = newPlatform;
}



void Movement()
{
   float level = amp.analyze();
  if(keyPressed)
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
 // println(level);
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
