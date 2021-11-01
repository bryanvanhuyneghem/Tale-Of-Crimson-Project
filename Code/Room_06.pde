class Room6 {
  PImage room6;
  int timer1;
  int timer2;
  int x;
  int y = 1;
  PImage closedBook;
  PImage warNote01;
  PImage key02;
  PImage genieLamp;
  PImage warnote1;
  PImage arrow;
  PImage hint6_1;
  boolean showOpenWarNote;
  boolean showWarNote = true;
  boolean lamp;
  boolean showKey = true;
  boolean showClosedBook = true;
  boolean showOpenBook;
  boolean hint;
  String loadText;

  Room6() {
    room6 = loadImage("Room 06 - Chambre_of_Wisdom.jpg");
    closedBook = loadImage ("book_icon_01.png");
    key02 = loadImage("key_01.png");
    genieLamp = loadImage("genie_lamp.png");
    warNote01 = loadImage("letter_icon.png");
    warnote1 = loadImage("warnote1.png");
    arrow = loadImage("ARROWLEFT.png");
    hint6_1 = loadImage("hint6.1.png");
  }
  void RoomLoad() {
    isRepeating = true;
    background(room6);

    // Geef de war note weer
    if (showWarNote) {
      image(warNote01, 95, 715);
    }

    // Toon een gesloten Lore book
    if (showClosedBook) {
      image(closedBook, 860, 725, 60, 38);
    }

    // Controleer of de sleutel al dan niet al is opgepakt door de speler
    if (showKey) {
      image(key02, 1100, 343, 17, 50);
    }

    // Toont het object op het scherm - afhankelijk of deze al dan niet aanwezig is in de inventory
    if (!lamp) {
      image(genieLamp, 338, 560, 44, 30);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && lamp) {
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
      text("Chambre of Wisdom", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Hint 1
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint6_1, 640, 100);
      imageMode(CORNER);
    }

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 152  && mouseX < 235 && mouseY > 328 && mouseY < 643) {
      image(arrow, 170, 440, 420/5, 600/5);
    }

    // Display Lore books
    if (showOpenBook && y == 1) {
      image(lorebook.lore2_1i, 140, 34);
    }
    if (showOpenBook && y == 2) {
      image(lorebook.lore2_2, 140, 34);
    }
    if (showOpenBook && y == 3) {
      image(lorebook.lore2_3i, 140, 34);
    }

    // Geef de war note weer
    if (showOpenWarNote) {
      imageMode(CENTER);
      image(warnote1, 640, 400);
      imageMode(CORNER);
      image(cross, 790, 670, 50, 50);
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

    // Wissel van kamer
    if (!(showOpenBook || showOpenWarNote)) {
      if (mouseX > 163  && mouseX <250 && mouseY > 320 && mouseY < 650 ) {
        kamer = 5;
        hint = false;
        room5.timer1 = millis();
        timer2 = 0;
      }

      if (mouseX > 101 && mouseX < 192 && mouseY > 744 && mouseY < 780 && showWarNote) {
        showWarNote = false;
        showOpenWarNote = true;
        inventory.warNote1V = true;
        timerPause = true;
      }
      if (mouseX > 345 && mouseX < 385 && mouseY > 566 && mouseY < 593 && !lamp) {
        lamp = true;
        lampSound.play();
        inventory.genieLampV = true;
        loadText = "lamp";
        timer2 = millis();
      }
      if (mouseX > 1107 && mouseX < 1117 && mouseY > 344 && mouseY < 395 && showKey) {
        showKey = false;
        inventory.key2V = true;
        keySound.play();
        keySound.rewind();
        loadText = "key";
        timer2 = millis();
      }
      if (mouseX > 873 && mouseX < 912 && mouseY > 732 && mouseY < 763 && showClosedBook) {
        showOpenBook = true;
        showClosedBook = false;
        timerPause = true;
        lorebook.lore02 = true;
      }
      if (mouseX > 949 && mouseX < 1015 && mouseY > 413 && mouseY < 587) {
        loadText = "blackboard";
        timer2 = millis();
        scarySound6.play();
        scarySound6.rewind();
      }
      if (mouseX > 103 && mouseX < 149 && mouseY > 538 && mouseY < 619) {
        loadText = "globe";
        timer2 = millis();
      }
    } 
    if (mouseX > 1047 && mouseX < 1088 && mouseY > 706 && mouseY < 745 && showOpenBook && y == 3) {
      showOpenBook = false;
      timerPause = false;
      loadText = "lorebook";
      timer2 = millis();
      song5.play();
      song5.rewind();
    }
    if (mouseX > 793  && mouseX < 842 && mouseY > 673 && mouseY < 719 && showOpenWarNote) {
      showOpenWarNote = false;
      timerPause = false;
      loadText = "warNote";
      timer2 = millis();
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
    case "blackboard" :  
      text("“Eden must have been studying these creatures.”", 640, 785);
      break;
    case "globe":
      text("The world as we know it.", 640, 785);
      break;
    case "warNote":
      text("“What’s this?”", 640, 785);
      break;
    case "lamp":
      text("“Some sort of ritualistic object. This could be useful.”", 640, 785);
      break;
    case"key":
      text("You obtain a key.", 640, 785);
      break;
    case "lorebook":
      text("You tear these pages from the book and add them to the Book of Eye.", 640, 785);
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}