class Room20 {
  PImage room20;
  PImage room202;
  PImage olivia;
  PImage arrow;
  PImage demon;
  PImage warnote4;
  PImage hint20_1;
  PImage hint20_2;
  boolean showWarNote;
  boolean showOpenBook;
  boolean once = true;
  boolean showPainting = false;
  boolean flashing;
  boolean cured;
  boolean filled;
  boolean flik;
  boolean hint;
  boolean end;
  String loadText;
  int timer1;
  int timer2;
  int time;
  int interval = 7200000;
  int score = 0;
  int x;
  int y = 1;
  int stopFlash;

  Room20() {
    room20 = loadImage("Room 20.1 - Two-Faced.png");
    room202 = loadImage("Room 20.2 - Two-Faced.png");
    arrow =  loadImage("ARROWDOWN.png");
    demon = loadImage ("Demon05.jpg");
    olivia = loadImage("Olivia5_portrait.png");
    warnote4 = loadImage("warnote4.png");
    hint20_1 = loadImage("hint20.1.png");
    hint20_2 = loadImage("hint20.2.png");
  }

  void RoomLoad() {
    crimsonSound.play();
    if (diary.diaryEntry1 && diary.diaryEntry2 && diary.diaryEntry3 && diary.diaryEntry4 && diary.diaryEntry5 && diary.diaryEntry6 && diary.diaryEntry7) {
      achievements.achievement4V = true;
    }
    isRepeating = true;
    background(room20);

    // Display de naam van de kamer 
    if (millis () - timer1 < 6000) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("Two-Faced", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Hints 1 en 2
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint20_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 2) {
      imageMode(CENTER);
      image(hint20_2, 640, 100);
      imageMode(CORNER);
    }

    // Geef de War note weer
    if (showWarNote) {
      imageMode(CENTER);
      image(warnote4, 640, 400);
      imageMode(CORNER);
      image(cross, 790, 670, 50, 50);
    }

    // Display Lore books
    if (showOpenBook && y == 1) {
      image(lorebook.lore8_1i, 140, 34);
    }
    if (showOpenBook && y == 2) {
      image(lorebook.lore8_2, 140, 34);
    }
    if (showOpenBook && y == 3) {
      image(lorebook.lore8_3, 140, 34);
    }
    if (showOpenBook && y == 4) {
      image(lorebook.lore8_4i, 140, 34);
    }

    // Display portrait (= painting)
    if (showPainting) {
      image (olivia, 320, 10, 600, 780);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 < 5000) {
      showText();
    }

    // Laat de demon image flashen en start de monoloog van Crimson
    if (flashing && once) {
      if  (flik) {
        image (demon, 286, 0);
        loadText = "djinn";
        timer2 = millis();
      }
      if (!flik) {
        background(0);
      }
      if (millis()/100 > time) {
        flik = !flik;
        time= time + 1;
        if (stopFlash + 10 == time) {
          flashing = false;
          once = false;
        }
      }
    }

    // De song moet beluisterd zijn eer het spel beïndigd kan worden
    if (crimsonSound.isPlaying() && cured) {
      timerPause = true;
      image(room202, 0, 0);
      fill(255);
      textFont(font2);
      textAlign(CENTER);
      text ("Listen closely now, Eden...", 640, 400);
      textAlign(BASELINE);
      textFont(font1);
      fill(138, 7, 7);
    } 
    if (cured && !crimsonSound.isPlaying()) {
      timerPause = true;
      kamer = 21;
      scorebepalen();
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
    if (!(showPainting || showOpenBook || showWarNote)) {
      if (mouseX > 526  && mouseX <620 && mouseY > 539 && mouseY < 584 && !lorebook.lore08) {
        showOpenBook = true;
        timerPause = true;
        lorebook.lore08 = true;
      }
      if (mouseX > 383 && mouseX < 517 && mouseY > 230 && mouseY < 390) {
        showPainting = true;
        switchSound.play();
        switchSound.rewind();
        portrait.locked12 = true;
        loadText = "paintingtext";
        timer2 = millis();
      }
      if (mouseX > 597  && mouseX < 662 && mouseY > 699 && mouseY < 732 && !inventory.warNote4V) {
        showWarNote = true;
        inventory.warNote4V = true;
        timerPause = true;
      }

      // Wissel vak kamer
      if (mouseX > 1010  && mouseX < 1150 && mouseY > 295 && mouseY < 615) {
        kamer = 19;
        hint = false;
        room19.timer1 = millis();
        timer2 = 0;
        crimsonSound.pause();
      }

      // Controleer of de speler “cured” is en de Diary entries heeft
      if (mouseX > 495  && mouseX < 523 && mouseY > 507 && mouseY < 566 && filled) {
        if (room18.cured1 &&  achievements.achievement4V) {
          timer2 = millis();
          loadText = "cleansed";
          cured = true;
          achievements.achievement1V = true;
          solvedSound.play();
          solvedSound.rewind();
        } else if (room18.cured1 && !achievements.achievement4V) {
          timer2 = millis();
          loadText = "diary";
        } else if (!room18.cured1 && !achievements.achievement4V) {
          timer2 = millis();
          loadText = "notcleansed";
        }
      }

      // Controleer of de speler de wijn heeft
      if (mouseX > 495  && mouseX < 523 && mouseY > 507 && mouseY < 566 && !room17.showWine && !filled) {
        room20 = room202;
        timer2 = millis();
        loadText = "wine";
        inventory.wineV = false;
        filled = true;
        wine.play();
        wine.rewind();
      } else if (mouseX > 495  && mouseX < 523 && mouseY > 507 && mouseY < 566 && !filled) {
        timer2 = millis();
        loadText = "nowine";
      }
    }

    if (mouseX > 1047 && mouseX < 1088 && mouseY > 706 && mouseY < 745 && showOpenBook && y == 4) {
      showOpenBook = false;
      timerPause = false;
      song5.rewind();
      song5.play();
      loadText = "tornPage";
      timer2 = millis();
    }
    if (!(mouseX > 383 && mouseX < 517 && mouseY > 230 && mouseY < 390) && showPainting) {
      showPainting = false;
    }
    if (mouseX > 793  && mouseX < 842 && mouseY > 673 && mouseY < 719 && showWarNote) {
      showWarNote = false;
      timerPause = false;
      timer2 = millis();
      loadText = "warNotes";
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
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "warNotes" :  
      text("“What's this?”", 640, 785);
      break;
    case "tornPage" :  
      text("You tear these pages from the book and add them to the Book of Eye.", 640, 785);
      break;
    case "nowine" :
      text("The glass is empty. Maybe I could find some wine?", 640, 785);
      break;
    case "wine" :
      text("You pour the wine into the glass.", 640, 785);
      break;
    case "cleansed" :
      text("You take a sip of wine. It burns your inside.", 640, 400);
      text("Face your Nightmare.", 640, 450);
      break;
    case "notcleansed" :
      text("“Argh! I burn for I am still cursed.”", 640, 785);
      break;
    case "paintingtext" :
      text("“My dearest Olivia… I am coming for you.”", 640, 785);
      break;
    case "djinn" :
      text("“Djinn Murad, we meet again…”", 640, 785);
      break;
    case "diary" :
      text("“I should first learn more about my past before continuing.”", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
  
  // Dit bepaald de eindscore van het spel
  void scorebepalen() {
    int a1 = 0;
    int a2 = 0;
    int a3 = 0;
    int a4 = 0;
    int a5 = 0;
    int a6 = 0;
    int a7 = 0;
    int a8 = 0;
    int timeleft;
    int aantalUur = hour*100;
    int aantalMinuten = minutes*100/60;
    int achievementscore;
    int n = 0;
    boolean once = true;
    if (once) {
      achievements.achievementCheck();
      once = false;
    }
    if (achievements.achievement1V) {
      a1=1000;
    }
    if (achievements.achievement2V) {
      a2=1000;
    }
    if (achievements.achievement3V) {
      a3=1500;
      n++;
    }
    if (achievements.achievement4V) {
      a4=1000;
    }
    if (achievements.achievement5V) {
      a5=2500;
      n++;
    }
    if (achievements.achievement6V) {
      a6=1500;
      n++;
    }
    if (achievements.achievement7V) {
      a7=1500;
      n++;
    }
    if (achievements.achievement8V) {
      a8=3000;
      n++;
    }
    achievementscore = n*(a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8);
    timeleft = aantalUur + aantalMinuten;
    score = timeleft*100 + achievementscore;
  }
}