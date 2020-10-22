/***********************
  Don Castillo, NMED 3380 B
  Project 2: Alien Invasion Animation
  Last Modified: 10/21/2020 4PM 
************************/


/***********************
@desc: Global Variables
************************/

PFont font;
PImage space;
PImage rocket, yellowCar, brownCar, asteroid1, asteroid2;
Asteroid asteroidA, asteroidB; 



void setup() {
  // width and height of the window
  size(1000, 600);                  
  
  // set default background
  background(0);       
  
  // load text font
  font = loadFont("Consolas-48.vlw");  
  
  // load all images
  space = loadImage("space.jpg");        
  rocket = loadImage("rocket.png");
  yellowCar = loadImage("yellow-car.png");
  brownCar = loadImage("brown-car.png");
  asteroid1 = loadImage("asteroid-1.png");
  asteroid2 = loadImage("asteroid-2.png");
  
  // set all objects
  asteroidA = new Asteroid(width/2, height/2, 350, 350);
  asteroidA.setImage(asteroid1);
  
}



void draw() {
  scene2();
}




/***********************
@desc: Scene 1
       displays the title of the animation
************************/
void scene1() {
  setBackground(space, color(201, 201, 201, 255));        // displays space image as background
  setTitle("The Invasion");                               // displays title
}

void scene2() {
  setBackground(space, color(201, 201, 201, 255));        // displays space image as background
  asteroidA.rotateClockwise("backward");
  asteroidA.setSpeed(10);
}

void scene3() {

}

void scene4() {

}

void scene5() {

}

void scene6() {

}

void scene7() {

}

/***********************
@desc: sets the scenes title in the center
@params:  text to be displayed
************************/
void setTitle(String title) {
  textFont(font, 48);
  textAlign(CENTER, CENTER);
  fill(250);
  text(title, width/2, height/2);
}


/***********************
@desc: sets the scenes background image
@params:  image to be displayed
************************/
void setBackground(PImage pImage, color pColor) {
  tint(pColor);
  imageMode(CENTER);
  image(pImage, width/2, height/2, width, height); 
}

  
  
  
  
  
  
  
  
  
  
  
  
  
  
