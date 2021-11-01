class Room9 {
  PImage room9;
  PImage openBook;
  PImage tornPage;
  PImage keys;
  PImage demon;
  PImage portal1;
  PImage portal2;
  PImage diaryIcon;
  PImage entry3;
  PImage hint9_1;
  PImage hint9_2;
  PImage hint9_3;
  int timer1;
  int timer2;
  int m;
  int time;
  int time2;
  int time3;
  int stopFlash;
  int x;
  int y = 1;
  int z = 1;
  String loadText;
  boolean showKeys = true;
  boolean showOpenLorebook;
  boolean open1;
  boolean open2;
  boolean flik;
  boolean flashing;
  boolean portal;
  boolean portalFlash;
  boolean flash;
  boolean glove;
  boolean diaryEntry = true;
  boolean showDiary;
  boolean hint;
  boolean showOpenLore;

  Room9() {
    room9 = loadImage("Room 09.1 - Library.png");
    openBook = loadImage ("lore_open_book.png");
    tornPage = loadImage("torn_page.png");
    keys = loadImage("key_01.png");
    demon = loadImage("Demon04.jpg");
    portal1 = loadImage("portal.png");
    portal2 = loadImage("portal_flash.png");
    diaryIcon = loadImage("brief_icon.png");
    entry3 = loadImage ("diarypage3.png");
    hint9_1 = loadImage("hint9.1.png");
    hint9_2 = loadImage("hint9.2.png");
    hint9_3 = loadImage("hint9.3.png");
  }
  void RoomLoad() {
    background(room9);

    // Speelt geluid af van een koor
    if (scaryChoir.isPlaying() == false)
    {
      scaryChoir.rewind();
      scaryChoir.play();
    }

    // Toont het object op het scherm - afhankelijk of deze boolean al dan niet true is
    if (portal) {
      image(portal1, 545, 290);
    }

    // Controleer of de sleutel al dan niet al is opgepakt door de speler
    if (showKeys) {
      image(keys, 697, 364, 49/5, 139/5);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && glove && portal && diary.diaryEntry3) {
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
      text("Library", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Display Lore books
    if (showOpenLore && y == 1) {
      image(lorebook.lore6_1i, 140, 34);
    }
    if (showOpenLore && y == 2) {
      image(lorebook.lore6_2, 140, 34);
    }
    if (showOpenLore && y == 3) {
      image(lorebook.lore6_3, 140, 34);
    }
    if (showOpenLore && y == 4) {
      image(lorebook.lore6_4, 140, 34);
    }
    if (showOpenLore && y == 5) {
      image(lorebook.lore6_5, 140, 34);
    }
    if (showOpenLore && y == 6) {
      image(lorebook.lore6_6i, 140, 34);
    }
    if (showOpenLorebook && z==1) {
      image(lorebook.lore5_1i, 140, 34);
    }
    if (showOpenLorebook && z == 2) {
      image(lorebook.lore5_2, 140, 34);
    }
    if (showOpenLorebook && z == 3) {
      image(lorebook.lore5_3, 140, 34);
    }
    if (showOpenLorebook && z == 4) {
      image(lorebook.lore5_4, 140, 34);
    }
    if (showOpenLorebook && z == 5) {
      image(lorebook.lore5_5, 140, 34);
    }
    if (showOpenLorebook && z == 6) {
      image(lorebook.lore5_6i, 140, 34);
    }

    // Geef de Diary entry weer
    if (showDiary) {
      imageMode(CENTER);
      image(entry3, 640, 400);
      imageMode(CORNER);
    }

    if (diaryEntry) {
      image(diaryIcon, 760, 760);
    }

    // Controleer of één van de hoofden van de beelden aangeklikt wordt binnen de 5 seconden
    if (open1 || open2) {
      m=int(millis()/1000);
      loadText = "statue";
      timer2 = millis();
      if (m-time == 5 && kamer == 9) {
        open1= false;
        open2= false;
      }
    }

    // Controleer of beide hoofden aangeklikt werden: open de portal
    if (open1 && open2) {
      portal = true;
      room8.timer1 = millis();
      open1= false;
      open2= false;
      solvedSound.play();
    }

    // Hints 1, 2 en 3
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint9_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 2) {
      imageMode(CENTER);
      image(hint9_2, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 3) {
      imageMode(CENTER);
      image(hint9_3, 640, 100);
      imageMode(CORNER);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 < 5000) {
      showText();
    }

    // Flash de demon
    if (flashing) {
      if  (flik) {
        image (demon, 0, 0);
      }
      if (!flik) {
        background(0);
      }

      if (millis()/100 > time2) {
        flik = !flik;
        time2= time2 + 1;
        if (stopFlash + 5 == time2) {
          flashing = false;
        }
      }
    }

    // Flash de portal en switch van achtergrondmuziek
    if (portalFlash) {
      if  (flash) {
        image (portal2, 0, 0);
      }
      if (!flash) {
        background(0);
      }
      if (millis()/100 > time3) {
        flash = !flash;
        time3= time3 + 1;
        if (stopFlash + 10 == time3) {
          portalFlash = false;
          // Wissel van kamer
          kamer = 8;
          scaryChoir.pause();
          hint = false;
          song3.play();
          room8.timer1 = millis();
          timer2 = 0;
        }
      }
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
    if (!(showOpenLorebook || showDiary || showOpenLore)) {
      if (mouseX > 246  && mouseX <343 && mouseY > 570 && mouseY < 600) {
        flashing= true;
        time2 = millis()/100;
        stopFlash = time2;
        song6.play();
        song6.rewind();
        loadText = "demon";
        timer2 = millis();
        achievements.achievement7V = true;
      }
      if (mouseX > 738  && mouseX <758 && mouseY > 305 && mouseY < 326) {
        open1= true;
        time =(int(millis()/1000));
      }
      if (mouseX > 766  && mouseX <846 && mouseY > 778 && mouseY < 800 && !diary.diaryEntry3 && !room1.inkText) {
        diaryEntry = false;
        showDiary = true;
        timerPause = true;
      }
      if (mouseX > 766  && mouseX <846 && mouseY > 778 && mouseY < 800 && !diary.diaryEntry3 && room1.inkText) {
        loadText = "inkText";
        timer2 = millis();
      }
      if (mouseX > 550 && mouseX < 685 && mouseY > 254 && mouseY < 476 && !portal) {
        doorKnock.play();
        doorKnock.rewind();
      }
      if (mouseX > 467  && mouseX <493 && mouseY > 390 && mouseY < 415 && !glove) {
        room9 = loadImage("Room 09.2 - Library.jpg");
        inventory.gloveV = true;
        glove = true;
        loadText= "glove";
        timer2 = millis();
      }
      if (mouseX > 700  && mouseX <712 && mouseY >369 && mouseY < 395 && showKeys) {
        timer2= millis();
        inventory.key4V = true;
        loadText = "keys";
        keySound.play();
        keySound.rewind();
      }
      if (mouseX > 580  && mouseX <700 && mouseY >325 && mouseY < 425 && portal) {
        portalFlash = true;
        time3 = millis()/100;
        stopFlash = time3;
        portalSound.play();
        portalSound.rewind();
      }
      if (mouseX > 122 && mouseX < 320 && mouseY > 480 && mouseY < 550 && !lorebook.lore05) {
        showOpenLore = true;
        timerPause = true;
        lorebook.lore05 = true;
      }

      if (mouseX > 1065  && mouseX <1150 && mouseY > 230 && mouseY < 460 && !lorebook.lore06) {
        showOpenLorebook = true;
        timerPause = true;
        lorebook.lore06 = true;
      }
      if (mouseX > 485  && mouseX <503 && mouseY > 305 && mouseY < 331 ) {
        open2= true;
        time =(int(millis()/1000));
      }
      if ((mouseX > 195  && mouseX <220 && mouseY > 200 && mouseY < 455) || (mouseX > 330  && mouseX <465 && mouseY > 170 && mouseY < 515)
        || (mouseX > 785  && mouseX <920 && mouseY > 190 && mouseY < 550)||(mouseX > 975  && mouseX <1020 && mouseY > 225 && mouseY < 575)) {
        loadText = "search";
        timer2 = millis();
      }
    }
    if (mouseX > 1047 && mouseX < 1088 && mouseY > 706 && mouseY < 745 && showOpenLorebook && z == 6) {
      showOpenLorebook = false;
      timerPause = false;
      loadText = "loretext1";
      timer2 = millis();
      song5.rewind();
      song5.play();
    }
    if (mouseX > 1047 && mouseX < 1088 && mouseY > 706 && mouseY < 745 && showOpenLore && y == 6) {
      showOpenLore = false;
      timerPause = false;
      loadText = "loretext1";
      timer2 = millis();
      song5.rewind();
      song5.play();
    }
    if (mouseX > 841  && mouseX < 891 && mouseY > 677 && mouseY < 751 && showDiary ) {
      showDiary = false;
      diary.diaryEntry3 = true;
      timerPause = false;
      timer2 = millis();
      loadText = "diaryEntry";
      quill.play();
      quill.rewind();
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

    // Simuleer een pageflip met geluid in het eerste Lore book 
    if (mouseX > 981 && mouseX < 1084 && mouseY > 725 && mouseY < 750 && showOpenLore)
    {
      y++;
      if (y >= 1 && y <= 6) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y==7) {
        y=6;
      }
    }
    if (mouseX > 218 && mouseX < 321 && mouseY > 725 && mouseY < 751 && showOpenLore)
    {
      y--;
      if (y >= 1 && y <= 6) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y==0) {
        y=1;
      }
    }

    // Simuleer een pageflip met geluid in het tweede Lore book 
    if (mouseX > 981 && mouseX < 1084 && mouseY > 725 && mouseY < 750 && showOpenLorebook)
    {
      z++;
      if (z >= 1 && z <= 6) {
        pageflip.play();
        pageflip.rewind();
      }
      if (z==7) {
        z=6;
      }
    }
    if (mouseX > 218 && mouseX < 321 && mouseY > 725 && mouseY < 751 && showOpenLorebook)
    {
      z--;
      if (z >= 1 && z <= 6) {
        pageflip.play();
        pageflip.rewind();
      }
      if (z==0) {
        z=1;
      }
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "glove" :  
      text("“This is the legendary Aetherian glove that Marcus wore when he defeated Crimson.”", 640, 785);
      break;
    case "loretext1" :
      text("You tear these pages from the book and add them to the Book of Eye.", 640, 785);
      break;
    case "search" :
      text("You search through the books, but can’t find anything of interest.", 640, 785);
      break;
    case "keys" :
      showKeys = false;
      text("You obtain a key.", 640, 785);
      break;
    case "demon" :
      text("A chess piece infused with a Pyre’s blood.", 640, 785);
      break;
    case "diaryEntry" :
      text("You obtain a diary entry.", 640, 785);
      break;
    case "statue" :
      text("“How unusual. This statue’s head is moveable.”", 640, 785);
      break;
    case "inkText" :  
      text("You should first find a quill and some ink...", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}