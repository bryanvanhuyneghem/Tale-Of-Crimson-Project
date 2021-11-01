class Room14 {
  PImage room14;
  PImage arrow;
  PImage arrow1;
  PImage closedBook;
  PImage curseProtect;
  PImage repairedShield;
  PImage entry5;
  PImage hint14_1;
  PImage hint14_2;
  PImage hint14_3;
  boolean showDiary;
  boolean fixedShield;
  boolean anvil;
  boolean showClosedBook = true;
  boolean cursor;
  boolean hint;
  String loadText;
  int timer1;
  int timer2;
  int x;
  Room14() {
    room14 = loadImage("Room 14 - Workshop.jpg");
    closedBook = loadImage("book_icon_04.png");
    repairedShield = loadImage("shield_12.png");
    arrow =  loadImage("ARROWDOWN.png");
    arrow1 =  loadImage("ARROWLEFT.png");
    entry5 = loadImage ("diarypage5.png");
    hint14_1 = loadImage("hint14.1.png");
    hint14_2 = loadImage("hint14.2.png");
    hint14_3 = loadImage("hint14.3.png");
  }
  void RoomLoad() {
    isRepeating = true;
    background(room14);

    // Toon een gesloten Lore book
    if (showClosedBook) {
      image(closedBook, 986, 281, 60, 38);
    }

    // Toont een pijl als er gehovert wordt op een bepaalde plaats
    if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800) {
      image (arrow, 90, 670, 420/5, 600/5);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && anvil && diary.diaryEntry5 && fixedShield) {
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
      text("Workshop", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Hints 1, 2 en 3
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint14_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 2) {
      imageMode(CENTER);
      image(hint14_2, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 3) {
      imageMode(CENTER);
      image(hint14_3, 640, 100);
      imageMode(CORNER);
    }

    // Geef de Diary entry weer
    if (showDiary) {
      imageMode(CENTER);
      image(entry5, 640, 400);
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

    // Verander de cursor van de muis naargelang waar je je met je muis bevindt (controleer de voorwaarden gedurende het proces van de minigame)
    if  (mouseX > 296  && mouseX < 423 && mouseY > 7 && mouseY < 229 && !fixedShield && !showDiary ) {
      cursor(cursor3, 5, 5);
    } else {
      cursor (cursor1, 5, 5);
      cursor = true;
    } 
    if  (mouseX > 296  && mouseX < 423 && mouseY > 7 && mouseY < 229 && fixedShield) {
      cursor(cursor1, 5, 5);
      image (arrow1, 360, 140, 420/5, 600/5);
    }
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {

    if (!showDiary) {
      // Wissel van kamer
      if (mouseX > 324  && mouseX < 440 && mouseY > 125 && mouseY < 260 && fixedShield) {
        room15.timer1 = millis();
        timer2 = 0;
        kamer = 15;
        hint = false;
        demon.play();
        demon.rewind();
      }
      if (mouseX > 111  && mouseX < 166 && mouseY > 664 && mouseY < 800) {
        room10.timer1 = millis();
        kamer = 10;
        hint = false;
        timer2 = 0;
      }

      if (mouseX > 985  && mouseX < 1034 && mouseY > 286 && mouseY < 331 && !diary.diaryEntry5 && !room1.inkText) {
        showDiary = true;
        timerPause = true;
        showClosedBook = false;
      }
      if (mouseX > 985  && mouseX < 1034 && mouseY > 286 && mouseY < 331 && !diary.diaryEntry5 && room1.inkText) {
        loadText = "inkText";
        timer2 = millis();
      }
      if (mouseX > 296  && mouseX < 423 && mouseY > 7 && mouseY < 229 && (room2.noShield || !anvil) && cursor && !fixedShield) {
        loadText = "brokenshield";
        timer2 = millis();
      }
      if (mouseX > 600  && mouseX < 693 && mouseY > 155 && mouseY < 195 && !room2.noShield ) {
        loadText = "noShield2";
        timer2 = millis();
      }
      if (mouseX > 395  && mouseX < 511 && mouseY > 376 && mouseY < 476 && !room2.noShield) {
        loadText = "noShield";
        timer2 = millis();
      }
      if (mouseX > 600  && mouseX < 693 && mouseY > 155 && mouseY < 195 && room2.noShield && anvil) {
        loadText = "repairedShield";
        timer2 = millis();
        inventory.shield12V = false;
        fixedShield = true;
        furnaceSound.play();
      }
      if (mouseX > 395  && mouseX < 511 && mouseY > 376 && mouseY < 476 && room2.noShield && !fixedShield && !anvil) {
        anvilSound.play();
        loadText = "room2shield";
        inventory.shield12V = true;
        inventory.shield04V = false;
        timer2 = millis();
        anvil = true;
      } else if (mouseX > 395  && mouseX < 511 && mouseY > 376 && mouseY < 476 && room2.noShield && !fixedShield && anvil) {
        loadText = "sacrifice";
        timer2 = millis();
      }
    }
    if (mouseX > 841  && mouseX < 891 && mouseY > 677 && mouseY < 751 && showDiary) {
      showDiary = false;
      diary.diaryEntry5 = true;
      timerPause = false;
      quill.play();
      quill.rewind();
      loadText = "diaryEntry";
      timer2 = millis();
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
    case "diaryEntry" :
      text("You obtain a diary entry.", 640, 785);
      break;
    case "brokenshield" :
      text("“I require a metal sacrifice, human. Toss it in my furnace.“", 640, 785);
      break;
    case "noShield" :
      text("“If I had some sort of shield or sword, I could perhaps smith something.”", 640, 785);
      break;
    case "room2shield" :
      text("You fuse your blood with the shield.", 640, 785);
      break;
    case "noShield2" :
      text("I hunger for metal, human...", 640, 785);
      break;
    case "repairedShield" :
      text("“I am satisfied. You may pass.”", 640, 785);
      break;
    case "sacrifice":
      text("“I should sacrifice the shield to the demon...”", 640, 785);
      break;
    case "inkText" :  
      text("You should first find a quill and some ink...", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}