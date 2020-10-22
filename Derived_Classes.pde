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
}

class Asteroid1 extends MyObject {
  PImage objImage = loadImage("asteroid-1.png");
  Asteroid1(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(objImage);
  }
}

class Asteroid2 extends MyObject {
  PImage objImage = loadImage("asteroid-2.png");
  Asteroid2(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(objImage);
  }
}

class Rocket extends MyObject {
  PImage objImage = loadImage("rocket.png");
  Rocket(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(objImage);
  }
}

class YellowCar extends MyObject {
  PImage objImage = loadImage("yellow-car.png");
  YellowCar(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(objImage);
  }
}

class BrownCar extends MyObject {
  PImage objImage = loadImage("brown-car.png");
  BrownCar(float pX, float pY, float pW, float pH) {
    super(pX, pY, pW, pH);
    super.setImage(objImage);
  }
}
