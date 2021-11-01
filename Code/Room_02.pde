class Room2 {
  PImage room2;
  PImage arrow2_1;
  PImage arrow2_2;
  PImage arrow2_3;
  PImage closedBook;
  PImage inventoryIcon;
  PImage keys;
  PImage shield;
  PImage showVial;
  PImage painting1;
  PImage painting2;
  PImage painting3;
  PImage painting4;
  PImage painting5;
  PImage hint2_1;
  PImage hint2_2;
  PImage hint2_3;
  PImage hint2_4;
  boolean showKey = true;
  boolean showClosedBook = true;
  boolean showOpenBook;
  boolean vial;
  boolean once = true;
  boolean noShield;
  boolean showPainting1;
  boolean showPainting2;
  boolean showPainting3;
  boolean showPainting4;
  boolean showPainting5;
  boolean hint;
  String loadText;
  int timer1;
  int timer2;
  int x = 0;
  int y = 1;

  Room2() {
    room2 = loadImage("Room 02 - Eden's_hideout_1.png");
    arrow2_1 = loadImage ("ARROWDOWN.png");
    arrow2_2 = loadImage ("ARROWRIGHT.png");
    inventoryIcon = loadImage("inventory_icon.png");
    closedBook = loadImage("lore_01.png");
    keys = loadImage ("key_01.png");
    shield = loadImage("Room 02 - Eden's_hideout_2.png");
    timer1 = millis();
    showVial = loadImage ("vialcut.png");
    painting1 = loadImage("John_portrait.png");
    painting2 = loadImage("Olivia4_portrait.png");
    painting3  = loadImage("Lucius_portrait.png");
    painting4 = loadImage("Crimson_portrait.png");    
    painting5 = loadImage("Olivia3_portrait.png");
    hint2_1 = loadImage("hint2.1.png");
    hint2_2 = loadImage("hint2.2.png");
    hint2_3 = loadImage("hint2.3.png");
    hint2_4 = loadImage("hint2.4.png");
  }
  void RoomLoad() {
    isRepeating = true;
    background(room2);

    // Toont het object op het scherm - afhankelijk of deze al dan niet aanwezig is in de inventory
    if (noShield) {
      room2 = shield;
    }

    // Controleer of de sleutel al dan niet al is opgepakt door de speler
    if (showKey) {
      image(keys, 187, 358, 17, 50);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && !showKey && vial && noShield && portrait.locked3) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("Cleared", 1040, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
      hint = false;
    }

    // Display de naam van de kamer
    if (millis () - timer1 < 6000) {
      fill(255);
      textAlign(CENTER);
      text("Eden’s hideout", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Toon een gesloten Lore book
    if (showClosedBook) {
      image(closedBook, 986, 418, 60, 38);
    }

    // Controleer of het object al dan niet aanwezig is in de inventory
    if (!vial) {
      image(showVial, 460, 443, 17, 50);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 > 3001 && millis() - timer2 < 6001 && (loadText== "elixirtext" || loadText== "elixirtext2") )
    {
      loadText = "elixirtext2";
      showText();
    }

    // Hints 1, 2, 3 en 4
    if (hint && x == 1) {
      imageMode(CENTER);
      image(hint2_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && x == 2) {
      imageMode(CENTER);
      image(hint2_2, 640, 100);
      imageMode(CORNER);
    }
    if (hint && x == 3) {
      imageMode(CENTER);
      image(hint2_3, 640, 100);
      imageMode(CORNER);
    }
    if (hint && x == 4) {
      imageMode(CENTER);
      image(hint2_4, 640, 100);
      imageMode(CORNER);
    }

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 111  && mouseX < 166 && mouseY > 664 && mouseY < 800) {
      image(arrow2_1, 90, 650, 420/5, 600/5);
    }
    if (mouseX > 1140  && mouseX <1186 && mouseY > 213 && mouseY < 681) {
      image(arrow2_2, 1077, 398, 420/4, 600/7);
    }

    // Display portraits (= paintings)
    if (showPainting1) {
      image (painting1, 320, 10, 600, 780);
    }
    if (showPainting2) {
      image (painting2, 320, 10, 600, 780);
    }
    if (showPainting3) {
      image (painting3, 320, 10, 600, 780);
    }
    if (showPainting4) {
      image (painting4, 320, 10, 600, 780);
    }
    if (showPainting5) {
      image(painting5, 320, 10, 600, 780);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if ((millis () - timer1 < 10000) && once) {
      fill(255);
      textAlign(CENTER);
      text("Keys are scattered throughout rooms.", 640, 400);
      text("A voice in your head tells you you should look for one in this room and open a chest.", 640, 450);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Display Lore books
    if (showOpenBook && y == 1) {
      image(lorebook.lore1_1, 140, 34);
    }
    if (showOpenBook && y == 2) {
      image(lorebook.lore1_2, 140, 34);
    }
    if (showOpenBook && y == 3) {
      image(lorebook.lore1_3i, 140, 34);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 < 5000) {
      showText();
    }

    // Toon het hintsymbool rechts boven op het scherm
    if (difficulty.hints) {
      image(hintIcon, 1201, 19);
    }

    // Laad de timer 
    timer();
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    // Controleer of de portraits (= paintings) openstaan en zet de tijd op pauze
    if (!(showPainting1|| showPainting2 || showPainting3 || showPainting4|| showPainting5 || showOpenBook)) {

      // Wissel van kamer
      if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800 ) {
        kamer = 3;
        room3.timer1 = millis();
        hint = false;
        timer2 = 0;
        once = false;
      }
      if (mouseX > 1150  && mouseX <1200 && mouseY > 220 && mouseY < 620 ) {
        kamer = 1;
        room1.timer1 = millis();
        hint = false;
        timer2 = 0;
        once = false;
      }

      if (mouseX < 200 && mouseX > 180 && mouseY < 400 && mouseY > 370 && showKey) {
        loadText = "key1text";
        inventory.key1V = true;
        timer2 = millis();
        keySound.play();
        keySound.rewind();
      }
      if (mouseX > 995 && mouseX < 1050 && mouseY > 427 && mouseY < 466 && showClosedBook) {
        showOpenBook = true;
        timerPause = true;
        lorebook.lore01 = true;
      }
      if (mouseX > 621 && mouseX < 875 && mouseY > 365 && mouseY < 477) {
        loadText = "bedtext";
        timer2 = millis();
        scarySound6.play();
        scarySound6.rewind();
      }
      if (mouseX > 93 && mouseX < 172 && mouseY > 234 && mouseY < 312 & !noShield) {
        loadText = "shield";
        timer2 = millis();
        inventory.shield04V = true;
        shieldSlam.play();
      }
      if (mouseX > 460 && mouseX < 478 && mouseY > 450 && mouseY < 480 && !vial) {
        vialSound.play();
        inventory.elixirV = true;
        loadText= "elixirtext";
        timer2 = millis();
      }
    }
    if (mouseX > 1047 && mouseX < 1088 && mouseY > 706 && mouseY < 745 && showOpenBook && y == 3) {
      loadText = "loretext";
      timer2 = millis();
      showOpenBook = false;
      timerPause = false;
      song5.play();
      song5.rewind();
    }
    if (!showOpenBook) {
      if (mouseX > 1030 && mouseX < 1060 && mouseY > 156 && mouseY < 181) {
        switchSound.play();
        switchSound.rewind();
        showPainting1 = true;
        portrait.locked1 = true;
      } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
        showPainting1 = false;
      }
      if (mouseX > 1032 && mouseX < 1062 && mouseY > 202 && mouseY < 236) {
        switchSound.play();
        switchSound.rewind();
        showPainting2 = true;
        portrait.locked2 = true;
      } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
        showPainting2 = false;
      }
      if (mouseX > 1033 && mouseX < 1064 && mouseY > 255 && mouseY < 290) {
        switchSound.play();
        switchSound.rewind();
        showPainting3 = true;
        portrait.locked3 = true;
      } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
        showPainting3 = false;
      }
      if (mouseX > 1032 && mouseX < 1062 && mouseY > 306 && mouseY < 351) {
        switchSound.play();
        switchSound.rewind();
        showPainting4 = true;
        portrait.locked4 = true;
      } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
        showPainting4 = false;
      }
      if (mouseX > 1032 && mouseX < 1062 && mouseY > 366 && mouseY < 418) {
        switchSound.play();
        switchSound.rewind();
        showPainting5 = true;
        portrait.locked5 = true;
      } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
        showPainting5 = false;
      }
    }

    // Simuleer een pageflip met geluid in het Lore book
    if (mouseX > 981 && mouseX < 1084 && mouseY > 725 && mouseY < 750 && showOpenBook)
    {
      y++;
      if (y >= 1 && y <= 3) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y==4) {
        y=3;
      }
    }
    if (mouseX > 218 && mouseX < 321 && mouseY > 725 && mouseY < 751 && showOpenBook)
    {
      y--;
      if (y >= 1 && y <= 3) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y==0) {
        y=1;
      }
    }

    // Tussen hints wisselen of deze sluiten
    if (mouseX > 1205 && mouseX < 1255 && mouseY > 23 && mouseY < 69)
    {
      hint = true;
      x++;
      if (x==4) {
        x=1;
      }
    }
    if (mouseX > 970 && mouseX < 1030 && mouseY > 71 && mouseY < 126 && hint)
    {
      hint = false;
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "key1text" :
      showKey = false;
      text("You obtain a key.", 640, 785);
      break;
    case "bedtext" :
      text("Vlad would not like this.", 640, 785);
      break;
    case "shield" :
      noShield = true;
      text("“I might find use for this later.”", 640, 785);
      break;
    case "loretext" :
      showClosedBook = false;
      text("You tear these pages from the book and add them to the Book of Eye.", 640, 785);
      break;
    case "elixirtext" :
      vial = true;
      text("“What kind of sorcery is this?”", 640, 785);
      break;
    case "elixirtext2":
      text("You obtain the Elixir of Rejuvenation.", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}