Platform[] platform = new Platform[100];
color platformColor;
float posX, posY,sizeX,sizeY;
void setup()
{
  size(500,500);
  for(int i = 0; i<platform.length;i++)
  {
    posX = random(0,width);
    posY = random(0,height);
    //platform[i] = new Platform();
  }
}
void draw()
{
  
}
