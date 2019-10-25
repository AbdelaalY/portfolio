import processing.sound.*;
int startX = 100;
int startY= 250;
int endX = 100;
int endY = 250;
int imageX = 0;
int imageY=0;

SoundFile yodadeath;
PImage eronk;

PImage hondacivicgemini;


void setup() {

  size(500, 500);
  yodadeath = new SoundFile(this,"lego-yoda-death-sound-effect.mp3");
  eronk = loadImage("eronkatine.jpg");
  hondacivicgemini = loadImage("epicyoda.jpg");
  background(20, 24, 82);
  strokeWeight(10);
}
void mousePressed() {
  startX = 100;
  startY= 250;
  endX = 100;
  endY = 250;
  hondacivicgemini = loadImage("maxresdefault.jpg");
  yodadeath.play();
  
}


void draw() {
  noStroke();
  fill(#000000);
  rect(0, 0, 500, 500);
  imageMode(CENTER);
  image(eronk, 100, 250, 100, 100);
  image(hondacivicgemini, 400, 250, 100, 100);
  
  while (endX >= 0 && endX<= 500 ){
    stroke((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));

    endX = startX + (int)(Math.random()*20);
    endY = startY + (int)(Math.random()*19)+ -9;

    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;
  }
  

}
