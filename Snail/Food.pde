class Food
{
  PImage[] foodies = new PImage[3];
  float foodx, foody;
  
  Food() {
    for (int i=0; i<foodies.length; i++) {
      foodies[i] = loadImage("food"+i+".png");  
    }
    foodx = random(50, 950);
    foody = random(50, 950);
  }
  
  void displayFood() {
    fill(eat, 0);
    ellipse(foodx, foody, 100, 100);
    image(foodies[int(random(3))], foodx-50, foody-50, 100, 100); 
    //foodx = random(10,500);
    //foody = random(10,500);
  }
  void changeFoodTop() {
    if (dist(foodx, foody, top.x, top.y) < 20){
      foodx = random(50,950);
      foody = random(50,950);
      count1 = true;
    }else{
      count1 = false;
    }
    if (count1 == true){
      food = true;
      oneCounter = oneCounter +1;
    }
  }
  void changeFoodBottom() {
    if (dist(foodx, foody, bottom.x, bottom.y) < 20){
      foodx = random(50,950);
      foody = random(50,950);
      eat = 0;
      count2 = true;
    }else{
      count2 = false;
    }
    if (count2 == true){
      food = true;
      twoCounter = twoCounter +1;
    }
  }
}