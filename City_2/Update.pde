void update() {

  if (gameState=="Intro") {
    pOne.update();
    for (int x=0; x<thugs.size(); x++) {
      Thug b = (Thug) thugs.get(x);
      b.update();
    }
    for (int x=0; x<bullets.size(); x++) {
      bullet b = (bullet) bullets.get(x);
      b.update();
    }
    welcome.update();
  } else if (gameState=="Active") {

    pOne.update();
    for (int x=0; x<thugs.size(); x++) {
      Thug b = (Thug) thugs.get(x);
      b.update();
    }
    for (int x=0; x<theBoss.size(); x++) {
      Thug b = (Thug) theBoss.get(x);
      b.update();
    }

    for (int x=0; x<block_List.size(); x++) {
      block b = (block) block_List.get(x);
      b.update();
    }

    for (int x=0; x<items.size(); x++) {
      item b = (item) items.get(x);
      b.update();
    }

    for (int x=0; x<bullets.size(); x++) {
      bullet b = (bullet) bullets.get(x);
      b.update();
    }
  } else {
    if (keyPressed) setup();
  }
}