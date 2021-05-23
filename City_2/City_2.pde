//Global Values
//Enity Lists

Player pOne;                             // The player
ArrayList  thugs   = new ArrayList();     // List for npcs
ArrayList  theBoss = new ArrayList();
ArrayList  bullets = new ArrayList();    // List for bullets
ArrayList  items   = new ArrayList();      // List for static objects (Helathpacks and Ammo packs extera)  
//Map List
ArrayList block_List = new ArrayList();

//Level Details
int level = 0;          //The current level which the player is in
int level_col;          //
int level_row;          //
String world_seed;      //

ArrayList doorListDestinations = new ArrayList();

int player_xPos;
int player_yPos;

boolean debugMode     = false;
boolean debugModeText = false;

String gameState;
Level generate;
Intro welcome;
weapon gun1;


void setup() {
  frameRate(60);
  size(640, 512, P3D);
  imageMode(CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);
  gameState="Intro";
  thugs.clear();
  theBoss.clear();
  bullets.clear();
  items.clear(); 
  block_List.clear();
  
  generate= new Level();
  welcome =new Intro();
  gun1 = new weapon();
  generate_Sprites();
  pOne = new Player();  
  generate.level_next("level3.txt");
  level=0;
  generate.level_Intro();
}

void draw() {
  input();
  update();
  render();
  gun1.draw();
}