OPC opc;
PImage im;
Drop[] drops = new Drop[400];
float xMap;
float yMap;

void setup()
{
  size(800, 500);

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

  xMap =  map(mouseY, 0, height, 0, width/2);
  yMap =  map(mouseX, 0, width, 0, height/2);
  noStroke(); 
  //scrollImg();
  fill(0, 0, 0, xMap);

  rect(0, 0, width, height);

  rain();

  fill(0);
  noStroke();  

  rect(0, 0, xMap, height);
  rect(width-xMap, 0, width, height);
}

void rain() {


  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
     if (mousePressed) {
    stroke(i, i, 200);
  } else {
    stroke(yMap, i, yMap);
  }
    drops[i].show();
  }
}