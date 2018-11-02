OPC opc;
PImage im;
int locationXright = 400;
int locationXleft = 400;
boolean moveTopQuarter = false;
boolean moveBottomQuarter = false;
Drop[] drops = new Drop[200];

float r;
void setup()
{
  size(800, 500);
for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
  // Load a sample image
  im = loadImage("flames.jpeg");

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map one 64-LED strip to the center of the window
  opc.ledStrip(0, 64, width/2, height/2, width / 70.0, 0, false);
}

void draw()
{


  // Scale the image so that it matches the width of the window
  int imHeight = im.height * width / im.width;

  // Scroll down slowly, and wrap around
  float speed = 0.05;
  float y = (millis() * -speed) % imHeight;

  // Use two copies of the image, so it seems to repeat infinitely  
  image(im, 0, y, width, imHeight);
  image(im, 0, y + imHeight, width, imHeight);

  if (mouseY<height/4) {
    moveTopQuarter=true;
  } else if (mouseY>height/4)
  { 
    moveTopQuarter=false;
    locationXright = 400;
    locationXleft = 400;
  }

  if (mouseY>(height/4)*3) {
    moveBottomQuarter=true;
  } else if (mouseY<(height/4)*3)
  { 
    moveBottomQuarter=false;
  }
  if (moveTopQuarter) {
    rain();
  }

  if (moveBottomQuarter) {
    randomEllipse();
  }
}

void ellipseMove() {
  boolean directionReverse;
  ellipseMode(CENTER);
  noStroke();
  ellipse(locationXright, 250, 50, 50);
  ellipse(locationXleft, 250, 50, 50);

  locationXright=locationXright+20;
  locationXleft=locationXleft-20;
}

void randomEllipse() {
  fill(0);

  rect(0, 0, width, height);

  fill(255);
  r= random(width);

  ellipse(r, 250, 75, 75);
}

void rain(){
    fill(0);

    rect(0, 0, width, height);

   for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  } 
}