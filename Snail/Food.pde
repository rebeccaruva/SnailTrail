class Food
{
  PImage[] foodies = new PImage[3];
  float foodx, foody;
  
  Food() {
    for (int i=0; i<foodies.length; i++) {
      foodies[i] = loadImage("food"+i+".png");  
    }
    foodx = random(10,500);
    foody = random(10,500);
  }
  
  void displayFood() {
    fill(eat);
    ellipse(foodx, foody, 100, 100);
    image(foodies[int(random(3))], foodx, foody, 100, 100); 
  }
  public float getX() {
    return foodx;
  }
  public float getY() {
    return foody;
  }
}