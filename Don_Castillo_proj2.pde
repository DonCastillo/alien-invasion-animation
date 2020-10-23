/***********************
  Don Castillo, NMED 3380 B
  Project 2: Alien Invasion Animation
  Last Modified: 10/21/2020 4PM 
************************/


/***********************
@desc: Global Variables
************************/

PFont font;
PImage spaceImg, rocketImg, yellowCarImg, brownCarImg, asteroid1Img, asteroid2Img, earthImg, fieldImg;
Asteroid[] asteroidTop = new Asteroid[2];
Asteroid[] asteroidDiagonal = new Asteroid[1];
Spaceship[] spaceshipA = new Spaceship[5];
Spaceship[] spaceshipB = new Spaceship[5];
Spaceship spaceshipD;
MyObject rocket, earth;
int startTime;



void setup() {
  // width and height of the window
  size(1000, 600);                  
  
  // set default background
  background(0);       
  
  // load text font
  font = loadFont("Consolas-48.vlw");  
  
  // load all images
  spaceImg = loadImage("space.jpg");        
  rocketImg = loadImage("rocket.png");
  yellowCarImg = loadImage("yellow-car.png");
  brownCarImg = loadImage("brown-car.png");
  asteroid1Img = loadImage("asteroid-1.png");
  asteroid2Img = loadImage("asteroid-2.png");
  earthImg = loadImage("earth.png");
  fieldImg = loadImage("field.jpg");
  
  // set scene objects
  setSceneTwoObjects();
  setSceneThreeObjects();
  setSceneFourObjects();
  setSceneFiveObjects();
  setSceneSixObjects();
  setSceneSevenObjects();
  
  startTime = millis();
  frameRate(100);
}



void draw() {
  //int m = millis() - startTime;
  //if(m >= 0 && m < 5000) {
  //  sceneOne();
  //}
  //else if(m >= 5000 && m < 15000) {
  //  sceneTwo();
  //}
  //else if(m >= 15000 && m < 25000) {
  //  sceneThree();
  //} 
  //else {
  //  startTime = millis();
  //  setup();
  //}

  //println((float)(millis()/1000));
  sceneFive();

}




/***********************
@desc: Scene 1
       displays the title of the animation
************************/
void sceneOne() {
  setBackground(spaceImg, color(201, 201, 201, 255));        // displays space image as background
  setTitle("The Invasion");                               // displays title
}

void sceneTwo() {
  // display background
  setBackground(spaceImg, color(201, 201, 201, 255));
  
  // display top asteroids
  for(int i = 0; i < asteroidTop.length; ++i) {
      asteroidTop[i].backward();
      asteroidTop[i].rotateClockwise();
  }
  
  // display bottom asteroids
  for(int i = 0; i < asteroidDiagonal.length; ++i) {
    asteroidDiagonal[i].toBottomRight();
    asteroidDiagonal[i].rotateClockwise();
  }
  
  // display spaceships
  for(int i = 0; i < spaceshipA.length; ++i) {
    spaceshipA[i].display();
    spaceshipA[i].forward();
  }
  
  rocket.display();
  rocket.toTopLeft();
  
}

void sceneThree() {
  // display background
  setBackground(spaceImg, color(201, 201, 201, 255));
  
  // display earth
  earth.display();
  
  // display spaceship
  for(int i = 0; i < spaceshipB.length; ++i) {
    spaceshipB[i].display();
    spaceshipB[i].scaleDown();
  }
  
  
}

void sceneFour() {

}

void sceneFive() {
  // display background
  setBackground(fieldImg, color(200, 200, 200, 255));
 
  // displa spaceship
  spaceshipD.scaleUp();
  spaceshipD.display();

  
  
}

void sceneSix() {

}

void sceneSeven() {

}


