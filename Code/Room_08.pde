class Room8 {
  PImage room8;
  PImage arrow;
  PImage arrow1;
  PImage portal1;
  PImage portal2;
  PImage[] images = new PImage[37];
  PImage entry2;
  PImage warnote3;
  PImage hint8_1;
  PImage hint8_2;
  int numFrames = 37;
  int frame = 1;
  int y = 1;
  boolean beeld;
  boolean showDiary;
  boolean warNote;
  boolean portal;
  boolean portalFlash;
  boolean flash;
  boolean showOpenBook;
  boolean hint;
  String loadText;
  int timer1;
  int timer2;
  int time;
  int stopFlash;
  int x = 0;

  Room8() {
    frameRate(37);
    room8 = loadImage("Room 08.1.png");
    portal1 = loadImage("portal.png");
    portal2 = loadImage("portal_flash.png");
    for ( int i = 1; i < 37; i++ )
    {
      images[i] = loadImage("Room 08." + i + ".png");
    }
    arrow = loadImage("ARROWRIGHT.png");
    arrow1 = loadImage ("ARROWLEFT.png");
    entry2 = loadImage("diarypage2.png");
    warnote3 = loadImage ("warnote3.png");
    hint8_1 = loadImage("hint8.1.png");
    hint8_2 = loadImage("hint8.2.png");
  }
  void RoomLoad() {
    isRepeating = true;
    background(room8);

    // Laat het beeld verschuiven
    if (beeld) {
      image(images[frame], 0, 0);
      frame++;
      if (frame == numFrames) {
        beeld = false;
        room8 = loadImage("Room 08.38.png");
        frame = 1;
        portal = true;
      }
    }

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 80  && mouseX <150 && mouseY > 660 && mouseY < 785) {
      image(arrow1, 65, 680, 420/4, 600/7);
    }
    if (mouseX > 1132  && mouseX <1210 && mouseY > 211 && mouseY < 650) {
      image(arrow, 1120, 300, 420/4, 600/7);
    }

    // Geeft portal afbeelding weer
    if (portal) {
      image(portal1, 755, 190);
    }

    // Display de naam van de kamer 
    if (millis () - timer1 < 6000) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("War room", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && portal && diary.diaryEntry2) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("Cleared", 1040, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
      hint = false;
    }

    // Geef de War note weer
    if (warNote) {
      imageMode(CENTER);
      image(warnote3, 640, 400);
      imageMode(CORNER);
      image(cross, 790, 670, 50, 50);
    }

    // Geef de Diary entry weer
    if (showDiary) {
      imageMode(CENTER);
      image(entry2, 640, 400);
      imageMode(CORNER);
    }

    // Hints 1 en 2
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint8_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 2) {
      imageMode(CENTER);
      image(hint8_2, 640, 100);
      imageMode(CORNER);
    }

    // Display Lore books
    if (showOpenBook && y == 1) {
      image(lorebook.lore4_1i, 140, 34);
    }
    if (showOpenBook && y == 2) {
      image(lorebook.lore4_2, 140, 34);
    }
    if (showOpenBook && y == 3) {
      image(lorebook.lore4_3, 140, 34);
    }
    if (showOpenBook && y == 4) {
      image(lorebook.lore4_4, 140, 34);
    }
    if (showOpenBook && y == 5) {
      image(lorebook.lore4_5i, 140, 34);
    }

    // zorgt voor een flashing screen bij als er naar kamer 9 wordt gegaan
    if (portalFlash) {
      if  (flash) {
        image (portal2, 0, 0);
      }
      if (!flash) {
        background(0);
      }
      if (millis()/100 > time) {
        flash = !flash;
        time= time + 1;
        if (stopFlash + 10 == time) {
          portalFlash = false;
          kamer = 9;
          hint = false;
          song3.pause();
          scaryChoir.play();
          room9.timer1 = millis();
        }
      }
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
    if (!(showDiary || showOpenBook || warNote)) {
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

      if (mouseX > 750  && mouseX < 900 && mouseY > 250 && mouseY < 400 && portal) {
        portalFlash = true;
        time = millis()/100;
        stopFlash = time;
        portalSound.play();
        portalSound.rewind();
      }
      if (mouseX > 453  && mouseX < 597 && mouseY > 431 && mouseY < 454 && !inventory.warNote3V ) {
        warNote = true;
        inventory.warNote3V = true;
        timerPause= true;
      }
      if (mouseX > 362  && mouseX <452 && mouseY > 607 && mouseY < 639 && !diary.diaryEntry2 && !room1.inkText) {
        showDiary = true;
        timerPause= true;
      }
      if (mouseX > 362  && mouseX <452 && mouseY > 607 && mouseY < 639 && !diary.diaryEntry2 && room1.inkText) {
        timer2 = millis();
        loadText = "inkText";
      }

      // Wissel van kamer
      if (mouseX > 80  && mouseX <150 && mouseY > 660 && mouseY < 785) {
        kamer = 7;
        hint = false;
        room7.timer1 = millis();
        timer2 = 0;
      }
      if (mouseX > 1132  && mouseX <1210 && mouseY > 211 && mouseY < 650 ) {
        scarySound1.play();
        kamer = 10;
        hint = false;
        room10.timer1 = millis();
        timer2 = 0;
      }

      if (mouseX > 780  && mouseX <910 && mouseY > 290 && mouseY < 372 ) {
        beeld = true;  
        maria.play();
      }
      if (mouseX > 218  && mouseX <316 && mouseY > 89 && mouseY < 395 ) {
        timer2 = millis();
        loadText = "joke1";
      }
      if (mouseX > 822  && mouseX <869 && mouseY > 452 && mouseY < 498 ) {
        timer2 = millis();
        loadText = "joke2";
      }
      if (mouseX > 990  && mouseX <1089 && mouseY > 590 && mouseY < 636 && !lorebook.lore04) {
        showOpenBook = true;
        timerPause = true;
        lorebook.lore04 = true;
      }
    }
    if (mouseX > 1047 && mouseX < 1088 && mouseY > 706 && mouseY < 745 && showOpenBook && y == 5) {
      showOpenBook = false;
      timerPause = false;
      loadText = "tornPage";
      timer2 = millis();
      song5.play();
      song5.rewind();
    }
    if (mouseX > 793  && mouseX < 842 && mouseY > 673 && mouseY < 719 && warNote) {
      warNote = false;
      timerPause = false;
      timer2 = millis();
      loadText = "warNotes";
    }
    if (mouseX > 841  && mouseX < 891 && mouseY > 677 && mouseY < 751 && showDiary) {
      showDiary = false;
      diary.diaryEntry2 = true;
      timerPause= false;
      timer2 = millis();
      loadText = "diaryEntry";
      quill.play();
      quill.rewind();
    }

    // Simuleer een pageflip met geluid in het Lore book
    if (mouseX > 981 && mouseX < 1084 && mouseY > 725 && mouseY < 750 && showOpenBook)
    {
      y++;
      if (y >= 1 && y <= 5) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y==6) {
        y=5;
      }
    }
    if (mouseX > 218 && mouseX < 321 && mouseY > 725 && mouseY < 751 && showOpenBook)
    {
      y--;
      if (y >= 1 && y <= 5) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y==0) {
        y=1;
      }
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "joke1" :  
      text("“Typical youthful protest posters.”", 640, 785);
      break;
    case "joke2" :  
      text("“I don’t have time for a cuppa!”", 640, 785);
      break;
    case "warNotes" :  
      text("“What’s this?”", 640, 785);
      break;
    case "diaryEntry" :  
      text("You obtain a diary entry.", 640, 785);
      break;
    case "tornPage" :  
      text("You tear these pages from the book and add them to the Book of Eye.", 640, 785);
      break;
    case "inkText" :  
      text("You should first find a quill and some ink...", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}