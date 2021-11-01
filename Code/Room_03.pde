class Room3 {
  PImage room3;
  PImage arrow;
  PImage arrow2;
  PImage showAmulet;
  PImage hint3_1;
  PImage hint3_2;
  PImage hint3_3;
  PImage hint3_4;
  boolean amulet;
  boolean showArrow;
  boolean candlesOn;
  boolean frames;
  boolean openHole;
  boolean bg;
  boolean hint;
  int timer1;  
  int timer2;  
  PImage[] images = new PImage[5];
  int numFrames = 4;
  int frame = 1;
  int x=0;
  String loadText;  

  Room3() {
    frameRate(37);
    room3 = loadImage("Room 03.1 - Hallway.png");
    arrow = loadImage("ARROWDOWN.png");
    arrow2 = loadImage ("ARROWRIGHT.png");
    for ( int i = 1; i < 4; i++ )
    {
      images[i] = loadImage( "Room 03." + i + " - Hallway.png");
    }
    timer1 = millis();
    showAmulet = loadImage("amulet_re.png");
    hint3_1 = loadImage("hint3.1.png");
    hint3_2 = loadImage("hint3.2.png");
    hint3_3 = loadImage("hint3.3.png");
    hint3_4 = loadImage("hint3.4.png");
  }
  void RoomLoad() {
    isRepeating = true;
    background(room3);

    // Effect bij het aansteken van de kaarsen
    if (frames) {
      image(images[frame], 0, 0);
      frame++;
      if (frame == numFrames) {
        frames = false;
        frame = 1;
        room3 = loadImage("Room 03.4 - Hallway.png");
      }
    }

    // Toont het object op het scherm afhankelijk of deze al dan niet aanwezig is in de inventory
    if (!amulet) {
      image(showAmulet, 44, 475);
    }

    // Toont een pijl als er gehovert wordt op een bepaalde plaats
    if (mouseX > 543  && mouseX < 612 && mouseY > 138 && mouseY < 409) {
      image(arrow2, 510, 255, 420/5, 600/8);
    }
    if (mouseX > 1113  && mouseX < 1271 && mouseY > 19 && mouseY < 686) {
      image(arrow2, 1108, 250, 420/4, 600/7);
    }
    if (mouseX > 312  && mouseX < 545 && mouseY > 421 && mouseY < 475 && showArrow) {
      image (arrow, 390, 332, 420/5, 600/5);
    }

    // Display de naam van de kamer    
    if (millis () - timer1 < 6000) {
      fill(255);
      textFont(font1);
      textAlign(CENTER);
      text("Hallway", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 < 5000) {
      showText();
    }

    // Toon het hintsymbool rechts boven op het scherm
    if (difficulty.hints) {
      image(hintIcon, 1201, 19);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && room4.ladder && amulet && candlesOn) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("Cleared", 1040, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
      hint = false;
    }

    // Hints 1, 2, 3 en 4
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint3_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 2) {
      imageMode(CENTER);
      image(hint3_2, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 3) {
      imageMode(CENTER);
      image(hint3_3, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 4) {
      imageMode(CENTER);
      image(hint3_4, 640, 100);
      imageMode(CORNER);
    }

    // Laad de timer
    timer();

    // Verander de cursor van de muis naargelang waar je je met je muis bevindt
    if (mouseX > 813 && mouseX < 875 && mouseY > 287 && mouseY < 343) {
      cursor(cursor2, 5, 5);
    } else if (mouseX > 346 && mouseX < 488 && mouseY > 184 && mouseY < 327 && !room4.lights) {
      cursor(cursor3, 5, 5);
    } else if (mouseX > 600 && mouseX < 690 && mouseY > 108 && mouseY < 169 && room10.torch && !candlesOn) {
      cursor(cursor5, 5, 5);
    } else
    {
      cursor(cursor1, 5, 5);
    }
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    // Tussen hints wisselen of deze sluiten
    if (mouseX > 1205 && mouseX < 1255 && mouseY > 23 && mouseY < 69)
    {
      hint = true;
      x++;
      if (x==5) {
        x=1;
      }
    }
    if (mouseX > 970 && mouseX < 1030 && mouseY > 71 && mouseY < 126 && hint)
    {
      hint = false;
    }

    // Geef overeenkomstige tekst weer als kaarsen nog niet aan zijn
    if (mouseX > 628 && mouseX < 667 && mouseY > 133 && mouseY < 169 && !candlesOn) {
      loadText = "candleoff";
      timer2 = millis();
    }

    // Steek de kaarsen aan
    if (mouseX > 628 && mouseX < 667 && mouseY > 133 && mouseY < 169 && room10.torch && !candlesOn) {
      loadText = "candleon";
      inventory.torchV = false;
      candlesOn = true;
      timer2 = millis();
      frames = true;
      showArrow = true;
      song7.play();
    }

    // controleer om het amuletobject al is opgenomen door de gebruiker
    if (mouseX > 52 && mouseX < 62 && mouseY > 482 && mouseY < 510 & !amulet) {
      loadText = "amulettext";
      amulet = true;
      inventory.amuletV = true;
      timer2 = millis();
      amuletSound.play();
    }

    // Controleer of de speler in het licht in kamer 4 gekeken heeft
    if (mouseX > 346 && mouseX < 488 && mouseY > 184 && mouseY < 327 && !room4.lights) {
      loadText = "protectedtext";
      timer2 = millis();
    }

    // Wissel van kamer
    if (mouseX > 1096  && mouseX < 1270 && mouseY > 216 && mouseY < 343) {
      kamer = 2;
      hint = false;
      room2.timer1 = millis();
      timer2 = 0;
    }
    if (mouseX > 763  && mouseX <990 && mouseY > 190 && mouseY < 560) {
      scarySound7.play();
      kamer = 4;
      hint = false;
      room4.timer1 = millis();
      timer2 = 0;
    }
    if (mouseX > 561  && mouseX <600 && mouseY > 156 && mouseY < 410) {
      kamer = 5;
      hint = false;
      room5.timer1 = millis();
      timer2 = 0;
    }
    if (mouseX > 354  && mouseX <470 && mouseY > 190 && mouseY < 325 && room4.lights) {
      kamer = 7;
      hint = false;
      room7.timer1 = millis();
      timer2 = 0;
    }
    if (mouseX > 312  && mouseX < 545 && mouseY > 421 && mouseY < 475 && openHole) {
      scarySound4.play();
      kamer = 19;
      hint = false;
      room19.timer1 = millis();
      timer2 = 0;
    }

    // Controleer of de kaarsen aan zijn en de speler de ladder heeft; zo ja, open toegang tot kamer 19
    if (mouseX > 312  && mouseX < 545 && mouseY > 421 && mouseY < 475 && candlesOn && room4.ladder && !openHole) {
      loadText = "openHole";
      timer2 = millis();
      openHole = true;
      inventory.ropeLadderV = false;
    }

    if (mouseX > 312  && mouseX < 545 && mouseY > 421 && mouseY < 475 && candlesOn && !room4.ladder ) {
      loadText = "noladder";
      timer2 = millis();
      openHole = false;
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "protectedtext":
      text("You ought to first let the Light shine upon thine eyes.", 640, 785);
      break;
    case "candleoff":
      text("“They radiate something strange… If only I had something to light these with.”", 640, 785);
      break;
    case "candleon":
      text("You use the torch to light the candles. The floor cracks open.", 635, 785);
      break;
    case "amulettext":
      text("You obtain the Amulet of Piercing Light.", 640, 785);
      break;
    case "noladder":
      text("You should find something that will allow you to climb down…", 640, 785);
      break;
    case "openHole":
      text("You unroll the rope ladder down the hole in the floor.", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}