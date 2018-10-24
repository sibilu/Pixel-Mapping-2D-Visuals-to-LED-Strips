import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
int  r = 200;
float rad = 200;
void setup()
{
  size(displayWidth, displayHeight);
  //size(600, 400);
  minim = new Minim(this);
 // laver error hvis du ikke skifter filen <333 kh
  player = minim.loadFile("/Users/simonrostami/Music/moth.wav");
  meta = player.getMetaData();
  beat = new BeatDetect();
  //player.loop();
  player.play();
  background(0);
  noCursor();
}

void draw()
{ 
  beat.detect(player.mix);
  fill(0, 0, 0);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  noFill();
  fill(255, 255, 255);
  stroke(255, 255, 255);
  int bsize = player.bufferSize();
  for (int i = 0; i < bsize - 1; i+=5)
  {
    float x = (r)*cos(i*2*PI/100);
    float y = (r)*sin(i*2*PI/100);
    float x2 = (r + 500)*cos(i*2*PI/500);
    float y2 = (r + mouseY/10)*sin(i*2*PI/mouseY/10);
    line(x, y, x2, y2);
    println(mouseY);
  }
}