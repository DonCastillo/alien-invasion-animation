/***********************
@desc: Alien Class
************************/
class Alien extends MyObject {
  // load all the alien images
  PImage front = loadImage("alien-front.png");
  PImage forward0 = loadImage("alien-right-0.png");
  PImage forward1 = loadImage("alien-right-1.png");
  PImage forward2 = loadImage("alien-right-2.png");
  PImage backward0 = loadImage("alien-left-0.png");
  PImage backward1 = loadImage("alien-left-1.png");
  PImage backward2 = loadImage("alien-left-2.png");
  
  boolean landed = false;
  
  // alien's y value that determines if alien's feet is on the ground
  float yLAND = (height - (h/2 - 25));
  
  
  /***********************
  @desc: creates alien object, initializes alien object specs
  ************************/
  Alien(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(front);
  }
  
  /***********************
  @desc: has the alien landed or not
  @return  true, false
  ************************/
  boolean hasLanded() {
    return landed;
  }
  
  /***********************
  @desc: move the alien down
  ************************/
  void descend() {
    if (yLAND > y) {
      super.descend();
    } else {
      landed = true;
    }
  }
  
  /***********************
  @desc: move the alien to the right
  ************************/
  void forward(int time) {
    super.forward();
    super.y = round(random(yLAND, yLAND + 10));  // make the alien jitter
    
    // sets different alien image 
    if (time % 3 == 0) {
      super.setImage(forward0);
    } else if(time % 3 == 1) {
      super.setImage(forward1);
    } else {
      super.setImage(forward2);
    }
  }
  
  /***********************
  @desc: move the alien to the left
  ************************/
  void backward(int time) {
    super.backward();
    super.y = round(random(yLAND, yLAND + 10)); // make the alien jitter
    
    // sets different alien image 
    if (time % 3 == 0) {
      super.setImage(backward0);
    } else if(time % 3 == 1) {
      super.setImage(backward1);
    } else {
      super.setImage(backward2);
    }
  }
}



/***********************
@desc: Spaceship Class
************************/
class Spaceship extends MyObject {
  // load spaceship image
  PImage objImage = loadImage("spaceship.png"); 
  float lightHeight = 0;
  boolean illuminated = false;
  
  /***********************
  @desc: creates spaceship object, initializes spaceship object specs
  ************************/
  Spaceship(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(objImage);
  }
  
  /***********************
  @desc: has the spaceship illuminated?
  @return: true, false
  ************************/
  boolean isIlluminated(){
    return illuminated;
  }
  
  /***********************
  @desc: makes the spaceship large
  ************************/
  void scaleUp() {
    if (h < height || w < width ) {
        super.scaleUp();
    } else {
      illuminate();
    }
  }
  
  /***********************
  @desc: let the spaceship cast light
  ************************/
  void illuminate() {
    pushMatrix();
    translate(x, y);
    fill(255,243,205, 120);
    noStroke();
    rectMode(CORNERS);
    if (lightHeight < height) {
      lightHeight = lightHeight + 50;  
    } else {
      illuminated = true;
    }
    rect(-(w/10), 0, (w/10), lightHeight);
    popMatrix();
  }
  
  /***********************
  @desc: remove the casted light from the spaceship
  ************************/
  void deluminate() {
    pushMatrix();
    translate(x, y);
    fill(255,243,205, 120);
    noStroke();
    rectMode(CORNERS);
    if (lightHeight > 0) {
      lightHeight = lightHeight - 50;  
    }
    rect(-(w/10), 0, (w/10), lightHeight);
    popMatrix();
  }
  

}

class Asteroid extends MyObject {
  
  /***********************
  @desc: creates asteroid object, initializes asteroid object specs
  ************************/
  Asteroid(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
  }
    
  /***********************
  @desc: rotates the asteroid
  ************************/
  void rotateClockwise() {
    pushMatrix();
    translate(x, y);
    float c = radians(angle);
    rotate(c);
    angle = angle + speed/2;
    imageMode(CENTER);
    image(image, 0, 0, w, h);
    popMatrix();
  }
}
