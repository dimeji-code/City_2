class Intro {
  int timer=0;
  int cooldown=0;
  int state=-1;
  void update() {

    if (timer==0) {
      thugs.clear();
      bullets.clear();
      pOne.xPos=-50;
      pOne.yPos=190;
      pOne.angle=0;
      thugs.add(new Thug(370, 250, PI/8));      //Thug 0 TL
      thugs.add(new Thug(480, 250, PI-PI/8));   //Thug 1 TR
      thugs.add(new Thug(370, 320, -PI/8));     //Thug 2 BL
      thugs.add(new Thug(480, 320, PI+PI/8));   //Thug 3 BR
    }
    if (timer>60&&timer<190) {
      pOne.xPos++;
      pOne.xPos++;
    }
    if (timer==175) {
      Thug b = (Thug) thugs.get(0);
      b.angle=0;
      b = (Thug) thugs.get(1);
      b.angle=7*PI/8;
      b = (Thug) thugs.get(2);
      b.angle=-PI/4;
    }
    if (timer==177) {
      Thug b = (Thug) thugs.get(0);
      b.angle=-PI/8;
      b = (Thug) thugs.get(1);
      b.angle=-3*PI/4;
    }
    if (timer==179) {
      Thug b = (Thug) thugs.get(0);
      b.angle=-PI/4;
      b = (Thug) thugs.get(1);
      b.angle=-PI/4;
      b = (Thug) thugs.get(2);
      b.angle=-PI/2;
    }
    if (timer==181) {
      Thug b = (Thug) thugs.get(0);
      b.angle=-3*PI/8;
      b = (Thug) thugs.get(1);
      b.angle=-5*PI/8;
      b = (Thug) thugs.get(2);
      b.angle=-5*PI/8;
    }
    if (timer==183) {
      Thug b = (Thug) thugs.get(0);
      b.angle=-PI/2;
      b = (Thug) thugs.get(1);
      b.angle=-3*PI/4;
      b = (Thug) thugs.get(2);
      b.angle=-3*PI/4;
    }
    if (timer==185) {
      Thug b = (Thug) thugs.get(0);
      b.angle=-5*PI/8;
      b = (Thug) thugs.get(1);
      b.angle=-7*PI/8;
      b = (Thug) thugs.get(2);
      b.angle=-7*PI/8;
    }
    if (timer==187) {
      Thug b = (Thug) thugs.get(0);
      b.angle=-3*PI/4;
    }
    if (timer==189) {
      Thug b = (Thug) thugs.get(0);
      b.angle=-7*PI/8;
    }
    if (timer==190) {
      pOne.angle=PI/8;
      pOne.attack();
    }
    if (timer>200&&timer<350) {
      pOne.angle=0;
      pOne.xPos++;
    }
    if (timer==225) {
      Thug b = (Thug) thugs.get(2);
      b.angle=-6*PI/8;
    }
    if (timer==250) {
      Thug b = (Thug) thugs.get(2);
      b.angle=-5*PI/8;
    }
    if (timer==275) {
      Thug b = (Thug) thugs.get(2);
      b.angle=-4*PI/8;
    }
    if (timer==225) {
      //bullets.remove(0);
    }

    if (timer==265) {
      thugs.remove(0);
    }
    if (timer==320) {
      thugs.remove(2);
    }
    if (timer==320) {
      bullets.remove(0);
      bullets.add(new bullet(480, 250, -7*PI/8));
      bullets.add(new bullet(370, 320, -7*PI/8));
    }
    if (timer==390) {
      bullets.remove(0);
      pOne.angle=PI/8;
      pOne.attack();
    }
    if (timer==410) {
      bullets.remove(0);
    }  
    if (timer==410) {
      pOne.angle=PI/4;
    }
    if (timer==415) {
      pOne.angle=3*PI/8;
    }
    if (timer==420) {
      pOne.angle=-3*PI/2;
    }
    if (timer==425) {
      bullets.add(new bullet(357, 190, 14*PI/8));
    }
    if (timer==450) {
      bullets.remove(0);
      thugs.remove(0);
      bullets.add(new bullet(370, 320, 6*PI/8));
    }
    if (timer==475) {
      bullets.remove(0);
      thugs.remove(0);
      pOne.angle=0;
    }
    if (timer>500) {
      pOne.xPos++;
    }

    timer++;
    if (timer>900) {
      timer=0;
    }

    if (cooldown>0) {
      cooldown--;
    }
  }

  void render() {

    welcome.playGround();
    welcome.Title(180, 80);
    pOne.draw();
    for (int x=0; x<bullets.size(); x++) {
      bullet b = (bullet) bullets.get(x);
      b.draw();
    }
    for (int x=0; x<thugs.size(); x++) {
      Thug b = (Thug) thugs.get(x);
      b.draw();
    }
    if (welcome.state==0) {
      welcome.highLight(255, 0, 0, 60, 295);
    }    
    if (welcome.state==1) {
      welcome.highLight(255, 0, 255, 60, 385);
    }
    if (welcome.state==2) {
      welcome.highLight(0, 0, 255, 60, 475);
    }
    welcome.Button(60, 300, "Start");
    welcome.Button(60, 390, "Controls");
    welcome.Button(60, 480, "Credits");
    if (welcome.state==3) {
      welcome.userControl();
    } 
    if (welcome.state==4) {
      welcome.rena();
    }
    if (welcome.state==5) {
      welcome.credits();
    }
  }

  void Title(int x, int y) {

    pushMatrix();
    translate(x, y);
    //Decor

    //Text
    fill(0, 255, 0);
    textSize(32);
    textAlign(CENTER);
    text("City Liberation", -30, -30);
    text("Game", -30, 10);

    popMatrix();
  }
  void playGround() {

    image(car0, 4.25*64, 3.75*64);
    image(car1, 5.25*64, 3.75*64);
    image(car2, 4.25*64, 4.75*64);
    image(car3, 5.25*64, 4.75*64);

    image(car0, 8.75*64, 3.75*64);
    image(car1, 9.75*64, 3.75*64);
    image(car2, 8.75*64, 4.75*64);
    image(car3, 9.75*64, 4.75*64);

    image(car0, 4.25*64, 6*64);
    image(car1, 5.25*64, 6*64);
    image(car2, 4.25*64, 7*64);
    image(car3, 5.25*64, 7*64);
  }


  void Button(int x, int y, String text) {
    pushMatrix();
    translate(x, y);
    //Decor



    //text
    fill(0, 255, 0);
    textSize(16);
    text(text, 0, 0);
    popMatrix();
  }
  void highLight(int R, int G, int B, int X, int Y) {
    pushMatrix();
    translate(X, Y);
    fill(R, G, B);
    ellipseMode(CENTER);
    ellipse(0, 0, 100, 50);
    popMatrix();
  }

  void userControl() {
    stroke(255);
    fill(0);
    rect(320, 240, 600, 400);

    fill(0, 255, 0);
    textAlign(LEFT);
    textSize(32);
    text("The game's Controls", 60, 100);

    textSize(16);
    text("Press 'W' to move forward", 60, 150);
    text("Press 'A' to move backward", 60, 170);
    text("Press 'S' to move left", 60, 190);
    text("Press 'D' to move right", 60, 210);

    text("Use the MOUSE to aim", 60, 250);
    text("Use the LEFT mouse Button to fire", 60, 270);
    text("Use the RIGHT mouse Button to fire", 60, 290);
    text("", 60, 290);
    stroke(0);
  }
  void credits() {
    stroke(255);
    fill(0);
    rect(320, 240, 600, 400);

    fill(0, 255, 0);
    textAlign(LEFT);
    textSize(16);
    text("Created by:", 60, 100);
    text("Dimeji situ 101009206", 60, 140);
    text("Anders Sonstenes 101013731", 60, 160);

    text("New United Empire weapon sprites", 60, 200);
    text("thashepherd", 60, 220);
    text("http://www.moddb.com/mods/sonata/news/new-united-empire-weapon-sprites", 60, 240);


    text("The made by the OpenArt user Kenny", 60, 260);
    text("Topdown Shooter", 60, 280);
    text("http://opengameart.org/content/topdown-shooter", 60, 300);
    text("Roguelike Modern City Pack", 60, 320);
    text("http://opengameart.org/content/roguelike-modern-city-pack", 60, 340);
    text("", 120, 290);
    stroke(0);
  }

  void rena() {
    generate.level_next("levelSelectRoomMrkII.txt");
    pOne.xPos=(35*32)+16;
    pOne.yPos=(14*32)+16;
    /*stroke(255);
     fill(0);
     rect(320,240, 360, 150);
     
     fill(0, 255, 0);
     textAlign(CENTER);
     textSize(16);
     text("Prototype under Development. ", 320, 240);
     stroke(0);//*/
  }
  void select() {
    if (cooldown==0) {
      if (state==0) {
        state=4;
      }
      if (state==1) {
        state=3;
      }
      if (state==2) {
        state=5;
      }
      cooldown=20;
    }
  }
  void backward() {
    if (cooldown==0) {
      if (state==3||state==4||state==5) {
        state=-1;
      }
      cooldown=20;
    }
  }
  void scLeft() {
    if (cooldown==0) {
      if (state==-1) {
        state=2;
      } else if (state==0) {
        state=2;
      } else if (state==1) {
        state=0;
      } else if (state==2) {
        state=1;
      }
      cooldown=20;
    }
  }
  void scRight() {
    if (cooldown==0) {
      if (state==-1) {
        state=0;
      } else if (state==0) {
        state=1;
      } else if (state==1) {
        state=2;
      } else if (state==2) {
        state=0;
      }
      cooldown=20;
    }
  }
}