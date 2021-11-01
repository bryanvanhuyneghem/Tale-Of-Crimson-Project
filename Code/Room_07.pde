class Room7 {
  PImage room7;
  PImage arrow;
  PImage arrow2;
  PImage key_01;
  PImage entry1;
  PImage warnote2;
  PImage hint7_1;
  int timer1;
  int timer2;
  int x;
  boolean showOpenBook;
  boolean once;
  boolean showKey = true;
  String loadText;
  boolean showDiary;
  boolean warNote;
  boolean hint;
  int y = 1;

  Room7() {
    room7 = loadImage("Room 07 - Study.jpg");
    arrow =  loadImage("ARROWUP.png");
    arrow2 = loadImage("ARROWRIGHT.png");
    entry1 = loadImage ("diarypage1.png");
    warnote2 = loadImage("warnote2.png");
    hint7_1 = loadImage("hint7.1.png");
    key_01 = loadImage("key_01.png");
  }

  void RoomLoad() {
    isRepeating = true;
    background(room7);

    // Controleer of de sleutel al dan niet al is opgepakt door de speler
    if (showKey) {
      image(key_01, 768, 588, 25, 70);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && diary.diaryEntry1 ) {
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
      text("Study", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Hint 1
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint7_1, 640, 100);
      imageMode(CORNER);
    }

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 600  && mouseX < 716 && mouseY > 55 && mouseY < 280) {
      image (arrow, 620, 100, 420/5, 600/5);
    }
    if (mouseX > 828  && mouseX < 990 && mouseY > 225 && mouseY < 413) {
      image(arrow2, 855, 270, 420/6, 600/6);
    }

    // Geef de Diary entry weer
    if (showDiary) {
      imageMode(CENTER);
      image(entry1, 640, 400);
      imageMode(CORNER);
    }

    // Geef de war note weer
    if (warNote) {
      imageMode(CENTER);
      image(warnote2, 640, 400);
      imageMode(CORNER);
      image(cross, 790, 670, 50, 50);
    }

    // Display Lore books
    if (showOpenBook) {
      image(lorebook.lore3_1i, 140, 34);
    }
    if (showOpenBook && y == 2) {
      image(lorebook.lore3_2, 140, 34);
    }
    if (showOpenBook && y == 3) {
      image(lorebook.lore3_3, 140, 34);
    }
    if (showOpenBook && y == 4) {
      image(lorebook.lore3_4i, 140, 34);
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
    if (!(warNote || showDiary ||showOpenBook)) {
      if (mouseX > 665  && mouseX < 703 && mouseY > 453 && mouseY < 500 && !inventory.warNote2V) {
        warNote = true;
        inventory.warNote2V = true;
        timerPause = true;
      }
      if (mouseX > 9 && mouseX < 174 && mouseY > 501 && mouseY < 607 && !once) {
        showOpenBook = true;
        timerPause = true;
        lorebook.lore03 = true;
      }
      if (mouseX > 1057  && mouseX < 1187 && mouseY > 197 && mouseY < 367 && !diary.diaryEntry1 && !room1.inkText) {
        showDiary = true;
        timerPause = true;
      }
      if (mouseX > 1057  && mouseX < 1187 && mouseY > 197 && mouseY < 367 && !diary.diaryEntry1 && room1.inkText) {
        timer2 = millis();
        loadText = "inkText";
      }
      if ((mouseX > 339  && mouseX < 466 && mouseY > 480 && mouseY < 579) || (mouseX > 365  && mouseX <550 && mouseY > 610 && mouseY < 617)) {
        timer2 = millis();
        loadText = "time";
      }
      if (mouseX > 775 && mouseX < 790 && mouseY > 620 && mouseY < 660 & showKey ) {
        showKey = false;
        inventory.key3V = true;
        keySound.play();
        keySound.rewind();
        timer2 = millis();
        loadText = "key";
      }
      
      // Wissel van kamer
      if (mouseX > 600  && mouseX < 716 && mouseY > 55 && mouseY < 280) {
        kamer = 8;
        hint = false;
        room8.timer1 = millis();
        timer2 = 0;
      }
      if (mouseX > 837  && mouseX < 1000 && mouseY > 225 && mouseY < 415) {
        room3.timer1 = millis();
        kamer = 3;
        hint = false;
        timer2 = 0;
      }
    }
    
    if (mouseX > 793  && mouseX < 842 && mouseY > 673 && mouseY < 719 && warNote) {
      warNote = false;
      timerPause = false;
      timer2 = millis();
      loadText = "warNotes";
    }
    if (mouseX > 841  && mouseX < 891 && mouseY > 677 && mouseY < 751 && showDiary) {
      showDiary = false;
      diary.diaryEntry1 = true;
      timerPause = false;
      loadText = "diaryEntry";
      timer2 = millis();
      quill.play();
      quill.rewind();
    }
    if (mouseX > 1047 && mouseX < 1088 && mouseY > 706 && mouseY < 745 && showOpenBook && y == 4) {
      loadText = "loretext";
      timer2 = millis();
      showOpenBook = false;
      once = true;
      timerPause = false;
      song5.play();
      song5.rewind();
    }

    // Simuleer een pageflip met geluid in het Lore book
    if (mouseX > 981 && mouseX < 1084 && mouseY > 725 && mouseY < 750 && showOpenBook)
    {
      y++;
      if (y >= 1 && y <= 4) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y==5) {
        y=4;
      }
    }
    if (mouseX > 218 && mouseX < 321 && mouseY > 725 && mouseY < 751 && showOpenBook)
    {
      y--;
      if (y >= 1 && y <= 4) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y==0) {
        y=1;
      }
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
    case "key" :  
      text("You obtain a key.", 640, 785);
      break;
    case "time" :  
      text("”I don’t have time for this.”", 640, 785);
      break;
    case "diaryEntry" :  
      text("You obtain a diary entry.", 640, 785);
      break;
    case "warNotes" :  
      text("What’s this?", 640, 785);
      break;
    case "inkText" :  
      text("You should first find a quill and some ink...", 640, 785);
      break;
    case "loretext" :
      text("You tear these pages from the book and add them to the Book of Eye.", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}