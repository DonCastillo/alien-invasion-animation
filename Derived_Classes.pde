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
  Spaceship(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(objImage);
  }
  
  void scaleUp() {
    if (h < height || w < width ) {
        super.scaleUp();
    } else {
      fill(255);
      rectMode(CENTER);
      rect(width/2, height/2, 100, 100);
    }
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

//class Asteroid2 extends MyObject {
//  PImage objImage = loadImage("asteroid-2.png");
//  Asteroid2(float pX, float pY, float pW, float pH) {
//    super(pX, pY, pW, pH);
//    super.setImage(objImage);
//  }
//}

//class Rocket extends MyObject {
//  PImage objImage = loadImage("rocket.png");
//  Rocket(float pX, float pY, float pW, float pH) {
//    super(pX, pY, pW, pH);
//    super.setImage(objImage);
//  }
//}

//class YellowCar extends MyObject {
//  PImage objImage = loadImage("yellow-car.png");
//  YellowCar(float pX, float pY, float pW, float pH) {
//    super(pX, pY, pW, pH);
//    super.setImage(objImage);
//  }
//}

//class BrownCar extends MyObject {
//  PImage objImage = loadImage("brown-car.png");
//  BrownCar(float pX, float pY, float pW, float pH) {
//    super(pX, pY, pW, pH);
//    super.setImage(objImage);
//  }
//}
