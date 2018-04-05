//one working without classes and try it with picture on top; use x and y of keys
//add moving with keys
PGraphics pg;
PVector start;

void setup() {
 size(500, 500, P2D);
 pg = createGraphics(500, 500, P2D);
 
 start = new PVector(100, 100);
}

void draw() {
  background(75, 255, 150);
  pg.beginDraw();
  pg.noStroke();
  pg.fill(75, 255, 150, 5);
  pg.rect(0, 0, 500, 500);
  pg.fill(255);
  pg.ellipse(start.x, start.y, 15, 15);
  pg.endDraw();
 
  image(pg, 0, 0);
 
  fill(255,0,0);
  ellipse(start.x, start.y, 20, 20);

  if (keyPressed) {
    if(keyCode == UP) {
      start.y-=2; 
    } else if(keyCode == DOWN) {
      start.y+=2;  
    } else if(keyCode == LEFT) {
      start.x-=2;  
    } else if(keyCode == RIGHT) {
      start.x+=2;  
    } 
  }
  if (keyPressed && key == ' ') {
    newGame();
  }   
}

void newGame() {
  background(75, 255, 150);
}