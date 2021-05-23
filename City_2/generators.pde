// Block Render

void enviroRender() {
  block_List.clear();
  thugs.clear();     // List for npcs
  theBoss.clear();
  bullets.clear();    // List for bullets
  items.clear();

  String safe=world_seed;
  for (int x=0; x<level_col; x++) {
    for (int y=0; y<level_row; y++) {
      int diget = x+(y*level_col); 
      if (diget<level_col*level_row) {
        char letter = safe.charAt(diget);

        int genX=(x*32)+16;
        int genY=(y*32)+16;


        if (letter=='1') { 
          block_List.add(new block(genX, genY, true, grass));
        } else if (letter=='2') { 
          block_List.add(new block(genX, genY, false, wall0));
        } else if (letter=='3') { 
          block_List.add(new block(genX, genY, true, wall1));
        } else if (letter=='4') { 
          block_List.add(new block(genX, genY, true, wall2));
        } else if (letter=='5') { 
          block_List.add(new block(genX, genY, true, wall3));
        } else if (letter=='6') { 
          block_List.add(new block(genX, genY, true, wall4));
        } else if (letter=='7') { 
          block_List.add(new block(genX, genY, true, dirt));
        } else if (letter=='x') {
          block_List.add(new block(genX, genY, true, pavement));
        } else if (letter=='d') {
          block_List.add(new block(genX, genY, true, pavement));
          if (debugModeText) println("Door Here: ["+x+","+y+"] ");
        } else if (letter=='n') {
          block_List.add(new noBlock(genX, genY, pavement));
        } else if (letter=='g') {
          block_List.add(new block(genX, genY, false, grass));
        } else if (letter=='G') {
          //items.add(new weapon_drop(genX, genY, new weapon(100, 1000, 100, 2, "Rambo", gunA))); 
          block_List.add(new block(genX, genY, true, dirt));
          if (debugModeText) print("Gun Spawn ["+x+","+y+"] ");
        } else if (letter=='a') {
          //items.add(new health_pack(genX, genY, 20)); 
          block_List.add(new block(genX, genY, true, pavement));
          if (debugModeText) print("Ammo Spawn ["+x+","+y+"] ");
        } else if (letter=='h') {
          //items.add(new ammo_pack(genX, genY, 20)); 
          block_List.add(new block(genX, genY, true, pavement));
          if (debugModeText) print("Health Spawn ["+x+","+y+"] ");
        } else if (letter=='T') {
          thugs.add(new Thug(genX, genY)); 
          block_List.add(new block(genX, genY, true, pavement));
          //if (debugMode) print("Thug Spawn ["+x+","+y+"] ");
        } else if (letter=='s') {
          block_List.add(new block(genX, genY, true, dirt));
          pOne.xPos=genX;
          pOne.yPos=genY;
          if (debugModeText) println("Player Spawn ["+x+","+y+"]");
        } else if (letter=='S') {
          block_List.add(new block(genX, genY, true, pavement));
          pOne.xPos=genX;
          pOne.yPos=genY;
          if (debugModeText) println("Player Spawn ["+x+","+y+"]");
        } else {
          block_List.add(new block(genX, genY, true, pavement));
        }
      }
    }
  }
  if (debugModeText) println();
  if (debugModeText) println();
}