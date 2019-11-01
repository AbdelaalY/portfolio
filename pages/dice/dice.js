//'use strict'

let dice = [];
var pipcolorR = 0;
var pipcolorG = 0;
var pipcolorB = 0;
var pre = "B";
var totalroll;

function setup() {
  createCanvas(500, 500);
  dice.push(new Die(20, 20, floor(random(1, 7))), 
    new Die(140, 20, floor(random(1, 7))), 
    new Die(260, 20, floor(random(1, 7))), 
    new Die(20, 140, floor(random(1, 7))), 
    new Die(140, 140, floor(random(1, 7))), 
    new Die(260, 140, floor(random(1, 7))), 
    new Die(20, 260, floor(random(1, 7))), 
    new Die(140, 260, floor(random(1, 7))), 
    new Die(260, 260, floor(random(1, 7))));
  noLoop();
}


function draw() {

  fill(pipcolorR, pipcolorG, pipcolorB);
  rect(0, 0, 500, 500);

  fill(255);
  text(totalroll, 450, 20);
  text("R:"+pipcolorR, 450, 40);
  text("G:"+pipcolorG, 450, 60);
  text("B:"+pipcolorB, 450, 80);
  text(pre, 450, 100);
  totalroll = 0;
  for (var x=0; x<dice.length; x++) { 
    dice[x].show();
  }
}

function mousePressed()
{
  for ( var x = 0; x<dice.length; x++) {
    dice[x].roll();
  }

  for (var y = 0; y<dice.length; y++) {
    totalroll += dice[y].pips;
  }


  if (pipcolorR <= 229 && pre === ("B")) {
    pipcolorR +=totalroll;
    pre = "R";
  } else if (pipcolorR>=229) {
    pipcolorR = 0;
    pre = "R";
  } else if (pipcolorG < 229 && pre === ("R")) {
    pipcolorG +=totalroll;
    pre = "G";
  } else  if (pipcolorG> 229) {
    pipcolorG = 0;
    pre = "G";
  } else if (pipcolorB <= 229 && pre === ("G")) {
    pipcolorB +=totalroll;
    pre = "B";
  } else if (pipcolorB>229) {
    pipcolorB = 0;
    pre = "B";
  }
  redraw();
}

class Die 
{
   constructor( x,  y,  p){
    this.x = x;
    this.y = y;
    this.pips = p;
  }


   roll()
  {
    this.pips = floor(random(1,7));
  }

   show()
  {
   
    // draws the die     
    fill(255);
    rect(this.x, this.y, 100, 100, 10);

    //draws the pip
    fill(pipcolorR, pipcolorG, pipcolorB);
    if (this.pips == 1) {
      ellipse(this.x+50, this.y+50, 10, 10);
    }

    if (this.pips == 2) {
      ellipse(this.x+25, this.y+25, 10, 10);
      ellipse(this.x+75, this.y+75, 10, 10);
    }

    if (this.pips == 3) {
      ellipse(this.x+25, this.y+25, 10, 10);
      ellipse(this.x+50, this.y+50, 10, 10);
      ellipse(this.x+75, this.y+75, 10, 10);
    }

    if (this.pips == 4) {
      ellipse(this.x+25, this.y+25, 10, 10);
      ellipse(this.x+75, this.y+25, 10, 10);
      ellipse(this.x+25, this.y+75, 10, 10);
      ellipse(this.x+75, this.y+75, 10, 10);
    }

    if (this.pips == 5) {
      ellipse(this.x+25, this.y+25, 10, 10);
      ellipse(this.x+75, this.y+25, 10, 10);
      ellipse(this.x+25, this.y+75, 10, 10);
      ellipse(this.x+75, this.y+75, 10, 10);
      ellipse(this.x+50, this.y+50, 10, 10);
    }

    if (this.pips == 6) {
      ellipse(this.x+25, this.y+25, 10, 10);
      ellipse(this.x+25, this.y+50, 10, 10);
      ellipse(this.x+25, this.y+75, 10, 10);
      ellipse(this.x+75, this.y+25, 10, 10);
      ellipse(this.x+75, this.y+50, 10, 10);
      ellipse(this.x+75, this.y+75, 10, 10);
    }
  }
}





