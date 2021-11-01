class Room10 {
  PImage room10;
  PImage arrow;
  PImage arrow1;
  PImage hint10_1;
  PImage hint10_2;
  String loadText;
  boolean torch;
  boolean openWall; 
  boolean hint;
  int timer1;
  int timer2;
  int x = 0;
  Room10() {
    room10 = loadImage("Room 10 - Basement_corridor.jpg");
    arrow =  loadImage("ARROWDOWN.png");
    arrow1 =  loadImage("ARROWRIGHT.png");
    hint10_1 = loadImage("hint10.1.png");
    hint10_2 = loadImage("hint10.2.png");
  }
  void RoomLoad() {
    isRepeating = true;
    background(room10); 

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 111  && mouseX < 166 && mouseY > 664 && mouseY < 800 ) {
      image (arrow, 90, 670, 420/5, 600/5);
    }
    if (mouseX > 557  && mouseX < 725 && mouseY > 241 && mouseY < 475) {
      image (arrow1, 650, 270, 420/5, 600/5);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && openWall && torch) {
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
      textFont(font1);
      text("Basement corridor", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Hints 1 en 2
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint10_2, 640, 100);
      imageMode(CORNER);
      loadText = "hint1";
    }
    if (hint && difficulty.hints && x == 2) {
      imageMode(CENTER);
      image(hint10_2, 640, 100);
      imageMode(CORNER);
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
    // Tussen hints wisselen of deze sluiten
    if (mouseX > 1205 && mouseX < 1255 && mouseY > 23 && mouseY < 69)
    {
      hint = true;
      x++;
      if (x==3) {
        x=1;
      }
    }
    if (mouseX > 970 && mouseX < 1030 && mouseY > 71 && mouseY < 126 && hint)
    {
      hint = false;
    }

    // Controleer of de torch gevonden is; indien niet, geef de torch
    if ((mouseX > 60 && mouseX < 281 && mouseY > 450 && mouseY < 532 || mouseX > 912  && mouseX < 1112 && mouseY > 467 && mouseY < 547) && !torch) {
      loadText = "torch";
      timer2 = millis();
      torch = true;
      inventory.torchV = true;
      torchSound.play();
    }

    // Wissel van kamer
    if (mouseX > 435 && mouseX < 505 && mouseY > 195 && mouseY < 505 && openWall) {
      kamer = 11;
      hint = false;
      room11.timer1 = millis();
      timer2 = 0;
    }

    if (mouseX > 557  && mouseX < 725 && mouseY > 241 && mouseY < 475) {
      kamer = 14;
      hint = false;
      room14.timer1 = millis();
      timer2 = 0;
    }
    if (mouseX > 111  && mouseX < 166 && mouseY > 664 && mouseY < 800) {
      kamer = 8;
      hint = false;
      room8.timer1 = millis();
      timer2 = 0;
    }

    // De speler heeft de dagger; open de muur
    if (mouseX > 435  && mouseX < 505 && mouseY > 195 && mouseY < 505 && inventory.daggerV && !openWall) {
      loadText = "openWall";
      timer2 = millis();
      openWall = true;
      openWall1.play();
    }

    // De speler heeft de dagger niet; open de muur niet
    if (mouseX > 435  && mouseX < 505 && mouseY > 195 && mouseY < 505 && !openWall && !inventory.daggerV) {
      loadText = "closedwall";
      timer2 = millis();
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "torch" :  
      text("You obtain a torch.", 640, 785);
      break;
    case "closedwall" :  
      text("This wall appears to have a crack. A small dagger could perhaps force this wall open.", 640, 785);
      break;    
    case "openWall" :  
      text("You force a crack in the wall and uncover a hidden pathway.", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}