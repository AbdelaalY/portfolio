class Die 
{
  private int x = 0;
  private int y = 0;
  private int pips = 1;

  Die(int x, int y, int p) {
    this.x = x;
    this.y = y;
    this.pips = p;
  }

  void roll()
  {
    pips = (int)random(1, 6);
  }

  void show()
  {
    // draws the die     
    fill(255);
    rect(x, y, 100, 100, 10);

    //draws the pip
    fill(pipcolorR, pipcolorG, pipcolorB);
    if (pips == 1) {
      ellipse(x+50, y+50, 10, 10);
    }

    if (pips == 2) {
      ellipse(x+25, y+25, 10, 10);
      ellipse(x+75, y+75, 10, 10);
    }

    if (pips == 3) {
      ellipse(x+25, y+25, 10, 10);
      ellipse(x+50, y+50, 10, 10);
      ellipse(x+75, y+75, 10, 10);
    }

    if (pips == 4) {
      ellipse(x+25, y+25, 10, 10);
      ellipse(x+75, y+25, 10, 10);
      ellipse(x+25, y+75, 10, 10);
      ellipse(x+75, y+75, 10, 10);
    }

    if (pips == 5) {
      ellipse(x+25, y+25, 10, 10);
      ellipse(x+75, y+25, 10, 10);
      ellipse(x+25, y+75, 10, 10);
      ellipse(x+75, y+75, 10, 10);
      ellipse(x+50, y+50, 10, 10);
    }

    if (pips == 6) {
      ellipse(x+25, y+25, 10, 10);
      ellipse(x+25, y+50, 10, 10);
      ellipse(x+25, y+75, 10, 10);
      ellipse(x+75, y+25, 10, 10);
      ellipse(x+75, y+50, 10, 10);
      ellipse(x+75, y+75, 10, 10);
    }
  }
}
