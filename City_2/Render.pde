void render() {
  background(0);
  //BackGound

  if (gameState=="Intro") {
    camera(320, 256, 444, 320, 256, 0, 0.0, 1.0, 0.0);    
    for (int x=0; x<block_List.size(); x++) {
      block p =(block) block_List.get(x);
      p.render();
    } 
    welcome.render();
    pOne.test.draw();
  } else if (gameState=="Active") {

    int draw_distance=400;

    camera(pOne.xPos, pOne.yPos, 300, pOne.xPos, pOne.yPos, 0, 0.0, 1.0, 0.0);
    //translate(pOne.xPos-320,pOne.yPos-400);
    for (int x=0; x<block_List.size(); x++) {
      block p =(block) block_List.get(x);
      if (pow(draw_distance, 2)>=(pow(pOne.xPos-p.xPos, 2)+pow(pOne.yPos-p.yPos, 2))) {
        p.render();
      }
    }  
    //NPCS
    for (int x=0; x<thugs.size(); x++) {
      Thug b = (Thug) thugs.get(x);
      if (pow(draw_distance, 2)>=(pow(pOne.xPos-b.xPos, 2)+pow(pOne.yPos-b.yPos, 2))) {
        b.draw();
      }
    }

    for (int x=0; x<theBoss.size(); x++) {
      Thug b = (Thug) theBoss.get(x);
      if (pow(draw_distance, 2)>=(pow(pOne.xPos-b.xPos, 2)+pow(pOne.yPos-b.yPos, 2))) {
        b.draw();
      }
    }

    //Items
    for (int x=0; x<items.size(); x++) {
      item b = (item) items.get(x);
      if (pow(draw_distance, 2)>=(pow(pOne.xPos-b.xPos, 2)+pow(pOne.yPos-b.yPos, 2))) {
        b.render();
      }
    }
    //Bullets
    for (int x=0; x<bullets.size(); x++) {
      bullet b = (bullet) bullets.get(x);
      if (pow(draw_distance, 2)>=(pow(pOne.xPos-b.x, 2)+pow(pOne.yPos-b.y, 2))) {
        b.draw();
      }
    }

    camera(0, 0, 299, 0, 0, 0, 0.0, 1.0, 0.0);
    HUD();
    pOne.draw();
    pOne.test.draw();
  } else if (gameState=="Death") {

    stroke(255);
    fill(0);
    rect(0, 0, 360, 150);

    fill(0, 255, 0);
    textAlign(CENTER);
    textSize(16);
    text("Died in the Action", 0, 0);
    textSize(8);
    text("Press Any key to Return to Menue", 0, 20);
    stroke(0);//*/
  } else if (gameState=="Win") {

    stroke(255);
    fill(0);
    rect(0, 0, 360, 150);

    fill(0, 255, 0);
    textAlign(CENTER);
    textSize(16);
    text("You Win! You have Liberated the city! ", 0, 0);
    textSize(8);
    text("Press Any key to Return to Menue", 0, 20);
    stroke(0);//*/
  }
}

void HUD() {
  pushMatrix();
  scale(.75);
  fill(255, 255, 255);
  rect(0, 226, 640, 45);
  fill(0);
  textSize(12);
  text("Health: "    +pOne.health, -75, 220);
  text("Ammo: "      +pOne.test.Ammo+"/"+pOne.test.Clip_Ammo, 30, 220);
  text("Ammo Clip: " + pOne.test.Ammo_Reserve+"/"+pOne.test.Max_Ammo, 150, 220);

  popMatrix();
} 