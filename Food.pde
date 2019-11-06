class Food {
  int x;
  int y;
  int yummylvl;
  Food(int x, int y) {
    this.x = x;
    this.y = y;
    this.yummylvl = (int)(Math.random()*5);
  }
  
  void show(){
    fill(218,165,32);
  ellipse(x,y,10,10);
  }
}
