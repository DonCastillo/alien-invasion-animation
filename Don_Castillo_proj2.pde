/***********************
 Don Castillo, NMED 3380 B
 Project 2: The Unexpected Visitor Animation
 Last Modified: 10/24/2020 10:30PM 
 ************************/


/***********************
 @desc: Global Variables
 ************************/
 
// sound libraries
import ddf.minim.*;
Minim minim;

// declare audio variables
AudioPlayer SPACESHIP_IN_SPACE;
AudioPlayer TO_THE_EARTH;
AudioPlayer GLIDE;
AudioPlayer EXITING;
AudioPlayer LANDING;
AudioPlayer FOOTSTEP;
AudioPlayer DOOR;
AudioPlayer SCREAM;

// declare font variable
PFont font;

// declare image variables
PImage spaceImg;
PImage rocketImg;
PImage asteroid1Img;
PImage asteroid2Img; 
PImage earthImg; 
PImage fieldImg;
PImage skylineImg; 
PImage nightImg; 
PImage farmImg; 
PImage barnImg;

// declare objects
Asteroid asteroidTop, asteroidDiagonal;
Spaceship spaceshipA, spaceshipB, spaceshipC, spaceshipD;
Alien[] alienA;
Alien alienB;
MyObject rocket, earth;

// setup loading time
int time;  

// individual counter per scene
int sceneFiveTime, sceneFourTime, sceneSixTime;

// is it the last scene true or false?
boolean isLastScene;


/***********************
@desc: Sets up the objects and assets needed for the animation  
************************/
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
  asteroid1Img = loadImage("asteroid-1.png");
  asteroid2Img = loadImage("asteroid-2.png");
  earthImg = loadImage("earth.png");
  fieldImg = loadImage("field.jpg");
  skylineImg = loadImage("skyline.png"); 
  nightImg = loadImage("night.jpg");
  farmImg = loadImage("farm.jpg");
  barnImg = loadImage("barn.png");
  
  // load all sound effects
  minim = new Minim(this);
  SPACESHIP_IN_SPACE = minim.loadFile("spaceshipInSpace.mp3");
  TO_THE_EARTH = minim.loadFile("toTheEarth.mp3");
  GLIDE = minim.loadFile("longglide.mp3");
  EXITING = minim.loadFile("exiting.mp3");
  LANDING = minim.loadFile("landing.mp3");
  FOOTSTEP = minim.loadFile("footstep.mp3");
  DOOR = minim.loadFile("door.mp3");
  SCREAM = minim.loadFile("scream.mp3");
  
  // set scene objects
  setSceneTwoObjects();
  setSceneThreeObjects();
  setSceneFourObjects();
  setSceneFiveObjects();
  setSceneSixObjects();

  
  time = millis();
  frameRate(60);
  isLastScene = false;
}


/***********************
@desc: Plays each scene depending on the elapsed time 
************************/
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
  else if(m >= 37000 && m < 44000){
    sceneSix();
  }
  else if(m >= 44000 && m < 48000){
    sceneSeven();
  }
  else{
    sceneEight();
    m = millis();
    isLastScene = true;
  }
}

/***********************
@desc: Keyboard controls
************************/
void keyPressed() {
  switch(key) {
    case ' ':
      if(isLastScene){
        setup();  
      }
      break;
  }
}

