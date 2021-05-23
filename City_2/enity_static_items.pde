class item {

  int xPos; 
  int yPos;
  int range;

  item(int x, int y) {
    xPos=x;
    yPos=y;
    range=50;
  }
  void render() {
  }
  void update() {
  }
}

class health_pack extends item {

  int in_box;

  health_pack(int x, int y) {
    super(x, y);
    in_box=1;
  }

  health_pack(int x, int y, int i) {
    super(x, y);
    in_box=i;
  }

  void pickup() {
    if (pow(range, 2)>=(pow(pOne.xPos-xPos, 2)+pow(pOne.yPos-yPos, 2))) {
      if (pOne.health<20) {
        pOne.health+=in_box;
        items.remove(this);
      }
    }
  }

  void update() {
    pickup();
  }

  void render() {
    fill(255);
    rect(xPos, yPos, 24, 24);
    noStroke();
    fill(0, 255, 0);
    rect(xPos, yPos, 6, 18);
    rect(xPos, yPos, 18, 6);
    stroke(0);
  }
}

class ammo_pack extends item {

  int in_box;

  String type_in_box;

  ammo_pack(int x, int y) {
    super(x, y);
    in_box=15;
    type_in_box="";
  }
  ammo_pack(int x, int y, int i) {
    super(x, y);
    in_box=i;
    type_in_box="";
  }
  ammo_pack(int x, int y, int i, String t) {
    super(x, y);
    in_box=i;
    type_in_box=t;
  }

  void pickup() {
    //super.pickup();
    if (pow(range, 2)>=(pow(pOne.xPos-this.xPos, 2)+pow(pOne.yPos-this.yPos, 2))) {
      if (pOne.test.Ammo_Reserve<pOne.test.Max_Ammo) {
        if (pOne.test.Ammo_Reserve+in_box>pOne.test.Max_Ammo) {
          pOne.test.Ammo_Reserve=pOne.test.Max_Ammo;
        } else {
          pOne.test.Ammo_Reserve+=in_box;
        }
        items.remove(this);
      }
    }
  }

  void update() {
    pickup();
  }

  void render() {
    fill(0);
    rect(xPos, yPos, 24, 24);
    noStroke();
    fill(255, 0, 0);
    textSize(8);
    text("A", xPos, yPos);
    stroke(0);
  }
}

class weapon_drop extends item {

  weapon in_box;

  weapon_drop(int x, int y) {
    super(x, y);
    in_box = new weapon();
  }

  weapon_drop(int x, int y, weapon w) {
    super(x, y);
    in_box = w;
  }

  void render() {
    image(create, xPos, yPos);
    //fill(random(155, 255), random(155, 255), random(155, 255));
    //rect(xPos, yPos, sD*.75, sD*.75);
  }

  void update() {
    pickup();
  }

  void pickup() {

    if (pow(range, 2)>=(pow(pOne.xPos-this.xPos, 2)+pow(pOne.yPos-this.yPos, 2))) {
      if (pOne.test.Name!=in_box.Name) {
        pOne.test=in_box;
        items.remove(this);
      }
    }
  }
}