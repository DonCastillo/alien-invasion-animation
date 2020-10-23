class Alien extends MyObject {
  PImage front = loadImage("alien-front.png");
  PImage forward0 = loadImage("alien-right-0.png");
  PImage forward1 = loadImage("alien-right-1.png");
  PImage forward2 = loadImage("alien-right-2.png");
  PImage backward0 = loadImage("alien-left-0.png");
  PImage backward1 = loadImage("alien-left-1.png");
  PImage backward2 = loadImage("alien-left-2.png");
  PImage currentLook;

  
  Alien(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(front);
  }
  
  //void display() {
  //  color
  //  super.display();
  //}
  
  //void descend() {
  //  //pushMatrix();
    
  //  //popMatrix();
  //}
  
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
    rect(-(w/8), 0, (w/8), lightHeight);
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
    
    //switch(motion) {
    //  case "forward":
    //    //super.forward();
    //    x++;
    //    break;
    //  case "backward":
    //    super.backward();
    //    break;
    //  case "toTopRight":
    //    super.toTopRight();
    //    break;
    //  case "toTopLeft":
    //    super.toTopLeft();
    //    break;
    //  case "toBottomRight":
    //    super.toBottomRight();
    //    break;
    //  case "toBottomLeft":
    //    super.toBottomLeft();
    //    break;
    //  case "ascend":
    //    super.ascend();
    //    break;
    //  case "descend":
    //    super.descend();
    //    break;
    //  default:
    //    break;
    //}
  }
}
