import ddf.minim.*;
import ddf.minim.analysis.*;

//Minim beatdetect documentation: http://code.compartmental.net/minim/beatdetect_method_isonset.html

Minim minim;
AudioPlayer player;
BeatDetect beat;

void setGlobalVariables() {
  middleX = width / 2;
  middleY = height / 2;
  top = middleY - 300;
  topCorner = middleY - 150;
  bottom = middleY + 300;
  bottomCorner = middleY + 150;
  left = middleX - 260;
  right = middleX + 260;
}

void initializeMinim() {
  minim = new Minim(this);
  //loads the mp3 song
  player = minim.loadFile("beats.mp3", 2048);
  //play the song and loop
  player.loop();
  // a beat detection object song SOUND_ENERGY mode with a sensitivity of 10 milliseconds
  beat = new BeatDetect();
}

void drawCubeMask() {
  stroke(0, 0, 0);
  strokeWeight(20);
  line(middleX, middleY, left, topCorner);
  line(middleX, middleY, right, topCorner);
  line(middleX, middleY, middleX, bottom);
  noStroke();
  fill(0);
  beginShape();
  vertex(middleX, 0);
  vertex(middleX, top);
  vertex(left, topCorner);
  vertex(left, bottomCorner);
  vertex(middleX, bottom);
  vertex(right, bottomCorner);
  vertex(right, topCorner);
  vertex(middleX, top);
  vertex(middleX, 0);
  vertex(width, 0);
  vertex(width, height);
  vertex(0, height);
  vertex(0, 0);
  endShape();
}