//one working without classes and try it with picture on top; use x and y of keys
//add moving with keys
PGraphics pg;
PVector start;
boolean begin, pick, game;

void setup() {
  size(500, 500, P2D);
  pg = createGraphics(500, 500, P2D);
   
  start = new PVector(100, 100);
   
  begin = true;
  pick = false;
  game = false;
   
  noStroke();
}

void draw() {
  if (begin) {
    background(225, 50, 50);
    textSize(50);
    text("Snail Trail", 100, 200);
    
    fill(255);
    rect(100, 350, 100, 50, 20);
    
    if(mouseX>100 && mouseY>350 && mouseX<200 && mouseY<400) {
      fill(210, 230, 250);
      rect(100, 350, 100, 50, 20);
      if(mousePressed) {
        pick = true;
        begin = false;
      }
    }   
  }
  
  if(pick) {
    pickScene();
  } else if (game) {
    gameScene();
  }
    
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
  if (keyPressed && key == ' ' && game) {
    newGame();
    game=false;
  }   
}

void gameScene() {
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
}

void pickScene() {
  background(50, 225, 50);
  
  fill(255);
  rect(0, 200, 50, 50, 20);
  
  if(mouseX>0 && mouseY>200 && mouseX<50 && mouseY<250) {
    fill(230, 250, 210);
    rect(0, 200, 50, 50, 20);
    if(mousePressed) {
      game = true;
      pick = false;
    }
  }   
}


void newGame() {
 start = new PVector(100, 100);
 
 begin = true;
 pick = false;
 game = false;
 
 noStroke();
}