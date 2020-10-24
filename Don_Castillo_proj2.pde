/***********************
 Don Castillo, NMED 3380 B
 Project 2: Alien Invasion Animation
 Last Modified: 10/21/2020 4PM 
 ************************/


/***********************
 @desc: Global Variables
 ************************/

PFont font;
PImage spaceImg, rocketImg, yellowCarImg, brownCarImg, asteroid1Img, asteroid2Img, earthImg, fieldImg, skylineImg, nightImg, farmImg, barnImg;
Asteroid asteroidTop, asteroidDiagonal;
Spaceship spaceshipA, spaceshipB, spaceshipC, spaceshipD;
Alien[] alienA;
Alien alienB;
MyObject rocket, earth;
int time;
int sceneFiveTime, sceneFourTime, sceneSixTime;
int numOfAliens;
boolean isLastScene;


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
  farmImg = loadImage("farm.jpg");
  barnImg = loadImage("barn.png");

  // set scene objects
  setSceneTwoObjects();
  setSceneThreeObjects();
  setSceneFourObjects();
  setSceneFiveObjects();
  setSceneSixObjects();
  setSceneSevenObjects();

  time = millis();
  frameRate(60);
  isLastScene = false;
}



void draw() {
  int m = millis() - time;
  
  if(m >= 0 && m < 2000) {
    sceneOne();
  }
  else if(m >= 2000 && m < 8000) {
    sceneTwo();
  }
  else if(m >= 8000 && m < 11000) {
    sceneThree();
  } 
  else if(m >= 11000 && m < 20000){
    sceneFour();
  }
  else if(m >= 20000 && m < 37000){
    sceneFive();
  }
  else if(m >= 37000 && m < 46000){
    sceneSix();
  } 
  else{
    sceneSeven();
    m = millis();
    isLastScene = true;
  }
}

void mousePressed() {

}

void keyPressed() {
  switch(key) {
    case ' ':
      if(isLastScene){
        setup();
      }
      break;
      
  }
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
  sceneFourTime++;
  background(0);
  setBackground(nightImg, color(150, 150, 150, 225));
  spaceshipC.forward();
  
  if((spaceshipC.x >= 150 && spaceshipC.x <= 250) || (spaceshipC.x >= 450 && spaceshipC.x <= 550) || (spaceshipC.x >= 750 && spaceshipC.x <= 850)) {
    spaceshipC.illuminate();
  } else {
    spaceshipC.deluminate();
  }
 
  spaceshipC.display();
  setBackground(skylineImg, color(150, 150, 150, 250));
  //println("x: " + spaceshipC.x + " y: " + spaceshipC.y);
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
  sceneSixTime++;
  setBackground(farmImg, color(150, 150, 150, 255));
  
  alienB.display();
  
  if(alienB.x < 678){
    alienB.forward(sceneSixTime);
    fill(0, 0, 0, 255);
  } else {
    fill(235, 204, 80, 255);
  
  }

  rectMode(CORNERS);
  rect(478, 447, 868, 523);
  rectMode(CORNER);
  
  pushMatrix();
  noFill();
  imageMode(CORNERS);
  tint(160,160,160,255);
  image(barnImg, 405, 204, width, height + 2);
  popMatrix();
}


/***********************
 @desc: Scene 7
 displays the title of the animation
 ************************/
void sceneSeven() {
  setBackground(spaceImg, color(201, 201, 201, 255));
  setTitle("The End");  
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
  spaceshipA.setSpeed(9);


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
  sceneFourTime = 0;
  spaceshipC = new Spaceship(-2, height/4, 200, 200);
  spaceshipC.setSpeed(10);
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
  sceneSixTime = 0;
  alienB = new Alien(-2, (height - 100), 300, 250);
  alienB.setSpeed(10);
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
