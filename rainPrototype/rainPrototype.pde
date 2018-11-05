OPC opc;
PImage im;
float xMap;
float yMap;
Drop[] drops = new Drop[400];

void setup()
{
  size(800, 500);

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

  // mapping mouseX and mouseY to other values
  xMap =  map(mouseY, 0, height, 0, width/2);
  yMap =  map(mouseX, 0, width, 0, height/2);

  // stroke and fill - fill follows the mouse mapped
  noStroke(); 
  fill(0, 0, 0);

  // background rect
  rect(0, 0, width, height);

  // rain function called
  rain();

  // fill black, no stroke
  fill(0);
  noStroke();  

  // rectangles to narrow the rain
  rect(0, 0, xMap, height);
  rect(width-xMap, 0, width, height);
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