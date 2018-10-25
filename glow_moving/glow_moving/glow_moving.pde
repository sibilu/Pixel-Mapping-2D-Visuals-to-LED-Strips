GlowBall glowBall;
OPC opc;

PImage photo;

void setup() {

  size(1280, 640);
  imageMode(CENTER);
  opc = new OPC(this, "127.0.0.1", 7890);
  //    constructor: 
  //    opc.ledStrip(index, count, x, y, spacing, angle, reversed)

  opc.ledStrip(0, 64, width/2, (height/8)*1-10, width / 70.0, 0, false);
  opc.ledStrip(65, 64, width/2, (height/8)*2-10, width / 70.0, 0, false);
  opc.ledStrip(130, 64, width/2, (height/8)*3-10, width / 70.0, 0, false);
  opc.ledStrip(195, 64, width/2, (height/8)*4-10, width / 70.0, 0, false);
  opc.ledStrip(260, 64, width/2, (height/8)*5-10, width / 70.0, 0, false);
  opc.ledStrip(325, 64, width/2, (height/8)*6-10, width / 70.0, 0, false);
  opc.ledStrip(390, 64, width/2, (height/8)*7-10, width / 70.0, 0, false);
  opc.ledStrip(455, 64, width/2, (height/8)*8-10, width / 70.0, 0, false);

  //opc.ledGrid8x8(1 * 64, width * 3/8, height * 1/4, height/16, 0, true, false);
  //opc.ledGrid8x8(2 * 64, width * 5/8, height * 1/4, height/16, 0, true, false);
  //opc.ledGrid8x8(3 * 64, width * 7/8, height * 1/4, height/16, 0, true, false);
  //opc.ledGrid8x8(4 * 64, width * 1/8, height * 3/4, height/16, 0, true, false);
  // opc.ledGrid8x8(5 * 64, width * 3/8, height * 3/4, height/16, 0, true, false);
  //opc.ledGrid8x8(6 * 64, width * 5/8, height * 3/4, height/16, 0, true, false);
  //opc.ledGrid8x8(7 * 64, width * 7/8, height * 3/4, height/16, 0, true, false);

  glowBall = new GlowBall(0); 

  photo = loadImage("dot.png");
}

void draw() {
  background(0);
  // Update the location
  glowBall.update();
  // Display the GlowBall
  glowBall.display();
}




/**
 * Acceleration with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of the basics of motion with vector.
 * A "GlowBall" object stores location, velocity, and acceleration as vectors
 * The motion is controlled by affecting the acceleration (in this case towards the mouse)
 */


class GlowBall {

  // The GlowBall tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The GlowBall's maximum speed
  float topspeed;
  int offset;
  float imgSize;
  GlowBall(int offset) {
    this.offset =offset;
    // Start in the center
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 10;
  }

  void update() {

    // Compute a vector that points from location to mouse
    PVector mouse = new PVector(mouseX, mouseY);
    PVector acceleration = PVector.sub(mouse, location);
    // Set magnitude of acceleration
    acceleration.setMag(1);
    println(acceleration);
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    float xMov = map(location.x, 0, width, 0, 255  );
    float yMov = map(location.y, 0, height, 0, 250);
    imgSize = abs(velocity.x*100);
    println(imgSize);
    tint(xMov, yMov, 255);
    float imgSizeMapped = map(abs(velocity.x*100), 0, 1000, 250, 1000);

    image(photo, location.x+offset, location.y, imgSizeMapped, imgSizeMapped);
  }
}