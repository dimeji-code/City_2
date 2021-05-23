class block {

  int xPos;
  int yPos;
  int X_Size;
  int Y_Size;
  boolean passable;
  PImage img;

  block(int x, int y, boolean p, PImage i) {
    xPos=x;
    yPos=y;
    X_Size=32;
    Y_Size=32;
    passable=p;
    img=i;
  }

  block(int x, int y, int xS, int yS, boolean p, PImage i) {
    xPos=x;
    yPos=y;
    X_Size=xS;
    Y_Size=yS;
    passable=p;
    img=i;
  }

  void render() {
    image(img, xPos, yPos);
    if (debugMode) ellipse(xPos, yPos, 32, 32);
  }

  void update() {
  }
}

class noBlock extends block {

  noBlock(int x, int y, PImage i) {
    super(x, y, false, i);
  }

  noBlock(int x, int y, int xS, int yS, PImage i) {
    super(x, y, xS, yS, false, i);
  }

  void render() {
  }
}

class door extends block {

  String destination;
  int xTarget, yTarget;

  door(int x, int y, int index, int xT, int yT) {
    super(x, y, true, null);
    xTarget=xT;
    yTarget=yT;
    destination = (String) doorListDestinations.get(index);
  }

  void update() {
    if (theBoss.size()<=0) {
      img=doorOpen;
      passable=true;
    } else {
      img=doorClose;
      passable=false;
    }

    activate();
  }

  void activate() {
    if (pow(16, 2)>pow(pOne.xPos-this.xPos, 2)+pow(pOne.yPos-this.yPos, 2)) {
      generate.level_next(destination);
      pOne.xPos=xTarget;
      pOne.yPos=yTarget;
    }
  }

  void render() { 
    if (img!=null)
      image(img, xPos, yPos);
  }
}