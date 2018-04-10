class Snail
{
  int x, y;
  color c = #CDBE7A;
  Snail()
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
    //left edge
    if (x>=50)
    {
      x -= speed;
    }
  }
  void moveright()
  {
    //right edge
    if (x<=950)
    {
      x += speed;
    }
  }
  void moveDown()
  {
    //bottom edge
    if (y <= 950) {
      y += speed;
    }
  }
  void moveUp()
  {
    //top edge
    if (y >= 50) {
      y -= speed;
    }
  }
}