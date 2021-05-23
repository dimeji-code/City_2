class weapon {
  PImage gun=createImage(200, 200, ARGB);
  float angle;
  int cooldown=0;
  int Ammo, Max_Ammo, Clip_Ammo, Ammo_Reserve;
  int Reload_Time, Fired_Time;
  String Name;

  weapon() {
    Max_Ammo = 150;
    Ammo_Reserve = 150;
    Clip_Ammo = 15;
    Ammo = 15;
    Name = "Empty";
    Reload_Time=60;
    Fired_Time=100;
    gun=null;
  }
  weapon(int c_a, int a_r, int r_t, int f_t, String n, PImage i) {
    Clip_Ammo = c_a;
    Ammo=c_a;
    Max_Ammo=a_r;
    Ammo_Reserve = a_r;
    Reload_Time=r_t;
    Fired_Time=f_t;
    Name=n;
    gun=i;
  }
  weapon(int c_a, int a_r, int r_t, int f_t, String n) {
    Clip_Ammo = c_a;
    Ammo=c_a;
    Max_Ammo=a_r;
    Ammo_Reserve = a_r;
    Reload_Time=r_t;
    Fired_Time=f_t;
    Name=n;
    //gun=null;
  }


  void draw() {
    pushMatrix();
    if (gun!=null) {
      if (gameState=="Intro")translate(pOne.xPos, pOne.yPos);
      angle = pOne.angle; 
      rotate(angle+PI/2);
      image(gun, 10, -28);
    }/*else if (level == 0) {
     if (gameState=="Intro")translate(pOne.xPos, pOne.yPos);
     angle = pOne.angle; 
     rotate(angle+PI/2);
     image(gunA, 10, -28);
     } else if (level == 1) {
     if (gameState=="Intro")translate(pOne.xPos, pOne.yPos);
     angle = pOne.angle; 
     rotate(angle+PI/2);
     image(gunB, 10, -28);
     }*/
    popMatrix();
  }
  void reload() {
    if (Ammo<Clip_Ammo&&Ammo_Reserve>0&&cooldown<=0) { 
      int local = Clip_Ammo - Ammo;
      if (local<=Ammo_Reserve&&Ammo_Reserve>0) {
        Ammo+=local;
        Ammo_Reserve-=local;
        cooldown=Reload_Time;
      } else if (local>Ammo_Reserve) {
        Ammo=Ammo_Reserve;
        Ammo_Reserve=0;
        cooldown=Reload_Time;
      }
    }
  }
  void attack(float x, float y, float angle, int i) {
    if (this.cooldown<=0&&Ammo>0) {
      bullets.add(new bullet(x, y, angle, i));
      Ammo--;
      this.cooldown=Fired_Time;
    }
  }
  void update() {
    if (cooldown>0) cooldown-=1;
  }
}

class bullet {
  float range;//pow(pow(m1.mageY-mouseY,2)+pow(m1.mageX-mouseX,2),.5);
  float diameter, speed, angleX, angleY;
  float x, y, xInt, yInt;
  int id=0;

  bullet(float xTake, float yTake, float angle) {
    angleX = cos(angle);
    angleY = sin(angle);
    x=xTake+((10*angleY)); 
    xInt=x;
    y=yTake+((28*angleX)); 
    yInt=y;
    speed = 6; 
    diameter=6; 
    range=300;
  }
  bullet(float xTake, float yTake, float angle, int i) {
    angleX = cos(angle);
    angleY = sin(angle);
    x=xTake +(.7*10*angleX); 
    xInt=x;
    y=yTake+(.7*10*-angleY); 
    yInt=y;
    speed = 6; 
    diameter=6; 
    range=300;
    id=i;
  }

  void update() {
    if (gameState=="Intro")speed=3;
    boolean canMove=true;
    for (int t=0; t<block_List.size(); t++) {
      block p =(block) block_List.get(t);
      if (pow(p.X_Size/2, 2)>=pow(p.xPos-(x+angleX), 2)+pow(p.yPos-(y+angleY), 2)) {
        if (!p.passable) {
          canMove=false;
          break;
        }
      }
    }
    if (canMove) {
      x+=(angleX*speed);
      y+=(angleY*speed);
    }
    //if (gameState=="Active")
    if (pow(range, 2)<=(pow(xInt-x, 2)+pow(yInt-y, 2))||!canMove) {
      if (gameState!="Intro") bullets.remove(this);
    }
  }
  void draw() {
    fill(255, 255, 0);
    ellipse(x, y, diameter, diameter);
  }
}