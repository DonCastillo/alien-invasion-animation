/***********************
@desc: Object Class
************************/
class MyObject {
  float x = 0.00;  // x-coordinate
  float y = 0.00;  // y-coordinate
  float h = 0.00;  // object height
  float w = 0.00;  // object width
  float speed = 0.00;
  PImage image;  // object image
  
  /***********************
  @desc: creates spaceship objet, initializes spaceship object specs
  ************************/
  MyObject(float pX, float pY, float pW, float pH) {
    x = pX;
    y = pY;
    w = pW;
    h = pH;
    speed = 1;
  }
  
  void setSpeed(float pSpeed) {
    speed = pSpeed;
  }
  void setImage(PImage pImage) {
    image = pImage;
  }
  
  void display() {
    imageMode(CENTER);
    image(image, x, y, w, h);
  }
  
  void forward() {
    x = x + speed;
  }
  
  void backward() {
    x = x - speed;
  }
  
  void ascend() {
    y = y - speed;
  }
  
  void descend() {
    y = y + speed;
  }
  
  void scaleUp() {
    h = h + speed;
    w = w + speed;
  }
  
  void scaleDown() {
    if ( h > 0) {
      h = h - speed;
    } 
    else {
      h = 0;
    }
    
    if ( w > 0 ) {
      w = w - speed;
    }
    else {
      w = 0;
    }
  }

  void toTopLeft() {
    ascend();
    backward();
  }
  
  void toTopRight() {
    ascend();
    forward();
  }
  
  void toBottomLeft() {
    descend();
    backward();
  }
  
  void toBottomRight() {
    descend();
    forward();
  }
}
