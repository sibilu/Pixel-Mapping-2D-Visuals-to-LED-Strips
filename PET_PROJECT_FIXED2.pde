
void setup()
{
  size(displayWidth, displayHeight, P3D);
}

void draw() {  
  setupDraw();



  //  Sphere(float lines, int r, int sWeight, int r, int g, int b) {
  Sphere test1 = new Sphere(1000, mouseY, 1, -mouseY, mouseY, mouseY/(mouseX+100), 70);
   // Sphere test2 = new Sphere(800, mouseY, 3, 0, 0, 255, 70);

  test1.display();
  //test2.display();
}



void setupDraw() {

  background(0);
  noCursor();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  noFill();
}