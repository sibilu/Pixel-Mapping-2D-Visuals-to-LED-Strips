import org.openkinect.freenect.*;
import org.openkinect.processing.*;


OPC opc;
PImage im;
float xMap;
float yMap;
PVector v2;
Drop[] drops = new Drop[400];



// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;

void setup()
{
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();

  im = loadImage("abstract.jpg");

  // for loop to make each index of array drops[] an instance of the Drop class 
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop(random(width));
  }

  // ********* FADECANDY SETUP*********
  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map one 64-LED strip to the center of the window
  opc.ledStrip(0, 64, width/2, height/2, width / 70.0, 0, false);
}

void draw()
{
 // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);

  // Let's draw the "lerped" location
   v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);

  // Display some info
  int t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
    "UP increase threshold, DOWN decrease threshold", 10, 500);


  // mapping mouseX and mouseY to other values
  yMap =  map(mouseY, height/4, height, 0, 350);
  xMap =  map(mouseX, 0, width, 0, height/2);
  float v2XMapped = map(v2.x, 0, 640, 0,350);
  float v2YMapped = map(v2.x, 0, 520, 0,350);
  // stroke and fill - fill follows the mouse mapped
  noStroke(); 
  fill(0, 0, 0);

  // background rect
  rect(0, 0, width, height);

  // rain function called
  rain();
  tint(255, 255, 255, 100+v2YMapped);
  imScroll();
  // fill black, no stroke
  fill(0);
  noStroke();  

  // rectangles to narrow the rain
  // rect(0, 0, xMap, height);
  // rect(width-xMap, 0, width, height);
}

void rain() {

  // for loop to make all rain drops fall down and to show them.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    // if mouse is pressed, stroke colour changes
    if (mousePressed) {
      stroke(i, i, 255);
    } else {
      stroke(255, i, 255);
    }
    drops[i].show();
  }
}

void imScroll() {
  // Scale the image so that it matches the width of the window
  int imHeight = im.height * width / im.width;

  // Scroll down slowly, and wrap around
  float speed = 0.03;
  float y = (millis() * -speed) % imHeight;

  // Use two copies of the image, so it seems to repeat infinitely  
  image(im, 0, y, width, imHeight);
  image(im, 0, y + imHeight, width, imHeight);
}