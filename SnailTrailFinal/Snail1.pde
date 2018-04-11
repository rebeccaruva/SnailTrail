class Snail1
{
  //load what will move the snail!!
  PVector start, velocityX, velocityY, velocity;
  boolean topp;
  boolean timeStart;
  
  Snail1() {
    
    start = new PVector(100, 100);
    velocityX = new PVector (2, 0);
    velocityY = new PVector (0, 2);
    velocity = new PVector(2, 2);
    topp = false;
    
    //make a list!!
    locationsX = new IntList();
    locationsY = new IntList();
    
  }
  void show(PGraphics pg)
  {
    //snail trails!!
    pg.beginDraw();
    pg.noStroke();
    pg.fill(255,150);
    pg.ellipse(start.x, start.y, 60, 60);
    pg.tint(255, 5);
    pg.image(gameBG, 0, 0, 1000, 1000);
    pg.endDraw();
  }
  void moveleft()
  {
    //left edge!!
    if (start.x>=50)
    {
      start.sub(velocityX);
    }
    //println(velocityX);
  }
  void moveright()
  {
    //right edge!!
    if (start.x<=950)
    {
      start.add(velocityX);
    }
    //println(velocityX);
  }
  void moveDown()
  {
    //bottom edge!!
    if (start.y <= 950) {
      start.add(velocityY);
    }
    //println(velocityY);
  }
  
  void moveUp()
  {
    //top edge!!
    if (start.y >= 50) {
      start.sub(velocityY);
    }
    //println(velocityY);
  }
  
  void makeSnail() {
    //draw the snail!!
    if(topp) {
      image(snailImgTop, start.x-offPos1, start.y-offPos2);
    } else {
      image(snailImgBottom, start.x-offPos3, start.y-offPos4);
    }
  }
  void checkLocation() {
    for(int i=0; i<locationsX.size();i++) {
    checkx = locationsX.get(i);
    checky = locationsY.get(i);
      if(checkx == int(start.x) && checky == int(start.y)) {
        println("OMG MY SLIME");
        //if(moving1) {
        //  velocityX.x = 1;
        //  velocityY.y = 1;
        //}
        //if(moving2) {
        //  velocityX.x = 1;
        //  velocityY.y = 1;
        //}
        //timer = millis();
        //timeStart = true;
        
        //println(velocityX.x+", "+velocityY.y);
      }
      if(millis()>timer+5000 && timeStart) {
      //println(timer);
      timer = 0;
      velocityX.x = 2;
      velocityY.y = 2;
      timeStart = false;
    }
    }
  
  }
  
  void addLocations() {
    if(moving1 || moving2) {
      locationsX.append(int(start.x));
      locationsY.append(int(start.y));
      println("i added");
    }
  }
  
  void reset() {
    locationsX.clear();
    locationsY.clear();
    velocityX.x = 2;
    velocityY.y = 2;
  
    start = new PVector(100, 100);
  }
}