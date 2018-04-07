
boolean right = false, left = false, d = false, a = false;
boolean up = false, down = false, w = false, s = false;
int speed = 3;
color eat = 200;
boolean count1 = false;
boolean count2 = false;
int oneCounter = 0;
int twoCounter = 0;
Snail1 bottom;
Snail1 top;
int tail;
float foodx = random(10,490);
float foody = random(10,490);

void setup()
{
  frameRate(100);
  noStroke();
  bottom = new Snail1();
  top = new Snail1();
  top.y = 500;
  top.x = 496 + 250;
  size(1000, 1000);
  background(#385D38);
  top.c = #AE701F;
}
void keyPressed()
{
  if (keyCode == LEFT)
  {
    left = true;
  }
  if (keyCode == RIGHT)
  {
    right = true;
  }
  if (keyCode == UP)
  {
    up = true;
  }
  if (keyCode == DOWN)
  {
    down = true;
  }
  if (key == 'a')
  {
    a = true;
  }
  if (key == 'd' )
  {
    d = true;
  }
  if (key== 'w')
  {
    w = true;
  }
  if (key == 's') {
    s = true;
  }
}
void keyReleased()
{
  if (keyCode == LEFT)
  {
    left = false;
  }
  if (keyCode==RIGHT)
  {
    right = false;
  }
  if (keyCode == UP)
  {
    up = false;
  }
  if (keyCode == DOWN)
  {
    down = false;
  }
  if (key=='a')
  {
    a = false;
  } 
  if (key=='d')
  {
    d = false;
  }
  if (key== 'w')
  {
    w = false;
  }
  if (key == 's') {
    s = false;
  }
}
void draw()
{
  println("One: "+ oneCounter);
  println("Two: "+ twoCounter);
  bottom.show();
  top.show();
  if (left==true)
  {
    bottom.moveleft();
  }
  if (right==true)
  {
    bottom.moveright();
  }
  if (up==true)
  {
    bottom.moveUp();
  }
  if (down==true)
  {
    bottom.moveDown();
  }
  if (a==true)
  {
    top.moveleft();
  }
  if (d==true)
  {
    top.moveright();
  }
  if (w==true)
  {
    top.moveUp();
  }
  if (s == true)
  {
    top.moveDown();
  } 
  if (dist(foodx, foody, top.x,top.y) < 20){
    foodx = random(10,500);
    foody = random(10,500);
    count1 = true;
  }else{
    count1 = false;
  }
  if (count1 == true){
    oneCounter = oneCounter +1;
  }
  if (dist(foodx, foody, bottom.x, bottom.y) < 20){
    foodx = random(10,500);
    foody = random(10,500);
    eat = 0;
    count2 = true;
  }else{
    count2 = false;
  }
  if (count2 == true){
    twoCounter = twoCounter +1;
  }
}
class Snail1
{
  int x, y;
  color c = #CDBE7A;
  Snail1()
  {
    x=250;
    y=496;
  }
  void show()
  {
    fill(c,20);
    ellipse(x, y, 60, 60);
    fill(eat);
    ellipse(foodx, foody, 100, 100);
  }
  void moveleft()
  {
    if (x>=10)
    {
      x = x - speed;
    }
  }
  void moveright()
  {
    if (x<=990)
    {
      x += 5;
    }
  }
  void moveDown()
  {
    y =  y + speed;
    if (y >= 100) {
      y = y + 0;
    }
  }
  void moveUp()
  {
    y = y - speed;
    if (y <= 990) {
      y = y - 0;
    }
  }
}
class Food
{
  
}