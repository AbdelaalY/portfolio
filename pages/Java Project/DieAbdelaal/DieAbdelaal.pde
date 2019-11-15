
Die dice[] = new Die[9];
int pipcolorR = 0;
int pipcolorG = 0;
int pipcolorB = 0;
String pre = "B";

int totalroll;
void setup()
{  
  size(500, 500);
  noLoop();
}

void draw() { 

  dice[0] = new Die(20, 20, (int)random(1, 6));
  dice[1] = new Die(140, 20, (int)random(1, 6));
  dice[2] = new Die(260, 20, (int)random(1, 6));

  dice[3] = new Die(20, 140, (int)random(1, 6));
  dice[4] = new Die(140, 140, (int)random(1, 6));
  dice[5] = new Die(260, 140, (int)random(1, 6));

  dice[6] = new Die(20, 260, (int)random(1, 6));
  dice[7] = new Die(140, 260, (int)random(1, 6));
  dice[8] = new Die(260, 260, (int)random(1, 6));


  fill(pipcolorR, pipcolorG, pipcolorB);
  rect(0, 0, 500, 500);

  for (int x=0; x<9; x++) {
    dice[x].show();
  }
  fill(255);
  text(totalroll, 450, 20);
  text("R:"+pipcolorR, 450, 40);
  text("G:"+pipcolorG, 450, 60);
  text("B:"+pipcolorB, 450, 80);
  text(pre, 450, 100);

  totalroll = 0;
}

void mousePressed()
{
  for (int x = 0; x<9; x++) {
    dice[x].roll();
  }

  for (int x = 0; x<9; x++) {
    totalroll+=dice[x].pips;
  }

  if (pipcolorR <= 229 && pre.equals("B")) {
    pipcolorR +=totalroll;
    pre = "R";
  } else if (pipcolorR>=229) {
    pipcolorR = 0;
    pre = "R";
  } else

    if (pipcolorG < 229 && pre.equals("R")) {
      pipcolorG +=totalroll;
      pre = "G";
    } else  if (pipcolorG> 229) {
      pipcolorG = 0;
      pre = "G";
    } else if (pipcolorB <= 229 && pre.equals("G")) {
      pipcolorB +=totalroll;
      pre = "B";
    } else if (pipcolorB>229) {
      pipcolorB = 0;
      pre = "B";
    }
  redraw();
}
