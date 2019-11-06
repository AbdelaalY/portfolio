ArrayList<Bacteria> petri = new ArrayList<Bacteria>();
ArrayList<Food> onion = new ArrayList<Food>();
void setup()   
{     
  size(500, 500);
  background(186, 7, 0);
  for (int x = 0; x<10; x++) {
    petri.add(new Bacteria((int)random(50,450), (int)random(50,450)));
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
    petri.get(x).closeFood();
    petri.get(x).move();    
    petri.get(x).show();
    text("Bacteria Numba "+(x+1)+":"+petri.get(x).feedlvl,0,(x+1)*20 );
     petri.get(x).cheqNom();
  }  
}
