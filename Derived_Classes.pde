class Alien extends MyObject {
  PImage front = loadImage("alien-front.png");
  PImage forward0 = loadImage("alien-right-0.png");
  PImage forward1 = loadImage("alien-right-1.png");
  PImage forward2 = loadImage("alien-right-2.png");
  PImage backward0 = loadImage("alien-left-0.png");
  PImage backward1 = loadImage("alien-left-1.png");
  PImage backward2 = loadImage("alien-left-2.png");
  PImage currentLook;
  boolean landed = false;
  float yLAND = (height - (h/2 - 25));
  
  Alien(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(front);
  }
  
  boolean hasLanded() {
    return landed;
  }
  
  //void display() {
  //  super.display();
  //}
  
  void descend() {
    if (yLAND > y) {
      super.descend();
    } else {
      landed = true;
    }
  }
  
  void forward(int time) {
    super.forward();
    super.y = round(random(yLAND, yLAND + 10));
    println(super.x);
    if (time % 3 == 0) {
      super.setImage(forward0);
    } else if(time % 3 == 1) {
      super.setImage(forward1);
    } else {
      super.setImage(forward2);
    }
  }
  
  void backward(int time) {
    super.backward();
    super.y = round(random(yLAND, yLAND + 10));
    if (time % 3 == 0) {
      super.setImage(backward0);
    } else if(time % 3 == 1) {
      super.setImage(backward1);
    } else {
      super.setImage(backward2);
    }
  }
  
    //  pushMatrix();
    //translate(x, y);
    //imageMode(CENTER);
    //image(image, 0, 0, w, h);
    //popMatrix();
  
  // forward
  // backward
  // descend
  // ascend
}

class Spaceship extends MyObject {
  PImage objImage = loadImage("spaceship.png"); 
  float lightHeight = 0;
  //float lightWidth = w;
  boolean illuminated = false;
  
  Spaceship(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(objImage);
  }
  
  boolean isIlluminated(){
    return illuminated;
  }
  
  void scaleUp() {
    if (h < height || w < width ) {
        super.scaleUp();
    } else {
      illuminate();
    }
  }
  
  void illuminate() {
    pushMatrix();
    translate(x, y);
    fill(255,243,205, 120);
    noStroke();
    rectMode(CORNERS);
    if (lightHeight < height) {
      lightHeight = lightHeight + 30;  
    } else {
      illuminated = true;
    }
    rect(-(w/10), 0, (w/10), lightHeight);
    //println(lightHeight);
    popMatrix();
  }
  
  void deluminate() {
    pushMatrix();
    translate(x, y);
    fill(255,243,205, 120);
    noStroke();
    rectMode(CORNERS);
    if (lightHeight > y) {
      lightHeight = lightHeight - 30;  
    }
    rect(-(w/8), 0, (w/8), lightHeight);
    //println(lightHeight);
    popMatrix();
  }
  

}

class Asteroid extends MyObject {
  //PImage objImage = loadImage("asteroid-1.png");
  Asteroid(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    //super.setImage(objImage);
  }
    
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
