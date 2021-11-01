class Room11 {
  PImage room11;
  PImage arrow;
  PImage hint11_1;
  PImage hint11_2;
  PImage [] codeImage = new PImage[6];
  boolean numpadCode;
  boolean num1;
  boolean num2;
  boolean num3;
  boolean num4;
  boolean num5;
  boolean numpad;
  boolean hint;
  String loadText;
  int timer2;
  int timer1;
  int x;
  int y = 0;

  Room11() {
    room11 = loadImage("Room 11.1 - Dungeon_corridor.png");
    arrow =  loadImage("ARROWDOWN.png");
    for (int i = 1; i<6; i++)
    {
      codeImage [i] = loadImage("Numpad0"+i+".png");
    }
    hint11_1 = loadImage("hint11.1.png");
    hint11_2 = loadImage("hint11.2.png");
  }

  void RoomLoad() {
    isRepeating = true;
    background(room11);

    // Controleer of dit object al dan niet aanwezig is in de inventory (en dus niet meer in kamer 3)
    if (room3.amulet) {
      room11 = loadImage("Room 11.2 - Dungeon_corridor.jpg");
    }

    // Toon al dan niet de numpad
    if (numpad) {
      image(codeImage[x], 404, 50);
    }

    // Verander de achtergrond van de kamer als de code van het numpad juist is
    if (numpadCode) {
      room11 = loadImage("Room 11.3 - Dungeon_corridor.jpg");
    }

    // Toont een pijl als er gehovert wordt op een bepaalde plaats
    if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800) {
      image (arrow, 90, 670, 420/5, 600/5);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && numpadCode) {
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
      text("Dungeon corridor", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Hints 1 en 2
    if (hint && difficulty.hints && y == 1) {
      imageMode(CENTER);
      image(hint11_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && y == 2) {
      imageMode(CENTER);
      image(hint11_2, 640, 100);
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

    // Verander de cursor van de muis naargelang waar je je met je muis bevindt
    if (!room3.amulet) {
      if (mouseX > 463  && mouseX <816 && mouseY > 102 && mouseY < 516 ) {
        cursor(cursor3, 5, 5);
      } else {
        cursor(cursor1, 5, 5);
      }
    }
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    // Tussen hints wisselen of deze sluiten
    if (mouseX > 1205 && mouseX < 1255 && mouseY > 23 && mouseY < 69)
    {
      hint = true;
      y++;
      if (y==3) {
        y=1;
      }
    }
    if (mouseX > 970 && mouseX < 1030 && mouseY > 71 && mouseY < 126 && hint)
    {
      hint = false;
    }

    // Numpad is gesloten
    if (numpad) {
      checkCode();
      if (!(mouseX > 412  && mouseX <877 && mouseY > 61 && mouseY < 700)) {
        // Sluit numpad
        numpad = false;
        x = 0;
      }
    }

    // Als numpad niet gesloten is controleer of de speler de Amulet heeft om de demon te laten verschijnen
    if (!numpad) {
      // Amulet (niet) en code (niet)
      if (mouseX > 463  && mouseX <816 && mouseY > 102 && mouseY < 516 && room3.amulet && !numpadCode) {
        loadText= "demon2";
        timer2 = millis();
        x= 1;
        numpad = true;
      }
      // Amulet (wel) en code (niet)
      if (mouseX > 463  && mouseX <816 && mouseY > 102 && mouseY < 516 && !room3.amulet && !numpadCode) {
        loadText= "demon1";
        timer2 = millis();
      }
      // Code wel
      if (mouseX > 463  && mouseX <816 && mouseY > 102 && mouseY < 516 && numpadCode) {
        scarySound3.play();
        kamer = 12;
        hint = false;
        room12.flashing= true;
        room12.time = millis()/100;
        room12.stopFlash = room12.time;
        room12.timer1 = millis();
        timer2 = 0;
      }

      // Wissel van kamer
      if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800) {
        kamer = 10;
        hint = false;
        room10.timer1 = millis();
        timer2 = 0;
      }
    }
  }

  // Controleer de clicks van de gebruiker en check de juiste posities (== nummers op numpad)
  void checkCode() {
    switch(x) {
    case 1:
      if (mouseX > 449  && mouseX <556 && mouseY > 191 && mouseY < 300) {
        num1=true;
        x=2;
        buttonPress.play();
        buttonPress.rewind();
      }
      if (mouseX > 428  && mouseX <853 && mouseY > 191 && mouseY < 574 && !(mouseX > 449  && mouseX <556 && mouseY > 191 && mouseY < 300)) {
        num1= false;
        x=2;
        buttonPress.play();
        buttonPress.rewind();
      }
      break;
    case 2:
      if (mouseX > 447  && mouseX <557 && mouseY > 327 && mouseY < 437) {
        num2 = true;
        x=3;
        buttonPress.play();
        buttonPress.rewind();
      }
      if (mouseX > 428  && mouseX <853 && mouseY > 191 && mouseY < 574  && !(mouseX > 447  && mouseX <557 && mouseY > 327 && mouseY < 437)) {
        num2= false;
        x=3;
        buttonPress.play();
        buttonPress.rewind();
      }
      break;
    case 3:
      if (mouseX > 584  && mouseX <694 && mouseY > 191 && mouseY < 300) {
        num3 = true;
        x=4;
        buttonPress.play();
        buttonPress.rewind();
      }
      if (mouseX > 428  && mouseX <853 && mouseY > 191 && mouseY < 574 && !(mouseX > 584  && mouseX <694 && mouseY > 191 && mouseY < 300)) {
        num3= false;
        x=4;
        buttonPress.play();
        buttonPress.rewind();
      }
      break;
    case 4:
      if (mouseX > 447  && mouseX <557 && mouseY > 327 && mouseY < 437) {
        num4 = true;
        x=5;
        buttonPress.play();
        buttonPress.rewind();
      }
      if (mouseX > 428  && mouseX <853 && mouseY > 191 && mouseY < 574  && !(mouseX > 447  && mouseX <557 && mouseY > 327 && mouseY < 437)) {
        num4= false;
        x=5;
        buttonPress.play();
        buttonPress.rewind();
      }
      break;
    case 5:
      if (mouseX > 605  && mouseX <673 && mouseY > 590 && mouseY < 658) {
        numpad = false;
        if (!(num1 && num2 && num3 && num4)) {
          loadText="demon4";
          timer2 = millis();
        }
        if (num1 && num2 && num3 && num4) {
          numpadCode = true;
          solvedSound.play();
          solvedSound.rewind();
          loadText = "demon3";
          timer2 = millis();
        }
        x = 0;
      }
      break;
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "demon1" :  
      text("Dark forces at work are preventing you from continuing along this path.", 640, 785);
      break;
    case "demon2" :  
      text("What is the passcode?", 640, 785);
      break;    
    case "demon3" :  
      text("You may proceed.", 640, 785);
      break;
    case "demon4" :  
      text("You are unworthy of this task.", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}