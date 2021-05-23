//Image Generation
int iSp=74; //Image seperator number for tile sets
int iSp2=17;
PImage roguelikeCity_magenta, spritesheet_characters, spritesheet_tiles;

PImage hero = createImage(43, 41, ARGB);
PImage thug = createImage(43, 41, ARGB);

PImage wall0 = createImage(32, 32, ARGB);
PImage wall1 = createImage(32, 32, ARGB);
PImage wall2 = createImage(32, 32, ARGB);
PImage wall3 = createImage(32, 32, ARGB);
PImage wall4 = createImage(32, 32, ARGB);
PImage wall5 = createImage(32, 32, ARGB);
PImage car0 = createImage(64, 64, ARGB);
PImage car1 = createImage(64, 64, ARGB);
PImage car2 = createImage(64, 64, ARGB);
PImage car3 = createImage(64, 64, ARGB);
PImage pavement = createImage(32, 32, ARGB);
PImage doorClose = createImage(32, 32, ARGB);
PImage doorOpen = createImage(32, 32, ARGB);
PImage grass = createImage(32, 32, ARGB);
PImage dirt = createImage(32, 32, ARGB);
PImage red = createImage(32, 32, ARGB);
PImage create = createImage(32, 32, ARGB);
PImage gunA = createImage(27, 82, ARGB);
PImage gunB = createImage(30, 79, ARGB);

//Buildings
void generate_Sprites() {
  roguelikeCity_magenta = loadImage("roguelikeCity_magenta.png");
  spritesheet_characters = loadImage("spritesheet_characters.png");
  spritesheet_tiles = loadImage("spritesheet_tiles.png");
  hero = loadImage("manBlue_gun.png");
  thug = loadImage("soldier1_gun.png");

  gunA = loadImage("gun1.png");
  gunB = loadImage("gun2.png"); 

  wall0.copy(roguelikeCity_magenta, 2*iSp2, 5*iSp2, 15, 15, 0, 0, 32, 32);  //Red wall Pure
  wall1.copy(roguelikeCity_magenta, 0*iSp2, 12*iSp2, 15, 15, 0, 0, 32, 32); //Red wall Corner BL
  wall2.copy(roguelikeCity_magenta, 1*iSp2, 12*iSp2, 15, 15, 0, 0, 32, 32); //Red wall Corner BR
  wall3.copy(roguelikeCity_magenta, 2*iSp2, 8*iSp2, 15, 15, 0, 0, 32, 32);  //Red wall Bottom 
  wall4.copy(roguelikeCity_magenta, 0*iSp2, 11*iSp2, 15, 15, 0, 0, 32, 32); //Red wall Left Side
  wall5.copy(roguelikeCity_magenta, 1*iSp2, 11*iSp2, 15, 15, 0, 0, 32, 32); //Red wall Right Side

  car0.copy(roguelikeCity_magenta, 33*iSp2, 18*iSp2, 15, 15, 0, 0, 64, 64);  //Red wall Pure
  car1.copy(roguelikeCity_magenta, 34*iSp2, 18*iSp2, 15, 15, 0, 0, 64, 64);  //Red wall Corner BL
  car2.copy(roguelikeCity_magenta, 33*iSp2, 19*iSp2, 15, 15, 0, 0, 64, 64);  //Red wall Corner BR
  car3.copy(roguelikeCity_magenta, 34*iSp2, 19*iSp2, 15, 15, 0, 0, 64, 64);  //Red wall Bottom 

  pavement.copy(roguelikeCity_magenta, 11*iSp2, 19*iSp2, 15, 15, 0, 0, 32, 32);  // Black pavement
  doorOpen.copy(spritesheet_tiles, 16*iSp, 0*iSp, 15, 15, 0, 0, 32, 32);         // Random
  doorClose.copy(spritesheet_tiles, 15*iSp, 0*iSp, 15, 15, 0, 0, 32, 32);        // Random
  create.copy(spritesheet_tiles, 14*iSp, 3*iSp, 15, 15, 0, 0, 32, 32);           // Random
  //  doorClose.copy(roguelikeCity_magenta, 6*iSp2, 6*iSp2, 15, 15, 0, 0, 32, 32); // Random
  grass.copy(roguelikeCity_magenta, 0*iSp2, 24*iSp2, 15, 15, 0, 0, 32, 32);      // Grass
  dirt.copy(spritesheet_tiles, 4*iSp, 0*iSp, 64, 64, 0, 0, 32, 32);              // Dirt
}