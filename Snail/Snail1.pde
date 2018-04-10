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