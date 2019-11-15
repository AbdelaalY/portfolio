let petri = [];
let onion = [];
var winna = 11;

function setup() {
    createCanvas(500, 500);
    background(186, 7, 0);
    for (var x = 0; x < 10; x++) {
        petri[x] = (new Bacteria(floor(random(50, 450)), floor(random(50, 450))));
    }

    for (var x = 0; x < 20; x++) {
        onion[x] = (new Food((random(10, 490)), floor(random(10, 490))));
    }
}

function draw() {
    if (winna == 11) {

        fill(186, 7, 0);
        rect(0, 0, 500, 500);
        for (var x = 0; x < petri.length; x++) {
            if (petri[x].feedlvl >= 45) {
                winna = x;
            }
        }
        for (var x = 0; x < onion.length; x++) {
            onion[x].show();
        }

        for (var x = 0; x < petri.length; x++) {
            /*if (petri.get(x).feedlvl >= 45) {
             petri.get(x).closeEnemy(x);
             } else {
             petri.get(x).closeFood();
             }*/
            petri[x].closeFood();
            petri[x].move(x);
            petri[x].show();
            text("Bacteria Numba " + (x + 1) + ":" + petri[x].feedlvl, 0, (x + 1) * 20);
            cheqNom(x);
        }
    } else {
        fill(0, 0, 0);
        rect(0, 0, 500, 500);
        petri.get(winna).x = 250;
        petri.get(winna).y = 250;
        petri.get(winna).show();
        text("The Winner Is Bacteria Numba " + winna, 150, 200);
    }
}


function cheqNom(index) {
    if (petri[index].feedlvl < 45) {
        for (var x = 0; x < onion.length; x++) {
            if (petri[index].x <= onion[x].x + 5 && petri[index].x >= onion[x].x - 5 && petri[index].y <= onion[x].y + 5 && petri[index].y >= onion[x].y - 5) {
                petri[index].setFeedlvl(petri[index].feedlvl + onion[x].yummylvl);
                onion[x] = new Food(floor(random(0, 500)), floor(random(0, 500)));
            }
        }
    } else {
        for (var x = 0; x < petri.size(); x++) {
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


class Bacteria {


    constructor(x, y) {
        this.x = x;
        this.y = y;
        this.feedlvl = 0;
        this.R = (floor(random() * 255));
        this.G = (floor(random() * 255));
        this.B = (floor(random() * 255));
    }

    closeFood() {
        var closedis = 500;
        var indexofclosefood = 0;

        for (var x = 0; x < onion.length; x++) {
            if (this.x < onion[x].x) {
                if (dist(this.x, this.y, onion[x].x, onion[x].y) < closedis) {
                    closedis = floor(dist(this.x, this.y, onion[x].x, onion[x].y));
                    indexofclosefood = x;
                }
            } else if (dist(onion[x].x, onion[x].y, this.x, this.y) < closedis) {
                closedis = floor(dist(onion[x].x, onion[x].y, this.x, this.y));
                indexofclosefood = x;
            }
        }
        return indexofclosefood;
    }

    move(index) {

        if (this.x <= onion[this.closeFood()].x && this.y < onion[this.closeFood()].y) {
            this.x += floor(random(-2, 3));
            this.y += floor(random(-2, 3));
        }

        if (this.x >= onion[this.closeFood()].x && this.y > onion[this.closeFood()].y) {
            this.x += floor(random(-3, 2));
            this.y += floor(random(-3, 2));
        }

        if (this.x >= onion[this.closeFood()].x && this.y < onion[this.closeFood()].y) {
            this.x += floor(random(-3, 2));
            this.y += floor(random(-2, 3));
        }

        if (this.x <= onion[this.closeFood()].x && this.y > onion[this.closeFood()].y) {
            this.x += floor(random(-2, 3));
            this.y += floor(random(-3, 2));
        }

        if (this.x <= onion[this.closeFood()].x)
            this.x += floor(random(-2, 3));

        if (this.x >= onion[this.closeFood()].x)
            this.x += floor(random(-3, 2));



    }

    /*if (this.x < onion[this.closeFood()].x) {
        this.x += floor(random(-2, 3));
    } else {
        this.x += floor(random(-3, 2));
    }

    if (this.y <= onion[this.closeFood()].y) {
        this.y += floor(random(-2, 3));
    } else {
        this.y += floor(random(-3, 2));
    }*/

    /* else if (feedlvl >= 45) {
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


    show() {
        fill(this.R, this.G, this.B);

        if (this.feedlvl < 15) {
            ellipse(this.x, this.y, 15, 15);
        } else if (this.feedlvl >= 15 && this.feedlvl < 45) {
            rect(this.x, this.y, 15, 15);
        } else if (this.feedlvl >= 45) {
            triangle(this.x - 10, this.y + 10, this.x, this.y - 10, this.x + 10, this.y + 10);
        }
    }





    setFeedlvl(newFeed) {
        this.feedlvl = newFeed;
    }
}


class Food {
    constructor(x, y) {
        this.x = x;
        this.y = y;
        this.yummylvl = (int)(Math.random() * 5);
    }

    show() {
        fill(218, 165, 32);
        ellipse(this.x, this.y, 10, 10);
    }
}
