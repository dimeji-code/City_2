int sD=32; //spaceDifferentence


class Level {
  int state=0;

  int blank;
  int row;
  int col;

  String id;
  String seed;

  void level_Intro() {
    gameState="Intro";
    world_seed="00000000021111111111000000000211111111110000000002111111111100000000021111111111222222222211111111117777777777777777777777777777777777777777222222770000000000000000027700000000000000000277000000000000000002770000000000000000027700000000000000000277000000000000000002770000000000000000027700000000000000000277000000000000";
    level_col=20; 
    level_row=16;
    enviroRender();
  }

  void level_next(String txt) {
    //gameState="Win";   
    gameState = "Active";
    doorListDestinations.clear();

    String lines[] = loadStrings(txt);
    level_col = lines[0].length();
    seed="";
    int count=0;
    for (String i : lines) {
      seed=seed+i;
      count++;
    }
    level_row=count;
    world_seed=seed;
    enviroRender();

    //int genX=(x*32)+16;         reference
    //int genY=(y*32)+16;

    if (txt=="levelSelectRoomMrkII.txt") {

      doorListDestinations.add("level0.txt");
      if (level==0) {
        block_List.add(new door((37*32)+16, (12*32)+16, 0, (5*32)+16, (13*32)+16));
        block_List.add(new door((38*32)+16, (12*32)+16, 0, (5*32)+16, (13*32)+16));
      } else {
        block_List.add(new block((37*32)+16, (12*32)+16, false, doorClose));
        block_List.add(new block((38*32)+16, (12*32)+16, false, doorClose));
      }
      doorListDestinations.add("level1.txt");
      if (level==1) {

        block_List.add(new door((57*32)+16, (12*32)+16, 1, (2*32)+16, (29*32)+16));
        block_List.add(new door((58*32)+16, (12*32)+16, 1, (2*32)+16, (29*32)+16));
      } else {
        block_List.add(new block((57*32)+16, (12*32)+16, false, doorClose));
        block_List.add(new block((58*32)+16, (12*32)+16, false, doorClose));
      }
      doorListDestinations.add("level2.txt");
      if (level==2) {

        block_List.add(new door((72*32)+16, (16*32)+16, 2, (3*32)+16, (2*32)+16));
        block_List.add(new door((73*32)+16, (16*32)+16, 2, (3*32)+16, (2*32)+16));
      } else {
        block_List.add(new block((72*32)+16, (16*32)+16, false, doorClose));
        block_List.add(new block((73*32)+16, (16*32)+16, false, doorClose));
      }
      doorListDestinations.add("level3.txt");
      if (level==3) {

        block_List.add(new door((92*32)+16, (12*32)+16, 3, (5*32)+16, (29*32)+16));
        block_List.add(new door((93*32)+16, (12*32)+16, 3, (5*32)+16, (29*32)+16));
      } else {
        block_List.add(new block((92*32)+16, (12*32)+16, false, doorClose));
        block_List.add(new block((93*32)+16, (12*32)+16, false, doorClose));
      }
      doorListDestinations.add("level4.txt");
      if (level==4) {

        block_List.add(new door((101*32)+16, (13*32)+16, 4, (27*32)+16, (16*32)+16));
        block_List.add(new door((101*32)+16, (14*32)+16, 4, (27*32)+16, (16*32)+16));
        block_List.add(new door((101*32)+16, (15*32)+16, 4, (27*32)+16, (16*32)+16));
      } else {
        block_List.add(new block((101*32)+16, (13*32)+16, false, doorClose));
        block_List.add(new block((101*32)+16, (14*32)+16, false, doorClose));
        block_List.add(new block((101*32)+16, (15*32)+16, false, doorClose));
      }
      if (level==5) {
        level_next("levelEEE.txt");
      }
    } else if (txt=="level0.txt") {

      level+=1;

      //pOne.xPos=(35*32)+16;
      //pOne.yPos=(14*32)+16;

      theBoss.add(new Thug((20*32)+16, (13*32)+16, 0, new weapon(10, 100, 80, 40, ""), 10));

      items.add(new health_pack((6*32)+16, (3*32)+16, 20));
      items.add(new health_pack((52*32)+16, (4*32)+16, 20));
      items.add(new health_pack((55*32)+16, (4*32)+16, 20));
      items.add(new ammo_pack((6*32)+16, (2*32)+16, 20));
      items.add(new ammo_pack((6*32)+16, (2*32)+16, 20));
      items.add(new weapon_drop((52*32)+16, (2*32)+16, new weapon(30, 300, 150, 20, "")));
      items.add(new ammo_pack((55*32)+16, (2*32)+16, 20));

      doorListDestinations.add("levelSelectRoomMrkII.txt");
      block_List.add(new door((4*32)+16, (15*32)+16, 0, (37*32)+16, (14*32)+16));
      block_List.add(new door((5*32)+16, (15*32)+16, 0, (37*32)+16, (14*32)+16));
      block_List.add(new door((21*32)+16, (15*32)+16, 0, (37*32)+16, (14*32)+16));
      block_List.add(new door((22*32)+16, (15*32)+16, 0, (37*32)+16, (14*32)+16));
    } else if (txt=="level1.txt") {

      level+=1;

      theBoss.add(new Thug((23*32)+16, (28*32)+16, 0, new weapon(10, 100, 80, 40, ""), 10));

      items.add(new weapon_drop((21*32)+16, (16*32)+16, new weapon(100, 1000, 100, 2, "Rambo", gunA)));

      items.add(new health_pack((2*32)+16, (2*32)+16, 20));
      items.add(new health_pack((20*32)+16, (12*32)+16, 20));
      items.add(new health_pack((20*32)+16, (20*32)+16, 20));
      items.add(new health_pack((32*32)+16, (2*32)+16, 20));

      items.add(new ammo_pack((4*32)+16, (2*32)+16, 20));
      items.add(new ammo_pack((25*32)+16, (12*32)+16, 20));
      items.add(new ammo_pack((35*32)+16, (2*32)+16, 20));

      doorListDestinations.add("levelSelectRoomMrkII.txt");
      block_List.add(new door((2*32)+16, (31*32)+16, 0, (57*32)+16, (14*32)+16));
      block_List.add(new door((3*32)+16, (31*32)+16, 0, (57*32)+16, (14*32)+16));
      block_List.add(new door((9*32)+16, (31*32)+16, 0, (57*32)+16, (14*32)+16));
      block_List.add(new door((10*32)+16, (31*32)+16, 0, (57*32)+16, (14*32)+16));
    } else if (txt=="level2.txt") {

      level+=1;

      theBoss.add(new Thug((23*32)+16, (28*32)+16, 0, new weapon(10, 100, 80, 40, ""), 10));

      items.add(new weapon_drop((23*32)+16, (4*32)+16, new weapon(100, 1000, 100, 2, "Rambo", gunA)));

      items.add(new health_pack((20*32)+16, (8*32)+16, 20));
      items.add(new health_pack((17*32)+16, (12*32)+16, 20));
      items.add(new health_pack((27*32)+16, (12*32)+16, 20));

      items.add(new ammo_pack((17*32)+16, (14*32)+16, 20));
      items.add(new ammo_pack((23*32)+16, (8*32)+16, 20));
      items.add(new ammo_pack((29*32)+16, (12*32)+16, 20));

      doorListDestinations.add("levelSelectRoomMrkII.txt");
      block_List.add(new door((3*32)+16, (0*32)+16, 0, (73*32)+16, (14*32)+16));
      block_List.add(new door((4*32)+16, (0*32)+16, 0, (73*32)+16, (14*32)+16));
      block_List.add(new door((25*32)+16, (0*32)+16, 0, (73*32)+16, (14*32)+16));
      block_List.add(new door((24*32)+16, (0*32)+16, 0, (73*32)+16, (14*32)+16));
    } else if (txt=="level4.txt") {

      level+=1;

      theBoss.add(new Thug((13*32)+16, (29*32)+16, 0, new weapon(10, 100, 80, 40, ""), 10));

      items.add(new weapon_drop((15*32)+16, (23*32)+16, new weapon(100, 1000, 100, 2, "Rambo", gunA)));

      items.add(new health_pack((15*32)+16, (24*32)+16, 20));
      items.add(new health_pack((29*32)+16, (4*32)+16, 20));

      items.add(new ammo_pack((15*32)+16, (22*32)+16, 20));
      items.add(new ammo_pack((25*32)+16, (29*32)+16, 20));

      doorListDestinations.add("levelEEE.txt");
      block_List.add(new door((0*32)+16, (14*32)+16, 0, (73*32)+16, (14*32)+16));
      block_List.add(new door((0*32)+16, (15*32)+16, 0, (73*32)+16, (14*32)+16));
      block_List.add(new door((0*32)+16, (16*32)+16, 0, (73*32)+16, (14*32)+16));
      block_List.add(new door((12*32)+16, (31*32)+16, 0, (73*32)+16, (14*32)+16));
      block_List.add(new door((13*32)+16, (31*32)+16, 0, (73*32)+16, (14*32)+16));
      block_List.add(new door((14*32)+16, (31*32)+16, 0, (73*32)+16, (14*32)+16));

    } else if (txt=="level3.txt") {

      level+=1;

      theBoss.add(new Thug((35*32)+16, (28*32)+16, 0, new weapon(10, 100, 80, 40, ""), 10));

      items.add(new health_pack((12*32)+16, (11*32)+16, 20));
      items.add(new health_pack((32*32)+16, (17*32)+16, 20));
      items.add(new health_pack((16*32)+16, (2*32)+16, 20));
      items.add(new health_pack((17*32)+16, (22*32)+16, 20));
      items.add(new health_pack((35*32)+16, (2*32)+16, 20));

      items.add(new ammo_pack((18*32)+16, (2*32)+16, 20));
      items.add(new ammo_pack((19*32)+16, (22*32)+16, 20));
      items.add(new ammo_pack((35*32)+16, (27*32)+16, 20));
      items.add(new ammo_pack((12*32)+16, (10*32)+16, 20));
      items.add(new ammo_pack((37*32)+16, (2*32)+16, 20));

      //items.add(new weapon_drop((52*32)+16, (2*32)+16, new weapon(30, 300, 150, 20, "")));

      doorListDestinations.add("levelSelectRoomMrkII.txt");
      block_List.add(new door((3*32)+16, (31*32)+16, 0, (93*32)+16, (14*32)+16));
      block_List.add(new door((4*32)+16, (31*32)+16, 0, (93*32)+16, (14*32)+16));
      block_List.add(new door((33*32)+16, (31*32)+16, 0, (93*32)+16, (14*32)+16));
      block_List.add(new door((34*32)+16, (31*32)+16, 0, (93*32)+16, (14*32)+16));
    } else if (txt=="levelEEE.txt") {

      gameState="Win";

      /*pOne.xPos=(6*32)+16;
       pOne.yPos=(25*32)+16;
       items.add(new ammo_pack((12*32)+16, (1*32)+16, 20));
       items.add(new health_pack((4*32)+16, (1*32)+16, 20));
       items.add(new health_pack((7*32)+16, (1*32)+16, 20));
       
       doorListDestinations.add("levelEEE.txt");
       block_List.add(new door((99*32)+16, (16*32)+16, 0, (9*32)+16, (10*32)+16));
       block_List.add(new door((99*32)+16, (15*32)+16, 0, (9*32)+16, (10*32)+16));*/
    } else {
      gameState="Win";
    }
  }
}