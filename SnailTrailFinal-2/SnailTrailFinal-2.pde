import ddf.minim.*;

//minim sound!!
Minim minim;
AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;

//moving!!
boolean right = false, left = false, d = false, a = false;
boolean up = false, down = false, w = false, s = false;

boolean food; //check if can show food!!
color eat = 200; //irrelevant!!

//dealing with score counting!!
boolean count1 = false;
boolean count2 = false;
int oneCounter = 0;
int twoCounter = 0;

boolean playsound = true; //play that fanfare sound!!

//load everything!!
Snail1 bottom;
Snail1 top;
Food foodie;
PFont font40;
PGraphics pg;
PImage gameBG, title, snailImgBottom, snailImgTop, snailSideOne, snailSideTwo;
float offPos1, offPos2, offPos3, offPos4;

//move that snail!!
PVector start, velocityX, velocityY, velocity;

//make the game work!!
boolean begin, game, reset, moving1, moving2;

//list for past positions!!
IntList locationsX;
IntList locationsY;

//check if over those past positions!!
int checkx, checky, timer;

void setup()
{  
  //start up!!
  size(1000, 1000, P2D);
  pg = createGraphics(1000, 1000, P2D);
  frameRate(100);
  noStroke();

  //load everything!!
  bottom = new Snail1();
  top = new Snail1();

  gameBG = loadImage("gamebg.png");
  title = loadImage("titletext.png");
  snailImgBottom = loadImage("right.png");
  snailImgTop = loadImage("bexSnailRight.png");
  snailImgTop.resize(175, 65);
  snailImgBottom.resize(175, 65);
  offPos1 = 87;
  offPos2 = 32;
  offPos3 = 87;
  offPos4 = 32;
  snailSideOne = loadImage("snailside.png");
  snailSideTwo = loadImage("bexSnailSelect1.png");

  foodie = new Food();

  font40 = createFont("spring.ttf", 40);

  minim = new Minim(this);
  player = minim.loadFile("squish.wav");
  player1 = minim.loadFile("moveSquish.wav");
  player2 = minim.loadFile("munch.wav");
  player3 = minim.loadFile("fanfare.wav");

  //change snail 2 to start different position!!
  bottom.start.x = 500;
  bottom.topp = true;

  //clear the arraylist first thing!!
  locationsX.clear();
  locationsY.clear();

  //set those bools!!
  food = true;
  begin = true;
  game = false;
}

void keyReleased()
{
  //check if wasd/arrows were released!!
  if (keyCode == LEFT)
  {
    left = false;
    moving2 = false;
  }
  if (keyCode==RIGHT)
  {
    right = false;
    moving2 = false;
  }
  if (keyCode == UP)
  {
    up = false;
    moving2 = false;
  }
  if (keyCode == DOWN)
  {
    down = false;
    moving2 = false;
  }
  if (key=='a')
  {
    a = false;
    moving1 = false;
  } 
  if (key=='d')
  {
    d = false;
    moving1 = false;
  }
  if (key== 'w')
  {
    w = false;
    moving1 = false;
  }
  if (key == 's') {
    s = false;
    moving1 = false;
  }
}

