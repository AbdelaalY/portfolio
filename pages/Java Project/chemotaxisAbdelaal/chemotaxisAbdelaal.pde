ArrayList<Bacteria> petri = new ArrayList<Bacteria>();
ArrayList<Food> onion = new ArrayList<Food>();
int winna = 11;
void setup()   
{     
  size(500, 500);
  background(186, 7, 0);
  for (int x = 0; x<10; x++) {
    petri.add(new Bacteria((int)random(50, 450), (int)random(50, 450)));
  }  

  for (int x = 0; x< 20; x++) {  
    onion.add(new Food((int)random(10, 490), (int)random(10, 490)));
  }
}   

void draw()   
{     
  if (winna == 11) {

    fill(186, 7, 0);
    rect(0, 0, 500, 500);
    for (int x = 0; x<petri.size(); x++) {
      if (petri.get(x).feedlvl>=45) {
        winna = x;
      }
    }
    for (int x = 0; x<onion.size(); x++) {
      onion.get(x).show();
    }

    for (int x = 0; x<petri.size(); x++) {  
      /*if (petri.get(x).feedlvl >= 45) {
       petri.get(x).closeEnemy(x);
       } else {
       petri.get(x).closeFood();
       }*/
      petri.get(x).closeFood();
      petri.get(x).move(x);    
      petri.get(x).show();
      text("Bacteria Numba "+(x+1)+":"+petri.get(x).feedlvl, 0, (x+1)*20 );
      cheqNom(x);
    }
  } else {
    fill(0, 0, 0);
    rect(0, 0, 500, 500);
    petri.get(winna).x = 250;
    petri.get(winna).y = 250;
    petri.get(winna).show();  
    text("The Winner Is Bacteria Numba "+winna, 150, 200);
  }
}


void cheqNom(int index) {
  if (petri.get(index).feedlvl < 45) {
    for (int x = 0; x < onion.size(); x++) {
      if (petri.get(index).x <= onion.get(x).x+5 && petri.get(index).x >= onion.get(x).x-5 && petri.get(index).y <= onion.get(x).y+5 && petri.get(index).y >= onion.get(x).y-5 ) {
        petri.get(index).setFeedlvl( petri.get(index).feedlvl+ onion.get(x).yummylvl);
        onion.set(x, new Food((int)random(0, 500), (int)random(0, 500)));
      }
    }
  } else {
    for (int x = 0; x < petri.size(); x++) {
      if (petri.get(index).x != petri.get(x).x && petri.get(index).x == petri.get(x).x && petri.get(index).y == petri.get(x).y) {
        petri.get(index).setFeedlvl(petri.get(index).feedlvl + petri.get(x).feedlvl);                
        petri.remove(x);
      }
    }
  }
}

/*int closeEnemy(int index){ 
 int closedis = 500;
 int indexofcloseenemy = 0;
 for (int x = 0; x < index; x++ ) {
 if (petri.get(index).x < petri.get(x).x) {
 if (dist(petri.get(index).x, petri.get(index).y, petri.get(x).x, petri.get(x).y)< closedis) {          
 closedis = (int)dist(petri.get(index).x, petri.get(index).y, petri.get(x).x, petri.get(x).y);
 indexofcloseenemy = x;
 }
 } else if (dist(petri.get(x).x, petri.get(x).y, petri.get(index).x, petri.get(index).y) < closedis) {     
 closedis = (int)dist(petri.get(x).x, petri.get(x).y, petri.get(index).x, petri.get(index).y);
 indexofcloseenemy = x;
 }
 }
 
 for (int x = index+1; x < petri.size(); x++ ) {
 if (petri.get(index).x < petri.get(x).x) {
 if (dist(petri.get(index).x, petri.get(index).y, petri.get(x).x, petri.get(x).y)< closedis) {          
 closedis = (int)dist(petri.get(index).x, petri.get(index).y, petri.get(x).x, petri.get(x).y);
 indexofcloseenemy = x;
 }
 } else if (dist(petri.get(x).x, petri.get(x).y, petri.get(index).x, petri.get(index).y) < closedis) {     
 closedis = (int)dist(petri.get(x).x, petri.get(x).y, petri.get(index).x, petri.get(index).y);
 indexofcloseenemy = x;
 }
 }
 
 return indexofcloseenemy;
 
 }
 */
