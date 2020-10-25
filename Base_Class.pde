/***********************
@desc: Object Class
************************/
class MyObject {
  float x = 0.00;  // x-coordinate
  float y = 0.00;  // y-coordinate
  float h = 0.00;  // object height
  float w = 0.00;  // object width
  float speed = 0.00;  // speed
  PImage image;  // object image
  
  
  /***********************
  @desc: creates spaceship objet, initializes spaceship object specs
  ************************/
  MyObject(float pX, float pY, float pW, float pH) {
    x = pX;
    y = pY;
    w = pW;
    h = pH;
    speed = 1;  // default speed
  }
  
  /***********************
  @desc: sets object speed
  @param:  speed to be added
  ************************/
  void setSpeed(float pSpeed) {
    speed = pSpeed;
  }
  
  /***********************
  @desc: sets object image
  @param:  image to be set
  ************************/
  void setImage(PImage pImage) {
    image = pImage;
  }
  
  /***********************
  @desc: get object image
  @return:  object image  
  ************************/
  PImage getImage(){
    return image;
  }
  
  /***********************
  @desc: display object image
  ************************/
  void display() {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    image(image, 0, 0, w, h);
    popMatrix();
  }
  
  /***********************
  @desc: move object to the right
  ************************/
  void forward() {
    x = x + speed;
  }
  
  /***********************
  @desc: move object to the left
  ************************/
  void backward() {
    x = x - speed;
  }
  
  /***********************
  @desc: move object up
  ************************/
  void ascend() {
    y = y - speed;
  }
  
  /***********************
  @desc: move object down
  ************************/
  void descend() {
    y = y + speed;
  }
  
  /***********************
  @desc: zoom in the object
  ************************/
  void scaleUp() {
    h = h + speed;
    w = w + speed;
  }
  
  /***********************
  @desc: zoom out the object
  ************************/
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

  /***********************
  @desc: move the object to the top left
  ************************/
  void toTopLeft() {
    ascend();
    backward();
  }
  
  /***********************
  @desc: move the object to the top right
  ************************/
  void toTopRight() {
    ascend();
    forward();
  }
  
  /***********************
  @desc: move the object to the bottom left
  ************************/
  void toBottomLeft() {
    descend();
    backward();
  }
  
  /***********************
  @desc: move the object to the bottom right
  ************************/
  void toBottomRight() {
    descend();
    forward();
  }
}
