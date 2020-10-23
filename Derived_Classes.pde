class Alien extends MyObject {
  PImage objImage = loadImage("spaceship.png");   

  
  Alien(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(objImage);
  }
  
  // forward
  // backward
  // descend
  // ascend
}

class Spaceship extends MyObject {
  PImage objImage = loadImage("spaceship.png"); 
  float lightHeight = 0;
  //float lightWidth = w;
  
  Spaceship(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(objImage);
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
    lightHeight = lightHeight + 30;
    translate(x, y);
    fill(255,243,205, 120);
    //noFill();
    noStroke();
    rectMode(CORNERS);
    rect(-(w/8), 0, (w/8), lightHeight);
    //for (int i = y; i <= y + h; i++) {
    //  float inter = map(i, y, y+h, 0, 1);
    //  color c = lerpColor(c1, c2, inter);
    //  stroke(c);
    //  line(x, i, x+w, i);
    //}
    //println(lightWidth + " " + lightHeight);
    println("width; " + w + " " + "height: " + h);
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
