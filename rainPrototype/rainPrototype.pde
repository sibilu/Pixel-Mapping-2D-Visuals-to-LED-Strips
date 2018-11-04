OPC opc;
PImage im;
int locationXright = 400;
int locationXleft = 400;
boolean moveTopQuarter = false;
boolean moveBottomQuarter = false;
Drop[] drops = new Drop[400];
float r;
float xLim;
void setup()
{
  size(800, 500);
  // Load a sample image
  im = loadImage("water.jpg");
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop(random(width));
  }


  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map one 64-LED strip to the center of the window
  opc.ledStrip(0, 64, width/2, height/2, width / 70.0, 0, false);
}

void draw()
{

  xLim = map(mouseY, 0, height, 0, width/2);

  noStroke(); 
  //scrollImg();
  fill(0, 0, 0, xLim);

  rect(0, 0, width, height);

  rain();

  fill(0);
  noStroke();  

  rect(0, 0, xLim, height);
  rect(width-xLim, 0, width, height);

  println("xLim: " +xLim);
  println(width - xLim);
}

void rain() {


  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
}

void scrollImg() {

  // Scale the image so that it matches the width of the window
  int imHeight = im.height * width / im.width;

  // Scroll down slowly, and wrap around
  float speed = 0.05;
  float y = (millis() * -speed) % imHeight;
  // Use two copies of the image, so it seems to repeat infinitely  
  image(im, 0, y, width, imHeight);
  image(im, 0, y + imHeight, width, imHeight);
}