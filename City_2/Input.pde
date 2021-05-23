void input() { 
  click();
  leapord();
}

void leapord() {
  if (gameState=="Intro") {
    if (keyPressed) {

      if ((key == 'W') || (key == 'w')) {
        welcome.select();
      } else if ((key == 'S') || (key == 's') ) {
        welcome.backward();
      } 
      if ((key == 'A') || (key == 'a')) { 
        welcome.scLeft();
      } else if ((key == 'D') || (key == 'd')) {
        welcome.scRight();
      }
    }
  }
  if (gameState=="Active") {

    if (keyPressed==true) {
      if ((key == 'W') || (key == 'w')) {
        pOne.forward();
      } else if ((key == 'S') || (key == 's') ) {
        pOne.backward();
      } else if ((key == 'A') || (key == 'a')) { 
        pOne.right();
      } else if ((key == 'D') || (key == 'd')) {
        pOne.left();
      }
    }
  }
}

void click() {
  if (gameState=="Active") {
    if (mouseButton==LEFT&&mousePressed) {
      pOne.attack();
    }
  }
}