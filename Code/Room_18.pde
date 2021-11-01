class Room18 {
  PImage room18;
  PImage arrow;
  PImage ritualBg1;
  PImage ritualBg2;
  PImage lamp;
  PImage dagger;
  PImage lightbringer;
  PImage elixir;
  PImage glove; 
  PImage amulet;
  PImage flashing1;
  PImage flashing2;
  PImage hint18_1;
  PImage kruisje;
  boolean firstTime;
  boolean openLoreBook;
  boolean ritual;
  boolean flashingImg1;
  boolean flashingImg2;
  boolean flash1;
  boolean flash2;
  boolean cured1;
  boolean playSound;
  boolean hint;
  String loadText;
  int timer1;
  int timer2;
  int time1;
  int time2;
  int stopFlash1;
  int stopFlash2;
  int x = 0;
  int y = 1;

  Room18() {
    room18 = loadImage("Room 18 - The_Ritual.jpg");
    ritualBg1 = loadImage("ritual_background_1.png");
    ritualBg2 = loadImage("ritual_background_2.png");
    lamp = loadImage("genie_lamp.png");
    dagger = loadImage("dagger.png");
    lightbringer = loadImage("lightbringer.png");
    elixir = loadImage("vial.png");
    glove = loadImage("glove.png");
    amulet = loadImage("amulet.png");
    flashing1 = loadImage("ritual.png");
    flashing2 = loadImage("flashing_eyes.png");
    arrow =  loadImage("ARROWDOWN.png");
    hint18_1 = loadImage("hint18.1.png");
    kruisje = loadImage("kruisje.png");
  }
  void RoomLoad() {
    isRepeating = true;
    playSound = true;
    background(room18);

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800) {
      image (arrow, 90, 670, 420/5, 600/5);
    }

    // Display de naam van de kamer 
    if (millis () - timer1 < 6000) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("The Ritual", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && cured1) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("Cleared", 1040, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
      hint = false;
    }

    // Hint 1
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint18_1, 640, 100);
      imageMode(CORNER);
    }

    // Display Lore books
    if (openLoreBook) {
      image(lorebook.lore7_1i, 140, 34);
    }
    if (openLoreBook && y == 2) {
      image(lorebook.lore7_2, 140, 34);
    }
    if (openLoreBook && y == 3) {
      image(lorebook.lore7_3, 140, 34);
    }
    if (openLoreBook && y == 4) {
      image(lorebook.lore7_4i, 140, 34);
    }

    // Geef ritual venster weer
    if (ritual) {
      image(ritualBg1, 452, 163);
      image(kruisje, 765, 570, 50, 50);
    }
    if (mouseX > 607  && mouseX <688 && mouseY > 546 && mouseY < 600 && ritual) {
      image(ritualBg2, 452, 163);
      image(kruisje, 765, 570, 50, 50);
    } 

    // Onderstaande if-statements controleren of de speler de juiste objecten heeft verzameld
    if (room2.vial && ritual) {
      image(elixir, 537, 344);
    }
    if (room9.glove && ritual) {
      image(glove, 619, 346);
    }  
    if (room4.lightbringer && ritual) {
      image(lightbringer, 706, 345);
    } 
    if (puzzlegame.puzzleSolved && ritual) {
      image(dagger, 530, 440);
    } 
    if (room6.lamp && ritual) {
      image(lamp, 614, 453);
    } 
    if (room3.amulet && ritual) {
      image(amulet, 720, 441);
    } 

    if (flashingImg1) {
      if  (flash1) {
        image (flashing1, 0, 0);
      }
      if (!flash1) {
        background(0);
      }
      if (millis()/100 > time1) {
        flash1 = !flash1;
        time1= time1 + 1;
        if (stopFlash1 + 6 == time1) {
          flashingImg1 = false;
          flashingImg2 = true;
          time2 = millis()/100;
          stopFlash2 = time1;
        }
      }
    }

    // Flashing van het beeld gebeurt na het uitvoeren van het ritueel
    if (flashingImg2) {
      delay(20);
      if  (flash2) {
        image (flashing2, 490, 334);
      }
      if (!flash2) {
        background(0);
      }

      if (millis()/100 > time2) {
        flash2 = !flash2;
        time2= time2 + 1;
        if (stopFlash2 + 12 == time2) {
          flashingImg2 = false;
          loadText = "ritual";
          timer2 = millis();
          cured.play();
        }
      }
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 < 3500) {
      showText();
    }

    // Toon het hintsymbool rechts boven op het scherm
    if (difficulty.hints) {
      image(hintIcon, 1201, 19);
    }

    // Laad de timer
    timer();

    // Verander de cursor van de muis naargelang waar je je met je muis bevindt
    if (mouseX > 862  && mouseX < 941 && mouseY > 418 && mouseY < 494 && !ritual && !cured1 && !openLoreBook) {
      cursor(cursor4, 5, 5);
    } else if (!(mouseX > 862  && mouseX < 941 && mouseY > 418 && mouseY < 494)) {
      cursor(cursor1, 5, 5);
    }
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {

    if (!openLoreBook) {
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

      if (!cured1) {
        if (mouseX > 776  && mouseX < 815 && mouseY > 576 && mouseY < 622 && ritual) {
          ritual = false;
        }
        if ((mouseX > 614  && mouseX < 677 && mouseY > 548 && mouseY < 594 && ritual) && (!room2.vial || !room9.glove || !room4.lightbringer || !inventory.daggerV || !room6.lamp || !room3.amulet)) {
          loadText = "incomplete";
          timer2 = millis();
        }
        // Controleer of alle voorwaarden voldaan zijn om ritueel uit te voeren; verwijder objecten uit inventory en wordt “cured”
        if (mouseX > 614  && mouseX < 677 && mouseY > 548 && mouseY < 594 && ritual && room2.vial && room9.glove && room4.lightbringer && inventory.daggerV && room6.lamp && room3.amulet) {
          ritual = false;
          cured1 = true;
          flashingImg1 = true;
          time1 = millis()/100;
          stopFlash1 = time1;
        }
        if (mouseX > 862  && mouseX < 941 && mouseY > 418 && mouseY < 494) {
          ritual = true;
        }
      }
      if (mouseX > 706  && mouseX < 756 && mouseY > 425 && mouseY < 501 && !lorebook.lore07 && !ritual) {
        openLoreBook = true;
        lorebook.lore07 = true;
        timerPause = true;
      }

      // Wissel van kamer
      if (mouseX > 111  && mouseX < 166 && mouseY > 664 && mouseY < 800) {
        song1room16.play();
        song1room16.rewind();
        kamer = 16;
        hint = false;
        room16.timer1 = millis();
        timer2 = 0;
        whisper.pause();
      }
    }

    // Simuleer een pageflip met geluid in het Lore book
    if (mouseX > 981 && mouseX < 1084 && mouseY > 725 && mouseY < 750 && openLoreBook)
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
    if (mouseX > 218 && mouseX < 321 && mouseY > 725 && mouseY < 751 && openLoreBook)
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

    if (mouseX > 862  && mouseX < 941 && mouseY > 418 && mouseY < 494 && cured1) {
      loadText = "alreadyCured";
      timer2 = millis();
    }
    if (mouseX > 1047 && mouseX < 1088 && mouseY > 706 && mouseY < 745 && openLoreBook && y == 4 ) {
      openLoreBook = false;
      firstTime = true;
      timerPause = false;
      loadText = "tornPage";
      timer2 = millis();
      song5.play();
      song5.rewind();
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "tornPage" :  
      text("You tear these pages from the book and add them to the Book of Eye.", 640, 785);
      break;
    case "incomplete" :  
      text("You do not possess all required items to perform the Ritual.", 640, 785);
      break;
    case "ritual" :  
      text("You cleanse yourself from the curse.", 640, 785);
      break;
    case "alreadyCured" :  
      text("You have already been cured...", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}