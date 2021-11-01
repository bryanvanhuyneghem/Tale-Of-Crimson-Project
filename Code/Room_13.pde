class Room13 {
  PImage room13;
  PImage arrow;
  PImage room132;
  PImage entry4;
  PImage hint13_1;
  boolean background2;
  boolean showDiary;
  boolean hint;
  String loadText;
  int timer1;
  int timer2;
  int timer3;
  int x = 0;


  Room13() {
    room13 = loadImage("Room 13.1 - Fountain_of_Truth.jpg");
    room132 = loadImage ("Room 13.2 - Fountain_of_Truth.png");
    arrow =  loadImage("ARROWDOWN.png");
    entry4 = loadImage ("diarypage4.png");
    hint13_1 = loadImage("hint13.1.png");
  }

  void RoomLoad() {
    isRepeating = true;
    background(room13);

    // Verander background van kamer 13 als je het zwaard op de juiste plaats hebt ingebracht op de juiste plaats
    if (background2) {
      room13 = room132;
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && diary.diaryEntry4) {
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
      text("Fountain of Truth", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Hint 1
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint13_1, 640, 100);
      imageMode(CORNER);
    }

    // Geef de Diary entry weer
    if (showDiary) {
      imageMode(CENTER);
      image(entry4, 640, 400);
      imageMode(CORNER);
    }

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 111 && mouseX < 166 && mouseY > 664 && mouseY < 800) {
      image (arrow, 90, 670, 420/5, 600/5);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 < 5000) {
      showText();
    }
    if (millis() - timer3 < 5000) {
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
    if (!showDiary) {
      if (mouseX > 970 && mouseX < 1030 && mouseY > 71 && mouseY < 126 && hint)
      {
        hint = false;
      }
      if (mouseX > 1205 && mouseX < 1255 && mouseY > 23 && mouseY < 69)
      {
        hint = true;
        x++;
        if (x==2) {
          x=1;
        }
      }

      // Wissel van kamer
      if (mouseX > 111 && mouseX < 166 && mouseY > 664 && mouseY < 800) {
        kamer = 12;
        hint = false;
        room12.timer1 = millis();
        timer3 = 0;
        timer2 = 0;
      }

      // Stop Lightbringer in de Fountain om een Diary page te krijgen
      if (mouseX > 550 && mouseX < 730 && mouseY > 305 && mouseY < 448 && room4.lightbringer && !background2 && !room1.inkText) {
        background2 = true;
        showDiary = true;
        timerPause = true;
        loadText = "lightbringer";
        timer3 = millis();
      }
      if (mouseX > 550 && mouseX < 730 && mouseY > 305 && mouseY < 448 && room4.lightbringer && !background2 && room1.inkText) {
        loadText = "inkText";
        timer3 = millis();
      }
      if (mouseX > 550 && mouseX < 730 && mouseY > 305 && mouseY < 448 && !room4.lightbringer ) {
        loadText = "nolightbringer";
        timer3 = millis();
      }
      if (mouseX > 111 && mouseX < 166 && mouseY > 664 && mouseY < 800) {
        image (arrow, 90, 670, 420/5, 600/5);
      }
    }
    if (mouseX > 841  && mouseX < 891 && mouseY > 677 && mouseY < 751 && showDiary) {
      showDiary = false;
      diary.diaryEntry4 = true;
      timerPause = false;
      loadText = "diaryEntry";
      timer2 = millis();
      quill.play();
      quill.rewind();
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "lightbringer" :
      text("You insert Trinity into the Fountain of truth and hear some parts move.", 640, 785);
      break;
    case "diaryEntry" :
      text("You obtain a diary entry.", 640, 785);
      break;
    case "nolightbringer" :
      text ("You need Trinity to activate the Fountain of Truth.", 640, 785);
      break;
    case "inkText" :  
      text("You should first find a quill and some ink...", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}