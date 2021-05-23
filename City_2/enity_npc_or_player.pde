class person {

  float xPos, yPos;
  float angle;
  int health;
  int radius=10;
  float speed=2;

  final int MAX_Health=100;


  person(int x, int y, int h) {
    xPos=x; 
    yPos=y;
    angle=0;
    health=h;
  }

  person(int x, int y, float a, int h) {
    xPos=x; 
    yPos=y;
    angle=a;
    health=h;
  }

  void render(PImage img) {
    pushMatrix();
    translate(xPos, yPos);
    if (gameState=="Active") scale(.7);
    rotate(angle);
    //ellipse(0,0,40,40);
    image(img, 7, 0);

    popMatrix();
  }
}


class Player extends person {

  int nodeX=600, nodeY=240;
  int MAX_Health;
  weapon test = new weapon(10, 100, 100, 20, "My Gun");
  Player() {
    super(380, 256, 0, 20);
    MAX_Health=20;
  }
  int cooldown;

  void update() {
    this.test.update();
    if (health>MAX_Health) health=MAX_Health;
    if (test.Ammo<=0) test.reload();
    if (gameState=="Active") {
      this.angle=atan2((mouseY-256), (mouseX-320));
      for (int x=0; x<bullets.size(); x++) {
        bullet b = (bullet) bullets.get(x);
        if (pow(16, 2)>pow(this.xPos-b.x, 2)+pow(this.yPos-b.y, 2)&&b.id!=1) { 
          this.health-=1;
          bullets.remove(b);
        }
        if (health<=0) gameState="Dead";
      }
    }
  }

  void forward() {
    boolean canMove = true;
    for (int t=0; t<block_List.size(); t++) {
      block p =(block) block_List.get(t);
      if (pow((p.X_Size/2)+radius, 2)>=(pow((xPos+cos(angle))-p.xPos, 2)+pow((yPos+sin(angle))-p.yPos, 2))) {
        if (!p.passable) {
          canMove=false;
          break;
        }
      }
    }

    if (canMove) {
      xPos+=cos(angle)*speed;
      yPos+=sin(angle)*speed;
    }
  }

  void backward() {
    boolean canMove = true;
    for (int t=0; t<block_List.size(); t++) {
      block p =(block) block_List.get(t);
      if (pow((p.X_Size/2)+radius, 2)>=(pow((xPos-cos(angle))-p.xPos, 2)+pow((yPos-sin(angle))-p.yPos, 2))) {
        if (!p.passable) {
          canMove=false;
          break;
        }
      }
    }

    if (canMove) {
      xPos-=cos(angle);
      yPos-=sin(angle);
    }
  }

  void left() {
  }

  void right() {
  }

  void attack() {
    test.attack(xPos, yPos, angle, 1);
  }

  void draw() {
    if (gameState=="Intro") {
      render(hero);
    } else {
      pushMatrix();
      scale(.8);
      translate(0, 0, 0);
      rotate(angle);
      //ellipse(0,0,250,250);
      image(hero, 7, 0);
      popMatrix();
    }
  }
}

class Thug extends person {
  weapon test;
  float scaleSprite=.7;
  Thug() {
    super(0, 0, PI, 2);
    speed=.9;
    test = new weapon();
  }
  Thug(int xTake, int yTake) {
    super(xTake, yTake, PI, 2);
    speed=.9;
    test = new weapon();
  }
  Thug(int xTake, int yTake, float angleTake) {
    super(xTake, yTake, angleTake, 2);
    speed=.9;
    test = new weapon();
  }
  Thug(int xTake, int yTake, float angleTake, weapon w, int h) {
    super(xTake, yTake, angleTake, h);
    speed=.9;
    test = w;
    scaleSprite=1;
  }
  void update() {
    if (gameState=="Intro") {
      if (test.Ammo==0) {
        test.reload();
      }
      test.cooldown--;
    } else if (gameState=="Active") {
      for (int x=0; x<bullets.size(); x++) {
        bullet b = (bullet) bullets.get(x);
        if (pow(32, 2)>pow(this.xPos-b.x, 2)+pow(this.yPos-b.y, 2))
          if (b.id!=6) { 
            this.health-=1;
            bullets.remove(b);
          }
      }

      if (health<=0&&gameState=="Active") die();

      if (pow(450, 2)>=(pow(this.xPos-pOne.xPos, 2)+pow(this.yPos-pOne.yPos, 2))) {
        this.angle=atan2((this.yPos-pOne.yPos), (this.xPos-pOne.xPos))-PI;       

        if (pow(100, 2)>=(pow(this.xPos-pOne.xPos, 2)+pow(this.yPos-pOne.yPos, 2))) {
          backward();
        } else if (pow(300, 2)>=(pow(this.xPos-pOne.xPos, 2)+pow(this.yPos-pOne.yPos, 2))) {
          forward();
          test.attack(xPos, yPos, angle, 6);
        }
        if (test.Ammo==0) {
          test.reload();
        }
        test.cooldown--;
      }
    }
  }
  void forward() {
    boolean canMove = true;
    for (int t=0; t<block_List.size(); t++) {
      block p =(block) block_List.get(t);
      if (pow((p.X_Size/2)+radius, 2)>=(pow((xPos+cos(angle))-p.xPos, 2)+pow((yPos+sin(angle))-p.yPos, 2))) {
        if (!p.passable) {
          canMove=false;
          break;
        }
      }
    }

    if (canMove) {
      xPos+=cos(angle)*speed;
      yPos+=sin(angle)*speed;
    } else {
      //xPos-=cos(angle);
      //yPos-=sin(angle);
    }
  }

  void backward() {
    boolean canMove = true;
    for (int t=0; t<block_List.size(); t++) {
      block p =(block) block_List.get(t);
      if (pow((p.X_Size/2)+radius, 2)>=(pow((xPos-cos(angle))-p.xPos, 2)+pow((yPos-sin(angle))-p.yPos, 2))) {
        if (!p.passable) {
          canMove=false;
          break;
        }
      }
    }

    if (canMove) {
      xPos-=cos(angle)*speed;
      yPos-=sin(angle)*speed;
    }
  }
  void attack() {
    test.attack((int)xPos, (int) yPos, angle, 55);
  }
  void die() { 
    thugs.remove(this);
    theBoss.remove(this);
  }
  void draw() {
    pushMatrix();
    translate(xPos, yPos);
    if (gameState=="Active") scale(scaleSprite);
    rotate(angle);
    image(thug, 7, 0);
    popMatrix();
  }
}