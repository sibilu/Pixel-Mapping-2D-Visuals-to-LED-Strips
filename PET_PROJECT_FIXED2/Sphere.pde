class Sphere {

  float lines = 800;
  int  r = mouseY;
  float xMov;
  float yMov;
  float sWeight;
  int  r2;
  int colRed;
  int colGreen;
  int colBlue;
int opacity;

  Sphere(float lines, int r, float sWeight, int colRed, int colGreen, int colBlue, int opacity) {
    this.lines = lines;
    this.r = r;
    this.colRed = colRed;
    this.colGreen = colGreen;    
    this.colBlue = colBlue;
    this.sWeight = sWeight;
    this.opacity = opacity;

    xMov = map(mouseX, 0, width, -r, 400  );
    yMov = map(mouseY, 0, height, 23, 250);
  }

  void display() {
    stroke(this.colRed, this.colGreen, this.colBlue, opacity);
    strokeWeight(this.sWeight);

    for (int i = 0; i < lines; i+=1)
    {

      float x = (r)*cos(i*2*PI/100);
      float y = (r)*sin(i*2*PI/100);
      float x2 = (r + xMov)*cos(i*2*PI/500);
      float y2 = (r + yMov/10)*sin(i*2*PI/yMov/10);
      //point(y,x2,y2);
      //ellipse(x, y, x2, y2);
      line(x, y, x2, y2);
    }
  }
}