/**********************************************************************************
 SCENES
 **********************************************************************************/
 
    /***********************
     @desc: Scene 1
            displays the title of the animation
     ************************/
    void sceneOne() {
      // scene background
      setBackground(spaceImg, color(201, 201, 201, 255));  
      
      // scene title
      setTitle("The Unexpected Visitor");                               
    }


    /***********************
     @desc: Scene 2
            lone spaceship travels in space
     ************************/
    void sceneTwo() {
      // scene background
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
      
      // play spaceship sound
      SPACESHIP_IN_SPACE.play();
    
      // display rocket
      rocket.display();
      rocket.toTopLeft();
    }


    /***********************
     @desc: Scene 3
            spaceship travels to Earth
     ************************/
    void sceneThree() {
      // stop previous sound
      SPACESHIP_IN_SPACE.close();
      
      // scene background
      setBackground(spaceImg, color(201, 201, 201, 255));
    
      // display earth
      earth.display();
    
      // display spaceship
      spaceshipB.display();
      spaceshipB.scaleDown();
      
      // play spaceship sound
      TO_THE_EARTH.play();
    }


    /***********************
     @desc: Scene 4
            spaceship glides over the city
     ************************/
    void sceneFour() {
      // stops previous sound
      TO_THE_EARTH.close();
      
      // scene counter
      sceneFourTime++;
      
      // display night sky background
      background(0);
      setBackground(nightImg, color(150, 150, 150, 225));
      
      // make spaceship move
      spaceshipC.forward();
      
      //playing gliding sound
      GLIDE.play();
    
      // make the spaceship cast light at a specified time
      if((spaceshipC.x >= 150 && spaceshipC.x <= 250) || (spaceshipC.x >= 450 && spaceshipC.x <= 550) || (spaceshipC.x >= 750 && spaceshipC.x <= 850)) {
        spaceshipC.illuminate();
      } else {
        spaceshipC.deluminate();
      }
     
      // display spaceship
      spaceshipC.display();
      
      // dispplay building foreground
      setBackground(skylineImg, color(150, 150, 150, 250));
    }


    /***********************
     @desc: Scene 5
            aliens land
     ************************/
    void sceneFive() {
      // stop previous sound
      GLIDE.close();
      
      // scene counter
      sceneFiveTime++;
    
      // scene background
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
      
      // play sounds depending on the elapsed time
      if(sceneFiveTime >= 100 && sceneFiveTime <= 150){
        EXITING.play();
      } else if(sceneFiveTime > 151 ){
        EXITING.close();
        LANDING.play();
      }
    }



    /***********************
     @desc: Scene 6
            alien awakens a sleeping human
     ************************/
    void sceneSix() {
      // stop previous sound
      LANDING.close();
      
      // scene counter
      sceneSixTime++;
      
      // scene background
      setBackground(farmImg, color(150, 150, 150, 255));
      
      // display alien
      alienB.display();
      
      // footstep sound
      if(alienB.x < 678){
        alienB.forward(sceneSixTime);
        FOOTSTEP.play();
        fill(0, 0, 0, 255);
      } else {
        FOOTSTEP.close();
        fill(235, 204, 80, 255);
      }
     
       // door sound
       if(sceneSixTime >= 35 && sceneSixTime <= 50){
         DOOR.play();
       } 
       
       // scream sound
       if(sceneSixTime >= 70 && sceneSixTime <= 120){
         DOOR.close();
         SCREAM.play();
       } else if(sceneSixTime > 121){
         SCREAM.close();
       } else {
       }
   
      // light inside the barn
      rectMode(CORNERS);
      rect(478, 447, 868, 523);
      rectMode(CORNER);
      
      // barn image
      pushMatrix();
      noFill();
      imageMode(CORNERS);
      tint(160,160,160,255);
      image(barnImg, 405, 204, width, height + 2);
      popMatrix();
    }


    /***********************
     @desc: Scene 7
            displays end sequece
     ************************/
    void sceneSeven() {
      setBackground(spaceImg, color(201, 201, 201, 255));
      setTitle("The End");  
    }
    
     /***********************
     @desc: Scene 8
            displays credits
     ************************/
    void sceneEight() {
       setBackground(spaceImg, color(201, 201, 201, 255));
       pushMatrix();
       translate(50, 50);
       textSize(20);
       textAlign(LEFT, TOP);
       text("Animation by Don Castillo", 0, 0);
       text("Vector images drawn by Don Castillo", 0, 30);
       text("SOUND EFFECTS", 0, 100);
       text("Alien/UFO sound, from superfunnysheet", 0, 130);
       text("Door sound, from Sounds Recorded", 0, 160);
       text("Footstep sound, from SFX Box", 0, 190);
       text("Scream sound, from Colors of Videos", 0, 220);
       
       text("IMAGES", 0, 300);
       text("Rural at Night, from kissCC0", 0, 330);
       text("City skyline at night, from PngItem", 0, 360);
       text("Night sky, from Karen Hovsepyan video", 0, 390);
       text("Space, from WallpaperAccess", 0, 420);
       popMatrix();
    }



/**********************************************************************************
  SCENE SETUP
**********************************************************************************/

    /***********************
     @desc: Scene 2
     ************************/
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


    /***********************
     @desc: Scene 3
     ************************/
    void setSceneThreeObjects() {
      // set earth
      earth = new MyObject(width/2, height/2, 800, 600);
      earth.setImage(earthImg);
    
      // set spaceship
      spaceshipB = new Spaceship(width/2, height/2, width * 2, width * 2);
      spaceshipB.setSpeed(75);
    }

    /***********************
     @desc: Scene 4
     ************************/
    void setSceneFourObjects() {
      sceneFourTime = 0;
      spaceshipC = new Spaceship(-2, height/4, 200, 200);
      spaceshipC.setSpeed(10);
    }

    /***********************
     @desc: Scene 5
     ************************/
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
    }

    /***********************
     @desc: Scene 6
     ************************/
    void setSceneSixObjects() {
      sceneSixTime = 0;
      alienB = new Alien(-2, (height - 100), 300, 250);
      alienB.setSpeed(10);
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
