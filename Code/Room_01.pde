class Room1 {
  PImage room1;
  PImage arrow1;
  PImage inventoryIcon;
  PImage notetoself;
  PImage hint1_1;
  PImage hint1_2;
  PImage sparkle;
  boolean textPaper;
  boolean inkText = true;
  boolean chestText = true;
  boolean unlocked;
  boolean hint;
  boolean readPaper;
  boolean showSparkle = true;
  String loadText;
  int timer1;
  int timer2;
  int x = 0;

  Room1() {
    room1 = loadImage("Room 01 - Observatory.jpg");
    arrow1 = loadImage ("ARROWDOWN.png");
    inventoryIcon = loadImage("inventory_icon.png");
    notetoself = loadImage("notetomyself.png");
    hint1_1 = loadImage("hint1.1.png");
    hint1_2 = loadImage("hint1.2.png");
    sparkle = loadImage("sparkle.png");
  }

  void RoomLoad() {
    isRepeating = true;
    background(room1);

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 111  && mouseX <167 && mouseY > 664 && mouseY < 780) {
      image(arrow1, 90, 650, 420/5, 600/5);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && readPaper && !inkText && inventory.bookOfEyeV) {
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
      text("Observatory", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Open de note to my self
    if (textPaper) {
      imageMode(CENTER);
      image(notetoself, 640, 400  );
      imageMode(CORNER);
    }

    // Toon de sparkle afbeelding op de plaats waar de note to myself
    if (showSparkle) {
      image(sparkle, 1140, 125);
    }
    // Hints 1 en 2
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint1_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 2) {
      imageMode(CENTER);
      image(hint1_2, 640, 100);
      imageMode(CORNER);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis () - timer2 < 5000) {
      showText();
    }

    // Toon het hintsymbool rechts boven op het scherm
    if (difficulty.hints) {
      image(hintIcon, 1201, 19);
    }

    // Laad de timer 
    timer();

    // Laad de standaardcursor
    cursor(cursor1, 5, 5);
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    // Wissel van kamer
    if (!textPaper) {
      if (mouseX > 111 && mouseX < 166 && mouseY > 664 && mouseY < 771) {
        kamer = 2;
        hint = false;
        room2.timer1 = millis();
        timer2 = 0;
        scarySound2.play();
      }

      if (mouseX > 1200 && mouseX < 1237 && mouseY > 187 && mouseY < 217) {
        showSparkle = false;
        textPaper = true;
        scroll.play();
        scroll.rewind();
        timerPause = true;
      }
      if (mouseX > 983 && mouseX < 1056 && mouseY > 463 && mouseY < 620 && inkText) {
        inkText = false;
        inventory.quillInkV = true;
        ink.play();
        ink.rewind();
        loadText = "inkText";
        timer2 = millis();
      }
      if (mouseX > 797 && mouseX < 840 && mouseY > 392 && mouseY < 500) {
        loadText ="hourglasstext";
        timer2 = millis();
      }
      if (mouseX > 785 && mouseX < 831 && mouseY > 77 && mouseY < 127) {
        scarySound6.play();
        scarySound6.rewind();
        loadText="orbstext";
        timer2 = millis();
      }
      if (mouseX > 316 && mouseX < 494 && mouseY > 45 && mouseY < 282) {
        loadText="moontext";
        timer2 = millis();
      }
      if (mouseX > 589 && mouseX < 671 && mouseY > 88 && mouseY < 188) {
        scarySound6.play();
        scarySound6.rewind();
        loadText="orbstext";
        timer2 = millis();
      }
      
      // Open al dan niet de kist
      if (mouseX > 148 && mouseX < 284 && mouseY > 206 && mouseY < 317) {
        if (chestText && unlocked == false) {
          lockedChest.play();
          lockedChest.rewind();
          if (room2.showKey) {
            loadText ="chestText";
          } else {
            if (unlocked == false)
            {
              loadText = "chestText2";
              inventory.bookOfEyeV = true;
              openChest.play();
            }
          }
          timer2 = millis();
        } else {
          loadText = "chestText3";
          timer2 = millis();
        }
      }
    }
    
    if (mouseX > 911 && mouseX < 964 && mouseY > 621 && mouseY < 675 && textPaper) {
      textPaper = false;
      readPaper = true;
      timerPause = false;
    }

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
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "chestText" :
      text("“If only I had a key…”", 640, 785);
      break;
    case "orbstext" :
      text("One of mother’s odd objects.", 640, 785);
      break;
    case "hourglasstext" :
      text("“Whenever I read, time seemingly freezes.”", 640, 785);      
      break;
    case "inkText" :
      text("You collect some ink and a quill. You might need this…", 640, 785);
      break;
    case "chestText2" :
      text("You unlock the chest using the key you have found.", 640, 785);
      unlocked = true;
      break;
    case "chestText3":
      text("You have already looted this chest.", 640, 785);
      break;
    case "moontext":
      text("Full moon.", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}