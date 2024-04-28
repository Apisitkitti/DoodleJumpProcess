Platform[] platform = new Platform[100];
float posX, posY,r,g,b;

void setup()
{
  size(500,500);
  background(255);
  for(int i = 0; i<platform.length;i++)
  {
    posX = random(0,width);
    posY = random(0,height);
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    platform[i] = new Platform(posX,posY,50,10,r,g,b);
  }
}
void draw()
{
  for(int i = 0; i<platform.length;i++)
  {
    platform[i].genPlatform();
  }
}
