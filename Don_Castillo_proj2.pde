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
Spaceship spaceship; 

void setup() {
  size(1000, 600);                       // width and height of the window
  background(0);                         // default background
  font = loadFont("Consolas-48.vlw");    // load font
  space = loadImage("space.jpg");        // load space image 
  spaceship = new Spaceship(width/2, height/2, 350, 350);
  spaceship.setSpeed(10);
}

void draw() {
  scene2();
  //println(width++);

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
  spaceship.display();
  //spaceship.forward();
  //spaceship.backward();
  //spaceship.ascend();
  //spaceship.descend();
  //spaceship.scaleUp();
  //spaceship.scaleDown();
  //spaceship.toTopLeft();
  //spaceship.toTopRight();
  //spaceship.toBottomRight();
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

  
  
  
  
  
  
  
  
  
  
  
  
  
  
