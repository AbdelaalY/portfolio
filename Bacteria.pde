class Bacteria    
{ 
  private int x;
  private int y;
  private int feedlvl;
  private int R;
  private int G;
  private int B;
  int indexofclosefood = 0; 
  Bacteria(int x, int y) {
    this.x = x;
    this.y = y;
    this.feedlvl = 0;
    this.R = (int)(Math.random()*255);
    this.G = (int)(Math.random()*255); 
    this.B = (int)(Math.random()*255);
  }

  void move() {
    
      if (x < onion.get(indexofclosefood).x)
        //x += (int)(Math.random()*5)-2;
        x++;
      else {
       // x += (int)(Math.random()*-5)+2 ;
       x--;
      }

      if (y < onion.get(indexofclosefood).y) {
       // y += (int)(Math.random()*5)-2 ;
       y++;
      } else {       
          //y += (int)(Math.random()*-5)+2;
          y--;
      }
    
  }

  void show() {
    fill(R, G, B);

    if (feedlvl < 15) {
      ellipse(x, y, 15, 15);
    } else if (feedlvl >= 15 && feedlvl < 45) {
      rect(x, y, 15, 15);
    } else if (feedlvl >= 45) {
      triangle(x-10, y+10, x, y-10, x+10, y+10);
    }
  }

  void closeFood() {
    int closedis = 3000;
    for (int x = 0; x < onion.size(); x++ ) {
      if (this.x < onion.get(x).x) {
        if ( (int)sqrt(sq(onion.get(x).x - this.x) + sq(onion.get(x).y - this.y)) < closedis) {
          closedis = (int)sqrt(sq(onion.get(x).x - this.x) + sq(onion.get(x).y - this.y));
          indexofclosefood = x;
        } else {
          if ((int)sqrt(sq(this.x - onion.get(x).x) + sq(this.y - onion.get(x).y)) < closedis) {
            closedis = (int)sqrt(sq(this.x - onion.get(x).x) + sq(this.y - onion.get(x).y));
            indexofclosefood = x;
          }
        }
      }
    }
    println(indexofclosefood);
  }

  void cheqNom() {
    for (int x = 0; x < onion.size(); x++) {
      if (this.x <= onion.get(x).x+5 && this.x >= onion.get(x).x-5 && this.y <= onion.get(x).y+5 && this.y >= onion.get(x).y-5 ) {
        feedlvl += onion.get(x).yummylvl;
        onion.remove(x);
      }
    }
  }
}
