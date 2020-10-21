/***********************
  Don Castillo, NMED 3380 B
  Project 2: Alien Invasion Animation
  Last Modified: 10/21/2020 4PM 
************************/


/***********************
@desc: Global Variables
************************/

PFont font;

void setup()
{
  // width and height of the window
  size(1000, 600);
  
  // default background
  background(0);
  
  // load font
  font = loadFont("Consolas-48.vlw");
  
}


void draw()
{
  scene1();

}

/***********************
@desc: Scenes
************************/
void scene1(){
  textFont(font, 48);
  textAlign(CENTER, CENTER);
  fill(250);
  text("The Invasion", width/2, height/2);
}

void scene2(){

}

void scene3(){

}

void scene4(){

}

void scene5(){

}

void scene6(){

}

void scene7(){

}
/***********************
@desc: Classes
************************/
class Spaceship {
  

}
  
