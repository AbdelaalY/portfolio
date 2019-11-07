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

  void move() {
    if (feedlvl < 45) {
      if (x < onion.get(closeFood(0)).x && y < onion.get(closeFood(0)).y) {
        x+=(int)random(-2, 3);
        y+=(int)random(-2, 3);
      } 

      if (x > onion.get(closeFood(0)).x && y > onion.get(closeFood(0)).y) {
        x+=(int)random(-3, 2);
        y+=(int)random(-3, 2);
      }

      if (x > onion.get(closeFood(0)).x && y < onion.get(closeFood(0)).y) {
        x+=(int)random(-3, 2);
        y+=(int)random(-2, 3);
      }

      if (x < onion.get(closeFood(0)).x && y > onion.get(closeFood(0)).y) {
        x+=(int)random(-2, 3);
        y+=(int)random(-3, 2);
      }

      if (x < onion.get(closeFood(0)).x) {
        x+=(int)random(-2, 3);
      } else if (x >= onion.get(closeFood(0)).x) {       
        x+=(int)random(-3, 2);
      }

      if (y < onion.get(closeFood(0)).y) {
        y+=(int)random(-2, 3);
      } else if (y >= onion.get(closeFood(0)).y) {       
        y+=(int)random(-3, 2);
      }
    } else if (feedlvl >= 45) {
      if (x < petri.get(closeFood(-1)).x && y < petri.get(closeFood(-1)).y) {
        x+=(int)random(0, 3);
        y+=(int)random(0, 3);
      } 

      if (x > petri.get(closeFood(-1)).x && y > petri.get(closeFood(-1)).y) {
        x+=(int)random(-3, 0);
        y+=(int)random(-3, 0);
      }

      if (x > petri.get(closeFood(-1)).x && y < petri.get(closeFood(0-1)).y) {
        x+=(int)random(-3, 0);
        y+=(int)random(0, 3);
      }

      if (x < petri.get(closeFood(-1)).x && y > petri.get(closeFood(-1)).y) {
        x+=(int)random(0, 3);
        y+=(int)random(-3, 0);
      }

      if (x < petri.get(closeFood(-1)).x) {
        x+=(int)random(0, 3);
      } else if (x >= petri.get(closeFood(-1)).x) {       
        x+=(int)random(-3, 0);
      }

      if (y < petri.get(closeFood(-1)).y) {
        y+=(int)random(0, 3);
      } else if (y >= petri.get(closeFood(-1)).y) {       
        y+=(int)random(-3, 0);
      }
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

  int closeFood(int index) {        
    int closedis = 500;
    int indexofclosefood = 0;
    if (feedlvl < 45) {
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
    } else if(index != -1){
      for (int x = 0; x < index; x++ ) {
        if (this.x < petri.get(x).x) {
          if (dist(this.x, this.y, petri.get(x).x, petri.get(x).y)< closedis) {          
            closedis = (int)dist(this.x, this.y, petri.get(x).x, petri.get(x).y);
            indexofclosefood = x;
          }
        } else if (dist(petri.get(x).x, petri.get(x).y, this.x, this.y) < closedis) {     
          closedis = (int)dist(petri.get(x).x, petri.get(x).y, this.x, this.y);
          indexofclosefood = x;
        }
      }

      for (int x = index+1; x < petri.size(); x++ ) {
        if (this.x < petri.get(x).x) {
          if (dist(this.x, this.y, petri.get(x).x, petri.get(x).y)< closedis) {          
            closedis = (int)dist(this.x, this.y, petri.get(x).x, petri.get(x).y);
            indexofclosefood = x;
          }
        } else if (dist(petri.get(x).x, petri.get(x).y, this.x, this.y) < closedis) {     
          closedis = (int)dist(petri.get(x).x, petri.get(x).y, this.x, this.y);
          indexofclosefood = x;
        }
      }
    }
    return indexofclosefood;
  }

  
  
  void setFeedlvl(int newFeed){
  feedlvl = newFeed;
  }  
}
