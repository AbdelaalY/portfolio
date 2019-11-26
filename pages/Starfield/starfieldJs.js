var array = [];

function setup() {
    createCanvas(800, 800);
    array[0] = new OddBall();
    array[1] = new Jumbo();
    for (var x = 2; x < 10; x++) {
        array[x] = new NormalParticle();
    }
}


function draw() {
    fill(0);
    rect(0, 0, 800, 800);
    for (var x = 0; x < array.length; x++) {
        array[x].move();
        array[x].show();

    }
}


class NormalParticle {

    constructor() {
        this.x = 400;
        this.y = 400;
        this.speed = random(0, 20);
        this.angle = random(20);
        this.r = random(255);
        this.g = random(255);
        this.b = random(255);
    }

    move() {
        this.x += Math.cos(this.angle) * this.speed;
        this.y += Math.sin(this.angle) * this.speed;
        this.speed += 3;
        this.angle += 5;
    }

    show() {
        fill(this.r, this.g, this.b);
        ellipse(this.x, this.y, 20, 20);
    }
}

class OddBall {

    constuctor() {
        this.x = 400;
        this.y = 400;
        this.speed = random(-.1, .1);
        this.angle = random(20);
        this.r = floor(random(50, 255));
        this.g = floor(random(50, 255));
        this.b = floor(random(50, 255));
    }

    move() {
        this.x += Math.cos(this.angle) * this.speed;
        this.y += Math.sin(this.angle) * this.speed;
        this.speed += .1;
        this.angle += .1;
        console.log(this.x);
    }


    show() {
        fill(this.r, this.g, this.b);
        ellipse(this.x / 2, this.y / 2, 20, 20);
    }
}


class Jumbo {

    constructor() {
        this.x = 400;
        this.y = 400;
        this.speed = random(0, 20);
        this.angle = random(20);
        this.r = random(255);
        this.g = random(255);
        this.b = random(255);
    }

    move() {
        this.x += Math.cos(this.angle) * this.speed;
        this.y += Math.sin(this.angle) * this.speed;
        this.speed += 1;
        this.angle += -5;
    }

    show() {
        fill(this.r, this.g, this.b);
        ellipse(this.x, this.y, 50, 50);
    }
}
