class Room19 {
  PImage room19;
  PImage arrow;
  PImage keys;
  PImage painting1;
  PImage edenCursed;
  PImage edenCured;
  PImage hint19_1;
  boolean showOpenBook;
  PImage entry7;
  boolean showKey = true;
  boolean showPainting1;
  boolean showEdenCured;
  boolean hint;
  boolean showEdenCursed;
  String loadText;
  int timer1;
  int timer2;
  int x;
  Room19() {
    room19 = loadImage("Room 19 - Eden's_Memory.png");
    arrow =  loadImage("ARROWUP.png");
    keys = loadImage("key_01.png");
    painting1 = loadImage("Olivia2_portrait.png");
    edenCursed = loadImage("Eden_cursed.png");
    edenCured = loadImage("Eden_cured.png");
    entry7 = loadImage ("diarypage7.png");
    hint19_1 = loadImage("hint19.1.png");
  }

  void RoomLoad() {
    isRepeating = true;
    background(room19);

    // Toont een pijl als er gehovert wordt op een bepaalde plaats
    if (mouseX > 535  && mouseX < 767 && mouseY > 8 && mouseY < 280) {
      image (arrow, 631, 181, 420/5, 600/5);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && diary.diaryEntry7) {
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
      text("Eden's Memory ", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Hint 1
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint19_1, 640, 100);
      imageMode(CORNER);
    }

    // Display Lore book
    if (showOpenBook) {
      imageMode(CENTER);
      image(entry7, 640, 400);
      imageMode(CORNER);
    }

    // Controleer of de sleutel al dan niet al is opgepakt door de speler
    if (showKey) {
      image(keys, 1245, 293, 17, 50);
    }

    // Display portrait (= painting)
    if (showPainting1) {
      image (painting1, 320, 10, 600, 780);
    }

    // Display Eden
    if (showEdenCursed) {
      image(edenCursed, 369, 25, 543, 750);
    }
    if (showEdenCured) {
      image(edenCured, 369, 25, 543, 750);
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

    if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791) && showPainting1) {
      showPainting1 = false;
    }
    if (!(showOpenBook || showEdenCursed || showEdenCured || showPainting1)) {  
      // Wissel van kamer
      if (mouseX > 535  && mouseX < 767 && mouseY > 8 && mouseY < 280) {
        kamer = 3;
        hint = false;
        room3.timer1 = millis();
        timer2 = 0;
      }
      if (mouseX > 810  && mouseX < 920 && mouseY > 340 && mouseY < 600 ) {
        room20.flashing = true;
        room20.time = millis()/100;
        room20.stopFlash = room20.time;
        thunder.play();
        kamer = 20;
        hint = false;
        room20.timer1 = millis();
        timer2 = 0;
      }

      if (mouseX > 1085 && mouseX < 1225 && mouseY > 595 && mouseY < 645 && !diary.diaryEntry7 && !room1.inkText) {
        showOpenBook = true;
        timerPause = true;
      }
      if (mouseX > 1085 && mouseX < 1225 && mouseY > 595 && mouseY < 645 && !diary.diaryEntry7 && room1.inkText) {
        loadText = "inkText";
        timer2 = millis();
      }
      if (mouseX > 1235  && mouseX < 1275 && mouseY > 285 && mouseY < 355 && showKey) {
        showKey = false;
        inventory.key6V = true;
        keySound.play();
        keySound.rewind();
        loadText = "keyobtained";
        timer2 = millis();
      }
      if (mouseX > 1067  && mouseX < 1159 && mouseY > 263 && mouseY < 413) {
        switchSound.play();
        switchSound.rewind();
        showPainting1 = true;
        portrait.locked11 = true;
      }
      if (mouseX > 517 && mouseX < 616 && mouseY > 299 && mouseY < 510 && !room18.cured1) {
        switchSound.play();
        switchSound.rewind();
        showEdenCursed = true;
      }

      // Controleer of de speler het ritueel in kamer 18 heeft uitgevoerd
      if (mouseX > 517 && mouseX < 616 && mouseY > 299 && mouseY < 510 && room18.cured1) {
        showEdenCured = true;
      }

      // Controleer of de speler zes sleutels heeft
      if (mouseX >669 && mouseX < 779 && mouseY > 507 && mouseY < 603 && room2.showKey == false && room6.showKey == false
        && room7.showKey == false && showKey == false && room9.showKeys == false && room15.showKey == false && !achievements.achievement8V) {
        timer2 = millis();
        loadText = "sixkeys";
        inventory.amuletOf6V = true;
        treasure.play();
        achievements.achievement8V = true;
      } else if (mouseX >669 && mouseX < 779 && mouseY > 507 && mouseY < 603 && !achievements.achievement8V) {                                               
        timer2 = millis();
        loadText = "chest";
      }
    }
    if (mouseX > 841  && mouseX < 891 && mouseY > 677 && mouseY < 751 && showOpenBook) {
      showOpenBook = false;
      diary.diaryEntry7 = true;
      timerPause = false;
      quill.play();
      quill.rewind();
      timer2 = millis();
      loadText = "diaryEntry";
    }
    if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791) && showEdenCursed) {
      showEdenCursed = false;
    }
    if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791) && showEdenCured) {
      showEdenCured = false;
    }

    // Tussen hints wisselen of deze sluiten
    if (mouseX > 1205 && mouseX < 1255 && mouseY > 23 && mouseY < 69)
    {
      hint = true;
      x++;
      if (x==2) {
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
    case "keyobtained" :
      text("You obtain a key.", 640, 785);
      break;
    case "diaryEntry" :
      text("You obtain a diary entry.", 640, 785);
      break;
    case "chest" :
      text("You require all six keys to unlock this chest.", 640, 785);
      break;
    case "sixkeys" :
      text("You obtain the Amulet of Understanding.", 640, 785);
      break;
    case "inkText" :  
      text("You should first find a quill and some ink...", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}