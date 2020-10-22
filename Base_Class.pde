/***********************
@desc: Object Class
************************/
class MyObject {
  float x = 0;  // x-coordinate
  float y = 0;  // y-coordinate
  float h = 0;  // object height
  float w = 0;  // object width
  PImage image;  // object image
  
  /***********************
  @desc: creates spaceship objet, initializes spaceship object specs
  ************************/
  MyObject(float pX, float pY, float pW, float pH) {
    x = pX;
    y = pY;
    w = pW;
    h = pH;
  }
  
  void setImage(PImage pImage) {
    image = pImage;
  }
  
  // zoomIn
  // zoomOut
  // ascend
  // descend
  // forward
  // backward
  // toTopLeft
}
