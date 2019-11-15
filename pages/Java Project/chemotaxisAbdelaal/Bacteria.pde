class Bacteria    
{ 
  private int x;
  private int y;
  private int feedlvl;

  private int R;
  private int G;
  private int B; 

  Bacteria(int x, int y) {
    this.x = x;
    this.y = y;
    this.feedlvl = 0;
    this.R = (int)(Math.random()*255);
    this.G = (int)(Math.random()*255); 
    this.B = (int)(Math.random()*255);
  }

  void move(int index) {
    if (feedlvl < 45) {
      if (x < onion.get(closeFood()).x && y < onion.get(closeFood()).y) {
        x+=(int)random(-2, 3);
        y+=(int)random(-2, 3);
      } 

      if (x > onion.get(closeFood()).x && y > onion.get(closeFood()).y) {
        x+=(int)random(-3, 2);
        y+=(int)random(-3, 2);
      }

      if (x > onion.get(closeFood()).x && y < onion.get(closeFood()).y) {
        x+=(int)random(-3, 2);
        y+=(int)random(-2, 3);
      }

      if (x < onion.get(closeFood()).x && y > onion.get(closeFood()).y) {
        x+=(int)random(-2, 3);
        y+=(int)random(-3, 2);
      }

      if (x < onion.get(closeFood()).x) {
        x+=(int)random(-2, 3);
      } else if (x >= onion.get(closeFood()).x) {       
        x+=(int)random(-3, 2);
      }

      if (y < onion.get(closeFood()).y) {
        y+=(int)random(-2, 3);
      } else if (y >= onion.get(closeFood()).y) {       
        y+=(int)random(-3, 2);
      }
    }/* else if (feedlvl >= 45) {
      if (x < petri.get(closeEnemy(index)).x && y < petri.get(closeEnemy(index)).y) {
        x+=(int)random(0, 3);
        y+=(int)random(0, 3);
      } 

      if (x > petri.get(closeEnemy(index)).x && y > petri.get(closeEnemy(index)).y) {
        x+=(int)random(-3, 0);
        y+=(int)random(-3, 0);
      }

      if (x > petri.get(closeEnemy(index)).x && y < petri.get(closeFood()).y) {
        x+=(int)random(-3, 0);
        y+=(int)random(0, 3);
      }

      if (x < petri.get(closeEnemy(index)).x && y > petri.get(closeEnemy(index)).y) {
        x+=(int)random(0, 3);
        y+=(int)random(-3, 0);
      }

      if (x < petri.get(closeEnemy(index)).x) {
        x+=(int)random(0, 3);
      } else if (x >= petri.get(closeEnemy(index)).x) {       
        x+=(int)random(-3, 0);
      }

      if (y < petri.get(closeEnemy(index)).y) {
        y+=(int)random(0, 3);
      } else if (y >= petri.get(closeEnemy(index)).y) {       
        y+=(int)random(-3, 0);
      }
    }
    */
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

  int closeFood() {        
    int closedis = 500;
    int indexofclosefood = 0;
    
      for (int x = 0; x < onion.size(); x++ ) {
        if (this.x < onion.get(x).x) {
          if (dist(this.x, this.y, onion.get(x).x, onion.get(x).y)< closedis) {          
            closedis = (int)dist(this.x, this.y, onion.get(x).x, onion.get(x).y);
            indexofclosefood = x;
          }
        } else if (dist(onion.get(x).x, onion.get(x).y, this.x, this.y) < closedis) {     
          closedis = (int)dist(onion.get(x).x, onion.get(x).y, this.x, this.y);
          indexofclosefood = x;
        }
      }    
    return indexofclosefood;
  }

    
  void setFeedlvl(int newFeed){
  feedlvl = newFeed;
  }  
}
