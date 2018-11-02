OPC opc;

void setup()
{
  size(1280, 640, P3D);
  colorMode(HSB, 100);

  opc = new OPC(this, "127.0.0.1", 7890);
  opc.ledStrip(0, 64, width/2, height/2, width / 70.0, 0, false);
  
}

void draw() {  


  setupDraw();



  //  Sphere(float lines, int r, int sWeight, int r, int g, int b) {
  Sphere test1 = new Sphere(2000, mouseY, 2, 0, 0, 100, 70);
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