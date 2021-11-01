class Room4 {
  PImage room4;
  PImage ropeLadder;
  PImage demon01; 
  PImage room42;
  PImage Eden;
  PImage hint4_1;
  PImage hint4_2;
  PImage hint4_3;
  boolean flash;
  boolean ladder;
  boolean flash2;
  boolean demon;
  boolean demon2;
  boolean lightbringer;
  boolean lights;
  boolean showLadder = true;
  boolean hint;
  int timer1;
  int timer2;
  int timer3;
  int time;
  int stopFlash;
  int x = 0;
  String loadText;

  Room4() {
    room4 = loadImage("Room 04.1 - Balcony.png");
    demon01 = loadImage("Demon01.jpg");
    Eden = loadImage("Eden_flash_lightbringer.jpg");
    ropeLadder = loadImage("rope_ladder.png");
    hint4_1 = loadImage("hint4.1.png");
    hint4_2 = loadImage("hint4.2.png");
    hint4_3 = loadImage("hint4.3.png");
  }
  void RoomLoad() {
    isRepeating = true;
    room4.resize(1280, 800);
    background(room4);

    // Toont het object op het scherm afhankelijk of deze al dan niet aanwezig is in de inventory
    if (showLadder)
    {
      image(ropeLadder, 402, 320);
    }

    // Laat een screamer image flashen
    if (flash2) {
      if  (demon2) {
        image(Eden, 0, 0);
      }
      if (!demon2) {
        background(0);
      }

      if (millis()/100 > time) {
        demon2 = !demon2;
        time= time + 4;
        if (stopFlash + 20 == time) {
          flash2 = false;
        }
      }
    }
    if (flash) {
      if  (demon) {
        image (demon01, 0, 0);
      }
      if (!demon) {
        background(0);
      }

      if (millis()/100 > time) {
        demon = !demon;
        time= time + 1;
        if (stopFlash + 10 == time) {
          flash = false;
        }
      }
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 < 3000) {
      showText();
    }
    if (millis() - timer3 < 5000) {
      showText();
    }
    if (millis() - timer2 > 3001 && millis() - timer2 < 8001 && (loadText== "lightbringer" || loadText== "change" || loadText == "trinity") )
    {
      loadText = "change";
      showText();
    }
    if (millis() - timer2 > 8002 && millis() - timer2 < 11001 && (loadText== "lightbringer" || loadText== "change" || loadText == "trinity") )
    {
      loadText = "trinity";
      showText();
    }

    // Display de naam van de kamer 
    if (millis () - timer1 < 5000) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("Balcony", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && ladder && lights && lightbringer) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("Cleared", 1040, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
      hint = false;
    }

    // Hints 1, 2 en 3
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint4_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 2) {
      imageMode(CENTER);
      image(hint4_2, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 3) {
      imageMode(CENTER);   
      image(hint4_3, 640, 100);
      imageMode(CORNER);
    }

    // Toon het hintsymbool rechts boven op het scherm
    if (difficulty.hints) {
      image(hintIcon, 1201, 19);
    }

    // Laad de timer
    timer();

    // Verander de cursor van de muis naargelang waar je je met je muis bevindt
    if (mouseX > 718  && mouseX <854 && mouseY > 379 && mouseY < 569) {
      cursor(cursor2, 5, 5);
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
      if (x==4) {
        x=1;
      }
    }
    if (mouseX > 970 && mouseX < 1030 && mouseY > 71 && mouseY < 126 && hint)
    {
      hint = false;
    }

    // Controleer of er een glove in de inventory aanwezig is wanneer er op een van de twee lampen wordt geklikt
    if ((mouseX > 949 && mouseX < 1009 && mouseY > 434 && mouseY < 436 || mouseX > 1007 && mouseX < 1046 && mouseY > 412 && mouseY < 456) && room9.glove && !lightbringer) {
      song3room4.play();
      room4 = loadImage("Room 04.2 - Balcony.jpg");
      timer2 = millis();
      loadText = "lightbringer";
      flash2 = true;
      time = millis()/100;
      stopFlash = time;
      achievements.achievement2V= true;
      inventory.lightbringerV = true;
      lightbringer = true;
    }

    if ((mouseX > 949 && mouseX < 1009 && mouseY > 434 && mouseY < 436 || mouseX > 1007 && mouseX < 1046 && mouseY > 412 && mouseY < 456) && !room9.glove) {
      timer2 = millis();
      loadText = "sword";
    }
    if (mouseX > 977 && mouseX < 1033 && mouseY > 224 && mouseY < 335 || mouseX > 902 && mouseX < 942 && mouseY > 340 && mouseY < 405) {
      timer3 = millis();
      song1room4.play();
      song1room4.rewind();
      loadText = "light";
      lights = true;
    }
    if (mouseX > 173 && mouseX < 416 && mouseY > 149 && mouseY < 660) {
      flash = true;
      time = millis()/100;
      stopFlash = time;
      timer2 = millis();
      song2room4.play();
      song2room4.rewind();
      loadText = "outside";
    }

    // Wissel van kamer
    if (mouseX > 718  && mouseX < 854 && mouseY > 379 && mouseY < 569) {
      kamer = 3;
      hint = false;
      room3.timer1 = millis();
      timer3 = 0;
      timer2 = 0;
    }
    
    if (mouseX > 419 && mouseX < 473 && mouseY > 355 && mouseY < 654 && showLadder) {
      showLadder = false;
      inventory.ropeLadderV = true;
      ladder = true;
      loadText = "ladder";
      timer2 = millis();
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "outside" :  
      text("You have unfinished business and therefore cannot yet leave.", 640, 785);
      break;
    case "light" :  
      text("Your eyes burn as you gaze into the light. You sense a curse lifting in another room.", 640, 785);
      break;
    case "sword" :  
      text("You are not yet strong enough to pull this sword from the wall.", 640, 785);
      break;
    case "lightbringer" :  
      text("“Lightbringer…”", 640, 785);
      break;
    case "change" :  
      text("The sword shapeshifts as you touch it.", 640, 785);
      break;
    case "trinity" :
      text("“Trinity…”", 640, 785);
      break;
    case "ladder" : 
      text("You obtain a rope ladder", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}