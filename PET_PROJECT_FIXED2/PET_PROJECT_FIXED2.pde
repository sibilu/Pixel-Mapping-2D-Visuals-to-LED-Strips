OPC opc;

void setup()
{
  size(640, 320, P3D);
  colorMode(HSB, 100);

  opc = new OPC(this, "127.0.0.1", 7890);
  opc.ledGrid8x8(0 * 64, width * 1/8, height * 1/4, height/16, 0, true, false);
  opc.ledGrid8x8(1 * 64, width * 3/8, height * 1/4, height/16, 0, true, false);
  opc.ledGrid8x8(2 * 64, width * 5/8, height * 1/4, height/16, 0, true, false);
  opc.ledGrid8x8(3 * 64, width * 7/8, height * 1/4, height/16, 0, true, false);
  opc.ledGrid8x8(4 * 64, width * 1/8, height * 3/4, height/16, 0, true, false);
  opc.ledGrid8x8(5 * 64, width * 3/8, height * 3/4, height/16, 0, true, false);
  opc.ledGrid8x8(6 * 64, width * 5/8, height * 3/4, height/16, 0, true, false);
  opc.ledGrid8x8(7 * 64, width * 7/8, height * 3/4, height/16, 0, true, false);
}

void draw() {  
  setupDraw();



  //  Sphere(float lines, int r, int sWeight, int r, int g, int b) {
  Sphere test1 = new Sphere(1000, mouseY, 3, 255, 255, 255, 70);
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