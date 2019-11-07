ArrayList<Bacteria> petri = new ArrayList<Bacteria>();
ArrayList<Food> onion = new ArrayList<Food>();
void setup()   
{     
  size(500, 500);
  background(186, 7, 0);
  for (int x = 0; x<10; x++) {
    petri.add(new Bacteria((int)random(50,450), (int)random(50,450)));    
  }  
  
  for(int x = 0; x< 20; x++){
  onion.add(new Food((int)random(0,500),(int)random(0,500)));
  }
  
  
}   

void draw()   
{     
  fill(186, 7, 0);
  rect(0, 0, 500, 500);
  
  for (int x = 0; x<onion.size(); x++) {
    onion.get(x).show();    
  }
  
   for (int x = 0; x<petri.size(); x++) {  
    petri.get(x).closeFood(x);
    petri.get(x).move();    
    petri.get(x).show();
    text("Bacteria Numba "+(x+1)+":"+petri.get(x).feedlvl,0,(x+1)*20 );
    cheqNom(x);
  }  
}

void cheqNom(int index) {
    if (petri.get(index).feedlvl < 45) {
      for (int x = 0; x < 10; x++) {
        if (petri.get(index).x <= onion.get(x).x+5 && petri.get(index).x >= onion.get(x).x-5 && petri.get(index).y <= onion.get(x).y+5 && petri.get(index).y >= onion.get(x).y-5 ) {
          petri.get(index).setFeedlvl( petri.get(index).feedlvl+ onion.get(x).yummylvl);
          onion.set(x, new Food((int)random(0, 500), (int)random(0, 500)));
        }
      }
    } else {
      for (int x = 0; x < petri.size(); x++) {
        if (petri.get(index).x != petri.get(x).x && petri.get(index).x == petri.get(x).x && petri.get(index).y == petri.get(x).y) {
          petri.get(index).setFeedlvl(petri.get(index).feedlvl + petri.get(x).feedlvl);
         petri.get(x).setFeedlvl( petri.get(x).feedlvl - 30);
         if(petri.get(x).feedlvl <= 0)
          petri.remove(x);
        }
      }
    }
  }