void keyPressed()
{
  //new game!!
  if (keyPressed && key == ' ' && game) {
    newGame();
    game=false;
  } 

  //check if wasd/arrows were pressed!!
  if (keyCode == LEFT)
  {
    snailImgTop = loadImage("bexSnailLeft.png");
    snailImgTop.resize(175, 65);
    offPos1 = 87;
    offPos2 = 32;
    left = true;
    moving2 = true;
    player1.rewind();
    player1.play();
  }
  if (keyCode == RIGHT)
  {
    snailImgTop = loadImage("bexSnailRight.png");
    snailImgTop.resize(175, 65);
    offPos1 = 87;
    offPos2 = 32;
    right = true;
    moving2 = true;
    player1.rewind();
    player1.play();
  }
  if (keyCode == UP)
  {
    snailImgTop = loadImage("bexSnailUp.png");
    snailImgTop.resize(65, 175);
    offPos1 = 32;
    offPos2 = 87;
    up = true;
    moving2 = true;
    player1.rewind();
    player1.play();
  }
  if (keyCode == DOWN)
  {
    snailImgTop = loadImage("bexSnailDown.png");
    snailImgTop.resize(65, 175);
    offPos1 = 32;
    offPos2 = 87;
    down = true;
    moving2 = true;
    player1.rewind();
    player1.play();
  }
  if (key == 'a')
  {
    snailImgBottom = loadImage("left.png");
    snailImgBottom.resize(175, 65);
    offPos3 = 87;
    offPos4 = 32;
    a = true;
    moving1 = true;
    player1.rewind();
    player1.play();
  }
  if (key == 'd' )
  {
    snailImgBottom = loadImage("right.png");
    snailImgBottom.resize(175, 65);
    offPos3 = 87;
    offPos4 = 32;
    d = true;
    moving1 = true;
    player1.rewind();
    player1.play();
  }
  if (key== 'w')
  {
    snailImgBottom = loadImage("up.png");
    snailImgBottom.resize(65, 175);
    offPos3 = 32;
    offPos4 = 87;
    w = true;
    moving1 = true;
    player1.rewind();
    player1.play();
  }
  if (key == 's') {
    snailImgBottom = loadImage("down.png");
    snailImgBottom.resize(65, 175);
    offPos3 = 32;
    offPos4 = 87;
    s = true;
    moving1 = true;
    player1.rewind();
    player1.play();
  }
}

void draw()
{
  if (begin) {
    //background!!
    image(title, 0, 0, 1000, 1000);

    //button go!!
    fill(255);
    rect(750, 500, 175, 100, 20);
    fill(0);
    textFont(font40);
    text("Go!", 795, 565);

    if (mouseX>750 && mouseY>500 && mouseX<925 && mouseY<600) {
      fill(210, 230, 250);
      rect(750, 500, 175, 100, 20);
      fill(0);
      text("Go!", 795, 565);
      if (mousePressed) {
        player.rewind();
        player.play();
        game = true;
        begin = false;
      }
    }
  }

  if (game) {
    gameScene();
  }
}

void gameScene() {
  //move!!
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
  //draw the trail and snail!!
  image(gameBG, 0, 0);
  top.show(pg);
  bottom.show(pg);
  image(pg, 0, 0);

  //draw the snail on top!!
  top.makeSnail();
  bottom.makeSnail();
  reset = false;

  //display the food!!
  foodie.changeFoodTop();
  foodie.changeFoodBottom();

  foodie.displayFood();

  //your score text!!
  fill(0);
  textFont(font40);
  text("One:"+ oneCounter, 10, 50);
  text("Two:"+ twoCounter, 840, 50);

  if (oneCounter >= 10) {
    fill(255, 150);
    rect(50, 75, 900, 900, 45);
    fill(0);
    text("Player One Won!", 100, 200);
    image(snailSideOne, 100, 225, 400, 200);
    text("Press space to play again.", 100, 500);
    if (playsound) {
      player3.rewind();
      player3.play(); 
      playsound=false;
    }
  }

  if (twoCounter >= 10) {
    fill(255, 150);
    rect(50, 75, 900, 900, 45);
    fill(0);
    text("Player Two Won!", 100, 200);
    image(snailSideTwo, 100, 225, 400, 200);
    text("Press space to play again.", 100, 500);
    if (playsound) {
      player3.rewind();
      player3.play(); 
      playsound=false;
    }
  }

  //check to slow you down or not!!
  if(moving1) {
    top.checkLocation();
  }
  if(moving2){
    bottom.checkLocation();
  }

  if (moving1) {
    top.addLocations();
  }
  if (moving2) {
    bottom.addLocations();
  }

  //println("uno:"+moving1);
  //println("two:"+moving2);
}

void newGame() {
  //reset everything!!
  if (!reset) {
    resetPG();
    reset = true;
  }
  top.reset();
  bottom.reset();

  begin = true;
  game = false;
  oneCounter=0;
  twoCounter=0;

  noStroke();

  //change snail 2 to start different position!!
  bottom.start.x = 500;
  bottom.topp = true;

  //clear the arraylist first thing!!
  locationsX.clear();
  locationsY.clear();

  playsound=true;
}

void resetPG() {
  pg.beginDraw();
  pg.clear();
  pg.endDraw();
}