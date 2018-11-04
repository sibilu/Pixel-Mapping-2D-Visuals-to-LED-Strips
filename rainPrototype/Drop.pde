// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/KkyIDI6rQJI

class Drop {
  float x;
  float y;
  float z;
  float len;
  float yspeed;

  Drop(float x) {
    this.x = x;
    y  = random(-500, -50);
    z  = random(0, 20);
    len = map(z, 0, 20, 10, 20);
    yspeed  = map(z, 0, 20, 1, 20);
  }

  void fall() {
    y = y + yspeed;
    float grav = map(z, 0, 20, 0, 0.2);
    yspeed = yspeed + grav;

    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() {

    float thick = map(z, 0, 20, 1, 9);
    strokeWeight(thick);
    stroke(0, 200, 255);
    line(x, y, x, y+len);
  }
}