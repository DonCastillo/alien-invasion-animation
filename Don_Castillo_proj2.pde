/***********************
 Don Castillo, NMED 3380 B
 Project 2: Alien Invasion Animation
 Last Modified: 10/21/2020 4PM 
 ************************/


/***********************
 @desc: Global Variables
 ************************/

PFont font;
PImage spaceImg, rocketImg, yellowCarImg, brownCarImg, asteroid1Img, asteroid2Img, earthImg, fieldImg, skylineImg, nightImg;
Asteroid asteroidTop, asteroidDiagonal;
Spaceship spaceshipA, spaceshipB, spaceshipC, spaceshipD;
Alien[] alienA;
//Spaceship spaceshipD;
MyObject rocket, earth;
int time;
int sceneFiveTime;
int numOfAliens;



void setup() {
  // width and height of the window
  size(1000, 600);                  

  // set default background
  //background(0);       

  // load text font
  font = loadFont("Consolas-48.vlw");  

  // load all images
  spaceImg = loadImage("space.jpg");        
  rocketImg = loadImage("rocket.png");
  asteroid1Img = loadImage("asteroid-1.png");
  asteroid2Img = loadImage("asteroid-2.png");
  earthImg = loadImage("earth.png");
  fieldImg = loadImage("field.jpg");
  skylineImg = loadImage("skyline.png"); 
  nightImg = loadImage("night.jpg");

  // set scene objects
  setSceneTwoObjects();
  //setSceneThreeObjects();
  setSceneFourObjects();
  setSceneFiveObjects();
  //setSceneSixObjects();
  //setSceneSevenObjects();

  time = millis();
  frameRate(60);
  //noLoop();
}



void draw() {
  int m = millis() - time;
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

  //if(m >= 0 && m < 5000) {
  //  sceneTwo();
  //}
  //else if(m >= 5000 && m < 35000) {
  //  sceneFive();
  //}
  ////else if(m >= 15000 && m < 25000) {
  ////  sceneThree();
  ////} 
  //else {
  //  //time = millis();
  //  setup();
  //  //sceneOne();
  //  time = millis();
  //}


  sceneFour();

  //println(m);
  //sceneTwo();
}

void mousePressed() {
  //redraw();
}


/***********************
 @desc: Scene 1
 displays the title of the animation
 ************************/
void sceneOne() {
  setBackground(spaceImg, color(201, 201, 201, 255));        // displays space image as background
  setTitle("The Invasion");                               // displays title
}


/***********************
 @desc: Scene 2
 displays the title of the animation
 ************************/
void sceneTwo() {
  // display background
  setBackground(spaceImg, color(201, 201, 201, 255));

  // display top asteroids
  asteroidTop.backward();
  asteroidTop.rotateClockwise();

  // display bottom asteroids
  asteroidDiagonal.toBottomRight();
  asteroidDiagonal.rotateClockwise();

  // display spaceships
  spaceshipA.display();
  spaceshipA.forward();

  rocket.display();
  rocket.toTopLeft();
}

/***********************
 @desc: Scene 3
 displays the title of the animation
 ************************/
void sceneThree() {
  // display background
  setBackground(spaceImg, color(201, 201, 201, 255));

  // display earth
  earth.display();

  // display spaceship
  spaceshipB.display();
  spaceshipB.scaleDown();
}


/***********************
 @desc: Scene 4
 displays the title of the animation
 ************************/
void sceneFour() {
  background(0);
  setBackground(nightImg, color(150, 150, 150, 225));
  spaceshipC.forward();
  spaceshipC.illuminate();
    spaceshipC.display();
  setBackground(skylineImg, color(150, 150, 150, 250));
}


/***********************
 @desc: Scene 5
 displays the title of the animation
 ************************/
void sceneFive() {
  sceneFiveTime++;


  // display background
  setBackground(fieldImg, color(200, 200, 200, 255));

  // display aliens if spaceship has illuminated
  if (spaceshipD.isIlluminated()) {   
    for (int i = 0; i < alienA.length; ++i) {
      alienA[i].display();
      alienA[i].descend();
      if (alienA[i].hasLanded()) {
        if (i % 2 == 0) {
          alienA[i].forward(sceneFiveTime);
        } else {
          alienA[i].backward(sceneFiveTime);
        }
      }
    }
  }

  // display spaceship
  spaceshipD.scaleUp();
  spaceshipD.display();

  //println(sceneFiveTime);
}


/***********************
 @desc: Scene 6
 displays the title of the animation
 ************************/
void sceneSix() {
}


/***********************
 @desc: Scene 7
 displays the title of the animation
 ************************/
void sceneSeven() {
}


void setSceneTwoObjects() {

  // set asteroids
  float dimension = random(50, 300);
  asteroidTop = new Asteroid(width + 2, random(height/2, height), dimension, dimension);
  asteroidTop.setImage(asteroid1Img);
  asteroidTop.setSpeed(random(2, 10));

  dimension = random(50, 150);
  asteroidDiagonal = new Asteroid(-2, -2, dimension, dimension);
  asteroidDiagonal.setImage(asteroid2Img);
  asteroidDiagonal.setSpeed(random(2, 5));

  // set spaceship
  spaceshipA = new Spaceship(-2, height/2, 200, 200);
  spaceshipA.setSpeed(7);


  // set rocket
  rocket = new MyObject(width + 5, height + 5, 200, 200);
  rocket.setImage(rocketImg);
  rocket.setSpeed(15);
}


void setSceneThreeObjects() {

  // set earth
  earth = new MyObject(width/2, height/2, 800, 600);
  earth.setImage(earthImg);

  // set spaceship
  spaceshipB = new Spaceship(width/2, height/2, width * 2, width * 2);
  spaceshipB.setSpeed(75);
}

void setSceneFourObjects() {
  spaceshipC = new Spaceship(-2, height/4, 200, 200);
  spaceshipC.setSpeed(7);
}

void setSceneFiveObjects() {
  // allocate memory
  alienA = new Alien[6];

  sceneFiveTime = 0;
  // set spaceship and aliens
  float spaceshipWidth = 0;
  float spaceshipHeight = 0;
  float spaceshipSpeed = 7;
  float xPos = width/2;
  float yPos = height/8;
  spaceshipD = new Spaceship(xPos, yPos, spaceshipWidth, spaceshipHeight);
  spaceshipD.setSpeed(spaceshipSpeed);

  // set aliens
  float alienWidth = 300;
  float alienHeight = 250;
  float alienSpeed = 10;
  float landingPos = height - (alienHeight/2 - 25);
  for (int i = 0; i < alienA.length; ++i) {
    alienA[i] = new Alien(xPos, yPos - 200 * i, alienWidth, alienHeight);
    alienA[i].setSpeed(alienSpeed);
  }

  numOfAliens = alienA.length;
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
