class Room17 {
  PImage room17;
  PImage wine;
  PImage scroll;
  PImage arrow;
  PImage entry6;
  PImage hint17_1;
  PImage hint17_2;
  int timer1;
  int timer2;
  boolean showWine = true;
  boolean showScroll = true;
  boolean showDiary;
  boolean hint;
  String loadText;
  int x = 0;
  Room17() {
    room17 = loadImage("Room 17 - Wine_cellar.jpg");    
    arrow =  loadImage("ARROWDOWN.png");
    wine = loadImage("wine.png");
    scroll = loadImage("scroll_icon_01.png");
    entry6 = loadImage ("diarypage6.png");
    hint17_1 = loadImage("hint17.1.png");
    hint17_2 = loadImage("hint17.2.png");
  }

  void RoomLoad() {
    isRepeating = true;
    background(room17);

    // Toont volgende objecten op het scherm afhankelijk of deze al dan niet aanwezig is in de inventory
    if (showScroll) {
      image(scroll, 650, 746);
    }
    if (showWine) {
      image(wine, 406, 443);
    }

    // Toont een pijl als er gehovert wordt op een bepaalde plaats
    if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800) {
      image (arrow, 90, 670, 420/5, 600/5);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && !showWine && diary.diaryEntry6) {
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
      text("Wine cellar", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Hints 1 en 2
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint17_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 2) {
      imageMode(CENTER);
      image(hint17_2, 640, 100);
      imageMode(CORNER);
    }

    // Geef de Diary entry weer
    if (showDiary) {
      imageMode(CENTER);
      image(entry6, 640, 400);
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

    // Laad de standaard cursor
    cursor(cursor1, 5, 5);
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {

    if (!showDiary) {
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

      if (mouseX > 408 && mouseX < 460 && mouseY > 454 && mouseY < 531 && showWine) 
      {
        showWine = false;
        inventory.wineV = true;
        loadText = "wine";
        timer2 = millis();
        ink.play();
        ink.rewind();
      }
      if (mouseX > 652 && mouseX < 747 && mouseY > 762 && mouseY < 799 && showScroll && !room1.inkText)
      {
        showDiary = true;
        diary.diaryEntry6 = true;
        timerPause = true;
        showScroll = false;
      }
      if (mouseX > 652 && mouseX < 747 && mouseY > 762 && mouseY < 799 && showScroll && room1.inkText)
      {
        loadText = "inkText";
        timer2 = millis();
      }

      // Wisselen van kamer
      if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800) {
        song1room16.play();
        song1room16.rewind();
        kamer = 16;
        hint = false;
        room16.timer1 = millis();
        timer2 = 0;
      }
    }
    if (mouseX > 841  && mouseX < 891 && mouseY > 677 && mouseY < 751 && showDiary)
    {
      showDiary = false;
      diary.diaryEntry6 = true;
      timerPause = false;
      loadText = "diary";
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
    case "wine" :  
      text("A fine wine.", 640, 785);
      break;
    case "diary" :  
      text("You obtain a diary entry.", 640, 785);
      break;
    case "inkText" :  
      text("You should first find a quill and some ink...", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}