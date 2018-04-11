class Food
{
  //load up images and position!!
  PImage[] foodies = new PImage[3];
  float foodx, foody;
  int a = 0;
  
  Food() {
    for (int i=0; i<foodies.length; i++) {
      foodies[i] = loadImage("food"+i+".png");  
    }
    foodx = random(50, 950);
    foody = random(50, 950);
  }
  
  void displayFood() {
    //show the food!!
    fill(eat, 0);
    ellipse(foodx, foody, 100, 100);
    image(foodies[a], foodx-50, foody-50, 100, 100); 
  }
  void changeFoodTop() {
    //change score of food snail 1!!
    if (dist(foodx, foody, top.start.x, top.start.y) < 20){
      a = int(random(0,3));
      foodx = random(50,950);
      foody = random(50,950);
      count1 = true;
      player2.rewind();
      player2.play();
    }else{
      count1 = false;
    }
    if (count1 == true){
      food = true;
      oneCounter = oneCounter+1;
    }
  }
  void changeFoodBottom() {
    //change score of food snail 2!!
    if (dist(foodx, foody, bottom.start.x, bottom.start.y) < 20){
      a = int(random(0,3));
      foodx = random(50,950);
      foody = random(50,950);
      eat = 0;
      count2 = true;
      player2.rewind();
      player2.play();
    } else {
      count2 = false;
    }
    if (count2 == true){
      food = true;
      twoCounter = twoCounter +1;
    }
  }
}