void setSceneTwoObjects() {
  // set top asteroids
   for(int i = 0; i < asteroidTop.length; ++i) {
    float dimension = random(50, 300);
    float speed = random(2, 10);
    asteroidTop[i] = new Asteroid(width + 2, random(height/2, height), dimension, dimension);
    asteroidTop[i].setImage(asteroid1Img);
    asteroidTop[i].setSpeed(speed);
  }
  
  // set diagonal asteroids
  for(int i = 0; i < asteroidDiagonal.length; ++i) {
    float dimension = random(50, 150);
    float speed = random(2, 5);
    asteroidDiagonal[i] = new Asteroid(-2, -2, dimension, dimension);
    asteroidDiagonal[i].setImage(asteroid2Img);
    asteroidDiagonal[i].setSpeed(speed);
  }
  
  // set spaceship
  float spaceshipWidth = 200;
  float spaceshipHeight = 200;
  float spaceshipSpeed = 7;
  spaceshipA[0] = new Spaceship(-2, height/2, spaceshipWidth, spaceshipHeight);
  spaceshipA[1] = new Spaceship(-50, (height/2) - 70, spaceshipWidth, spaceshipHeight);
  spaceshipA[2] = new Spaceship(-50, (height/2) + 70 , spaceshipWidth, spaceshipHeight);
  spaceshipA[3] = new Spaceship(-100, (height/2) - 140 , spaceshipWidth, spaceshipHeight);
  spaceshipA[4] = new Spaceship(-100, (height/2) + 140 , spaceshipWidth, spaceshipHeight);
  spaceshipA[0].setSpeed(spaceshipSpeed);
  spaceshipA[1].setSpeed(spaceshipSpeed);
  spaceshipA[2].setSpeed(spaceshipSpeed);
  spaceshipA[3].setSpeed(spaceshipSpeed);
  spaceshipA[4].setSpeed(spaceshipSpeed);
  
  // set rocket
  float rocketWidth = 200;
  float rocketHeight = 200;
  float rocketSpeed = 15;
  rocket = new MyObject(width + 5, height + 5, rocketWidth, rocketHeight);
  rocket.setImage(rocketImg);
  rocket.setSpeed(rocketSpeed);
}


void setSceneThreeObjects() {
  
  // set earth
  earth = new MyObject(width/2, height/2, 800, 600);
  earth.setImage(earthImg);
  
  // set spaceship
  float spaceshipWidth = width * 2;
  float spaceshipHeight = width * 2;
  float spaceshipSpeed = 75;
  spaceshipB[0] = new Spaceship(width/2, height/2, spaceshipWidth, spaceshipHeight);
  spaceshipB[1] = new Spaceship(width/2 - 50, height/2 + 50, spaceshipWidth, spaceshipHeight);
  spaceshipB[2] = new Spaceship(width/2 + 50, height/2 + 50, spaceshipWidth, spaceshipHeight);
  spaceshipB[3] = new Spaceship(width/2 - 100, height/2 + 100, spaceshipWidth, spaceshipHeight);
  spaceshipB[4] = new Spaceship(width/2 + 100, height/2 + 100, spaceshipWidth, spaceshipHeight);
  spaceshipB[0].setSpeed(spaceshipSpeed);
  spaceshipB[1].setSpeed(spaceshipSpeed);
  spaceshipB[2].setSpeed(spaceshipSpeed);
  spaceshipB[3].setSpeed(spaceshipSpeed);
  spaceshipB[4].setSpeed(spaceshipSpeed);
  
}

void setSceneFourObjects() {

}

void setSceneFiveObjects() {
  // set spaceship and aliens
  float spaceshipWidth = 0;
  float spaceshipHeight = 0;
  float spaceshipSpeed = 7;
  spaceshipD = new Spaceship(width/2, height/8, spaceshipWidth, spaceshipHeight);
  spaceshipD.setSpeed(spaceshipSpeed);

}

void setSceneSixObjects() {



}

void setSceneSevenObjects() {


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

  
  
  
  
  
  
  
  
  
  
  
  
  
  
