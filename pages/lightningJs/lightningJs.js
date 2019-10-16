
var startX = 100;
var startY= 250;
var endX = 100;
var endY = 250;
 
let yodadeath;
let eronk;
let hondacivicgemini;
function preload(){

}

function setup() {
  createCanvas(500, 500);
  background(20, 24, 82);
  strokeWeight(10);
  yodadeath = loadSound("data/lego-yoda-death-sound-effect.mp3");
  eronk = loadImage("data/eronkatine.jpg");
  hondacivicgemini = loadImage("data/epicyoda.jpg");
}

function mousePressed() {
  startX = 100;
  startY= 250;
  endX = 100;
  endY = 250;
  hondacivicgemini = loadImage("data/maxresdefault.jpg");
  yodadeath.play();
}

function draw() {
  noStroke();
  fill("#000000");
  rect(0, 0, 500, 500);
  imageMode(CENTER);
  image(eronk, 100, 250, 100, 100);
  image(hondacivicgemini, 400, 250, 100, 100);

  while (endX >= 0 && endX<= 500 ) {
    stroke((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));

    endX = startX + (int)(Math.random()*20);
    endY = startY + (int)(Math.random()*19)+ -9;

    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;
  }
}
