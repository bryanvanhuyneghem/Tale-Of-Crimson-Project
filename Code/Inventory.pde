class Inventory {
  PImage inventory;
  PImage quillInk;
  PImage shield04;
  PImage shield12;
  PImage elixir;
  PImage amulet;
  PImage ropeladder;
  PImage puzzlebox;
  PImage dagger;
  PImage genielamp;
  PImage torch;
  PImage wine;
  PImage glove;
  PImage dairyEntry;
  PImage loreEntry;
  PImage amuletOf6;
  PImage diaryOfEden;
  PImage bookOfEye;
  PImage lightbringer;
  PImage key1;
  PImage key2;
  PImage key3;
  PImage key4;
  PImage key5;
  PImage key6;
  PImage warNote1;
  PImage warNote2;
  PImage warNote3;
  PImage warNote4;
  boolean mute;
  boolean quillInkV;
  boolean shield04V;
  boolean shield12V;
  boolean elixirV;
  boolean amuletV;
  boolean ropeLadderV;
  boolean puzzleBoxV;
  boolean daggerV;
  boolean genieLampV;
  boolean torchV;
  boolean gloveV;
  boolean wineV;
  boolean dairyEntryV;
  boolean loreEntryV;
  boolean amuletOf6V;
  boolean diaryOfEdenV;
  boolean bookOfEyeV;
  boolean lightbringerV;
  boolean key1V;
  boolean key2V;
  boolean key3V;
  boolean key4V;
  boolean key5V;
  boolean key6V;
  boolean warNote1V;
  boolean warNote2V;
  boolean warNote3V;
  boolean warNote4V;
  boolean note1;
  boolean note2;
  boolean note3;
  boolean note4;
  int timer1;
  String loadText;

  Inventory() {
    inventory = loadImage("Inventory background_audio.png");
    quillInk = loadImage("enter_name.png");
    shield04 = loadImage("shield_04_icon.png");
    shield12 = loadImage("shield_12_icon.png");
    elixir = loadImage("vial.png");
    amulet = loadImage("amulet.png");
    ropeladder = loadImage("rope_ladder_icon.png");
    puzzlebox = loadImage("Puzzle_box_icon.png");
    dagger = loadImage("dagger.png");
    genielamp = loadImage("genie_lamp.png");
    torch = loadImage("torch_cursor.png");
    wine = loadImage("wine_icon.png");
    dairyEntry = loadImage("diary_entries_nobook.png");
    loreEntry = loadImage("lore_nobook.png");
    amuletOf6 = loadImage("amulet_of_understanding_icon.png");
    diaryOfEden = loadImage("diary_of_eden.png");
    bookOfEye  = loadImage("lore_book.png");
    lightbringer =loadImage("lightbringer.png");
    glove = loadImage("glove.png");
    key1 = loadImage("key1.png");
    key2 = loadImage("key2.png");
    key3 = loadImage("key3.png");
    key4 = loadImage("key4.png");
    key5 = loadImage("key5.png");
    key6 = loadImage("key6.png");
    warNote1 = loadImage("letter_icon1.png");
    warNote2 = loadImage("letter_icon2.png");
    warNote3 = loadImage("letter_icon3.png");
    warNote4 = loadImage("letter_icon4.png");
  }
  //Toont items
  void inventory() {

    background(inventory);
    if (mute) {
      inventory = loadImage("Inventory background_mute.png");
      song3.pause();
    } else {
      inventory = loadImage("Inventory background_audio.png");
      isRepeating = true;
    }
    if (quillInkV) {
      image(quillInk, 125, 180);
    }
    if (shield04V) {
      image(shield04, 213, 185);
    }
    if (shield12V) {
      image(shield12, 212, 180);
    }
    if (elixirV) {
      image(elixir, 320, 185);
    }
    if (amuletV) {
      image(amulet, 130, 284);
    }
    if (ropeLadderV) {
      image(ropeladder, 220, 280);
    }
    if (puzzleBoxV) {                                    
      image(puzzlebox, 320, 300);
    }
    if (daggerV) {                                        
      image(dagger, 120, 380);
    }
    if (genieLampV) {
      image(genielamp, 210, 390);
    }
    if (torchV) {
      image(torch, 300, 380);
    }
    if (wineV) {
      image(wine, 126, 480);
    }
    if (gloveV) {
      image(glove, 212, 480);
    }
    if (loreEntryV && !bookOfEyeV) {
      image(loreEntry, 304, 480);
    }
    if (dairyEntryV && !diaryOfEdenV) {
      image(dairyEntry, 114, 580);
    }
    if (amuletOf6V) {
      image(amuletOf6, 304, 580);
    }
    if (diaryOfEdenV) {
      image(diaryOfEden, 500, 120);
    }
    if (bookOfEyeV) {
      image(bookOfEye, 505, 210);
    }
    if (lightbringerV) {
      image(lightbringer, 503, 304);
    }
    if (warNote1V) {
      image(warNote1, 830, 185);
    }
    if (warNote2V) {
      image(warNote2, 925, 185);
    }
    if (warNote3V) {
      image(warNote3, 1020, 185);
    }
    if (warNote4V) {
      image(warNote4, 1115, 185);
    }
    if (key1V) {
      image(key1, 528, 440);
    }
    if (key2V) {
      image(key2, 622, 440);
    }
    if (key3V) {
      image(key3, 528, 537);
    }
    if (key4V) {
      image(key4, 622, 537);
    }
    if (key5V) {
      image(key5, 528, 635);
    }
    if (key6V) {
      image(key6, 622, 635);
    }
    if (lorebook.lore01 || lorebook.lore02 || lorebook.lore03 || lorebook.lore04 || lorebook.lore05 || lorebook.lore06 || lorebook.lore07 || lorebook.lore08) {
      loreEntryV = true;
    }
    if (diary.diaryEntry1 || diary.diaryEntry2 || diary.diaryEntry3 || diary.diaryEntry4 || diary.diaryEntry5 || diary.diaryEntry6 || diary.diaryEntry7) {
      dairyEntryV = true;
    }
    if (note1) {
      imageMode(CENTER);
      image(room6.warnote1, 640, 400);
      imageMode(CORNER);
      image(cross, 790, 670, 50, 50);
    }
    if (note2) {
      imageMode(CENTER);
      image(room7.warnote2, 640, 400);
      imageMode(CORNER);
      image(cross, 790, 670, 50, 50);
    }
    if (note3) {
      imageMode(CENTER);
      image(room8.warnote3, 640, 400);
      imageMode(CORNER);
      image(cross, 790, 670, 50, 50);
    }
    if (note4) {
      imageMode(CENTER);
      image(room20.warnote4, 640, 400);
      imageMode(CORNER);
      image(cross, 790, 670, 50, 50);
    }
    fill(255, 255, 255);
    text("Close inventory", 100, 772);
    hoverMenu();
    timerPause = true;
    if (millis () - timer1 < 5000) {
      showText();
    }
  }
  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    if (!note1 && !note2 && !note3 && !note4) {
      if (mouseX > 105 && mouseX < 330 && mouseY > 742 && mouseY < 786) {
        kamer = currentRoom;
        timerPause = false;
      }
      if (mouseX > 866 && mouseX < 950 && mouseY > 583 && mouseY < 670) {
        mute = !mute;
      }
      if (mouseX > 110 && mouseX < 175 && mouseY > 180 && mouseY < 250 && quillInkV) {
        loadText = "1";
        timer1 = millis();
      }
      if (mouseX > 205 && mouseX < 270 && mouseY > 180 && mouseY < 250 && shield04V) {
        loadText = "2";
        timer1 = millis();
      }
      if (mouseX > 205 && mouseX < 270 && mouseY > 180 && mouseY < 250 && shield12V) {
        loadText = "16";
        timer1 = millis();
      }
      if (mouseX > 300 && mouseX < 365 && mouseY > 180 && mouseY < 250 && elixirV) {
        loadText = "3";
        timer1 = millis();
      }
      if (mouseX > 110 && mouseX < 175 && mouseY > 280 && mouseY < 345 && amuletV) {
        loadText = "4";
        timer1 = millis();
      }
      if (mouseX > 205 && mouseX < 270 && mouseY > 280 && mouseY < 345 && ropeLadderV) {
        loadText = "5";
        timer1 = millis();
      }
      if (mouseX > 300 && mouseX < 365 && mouseY > 280 && mouseY < 345 && puzzleBoxV) {
        loadText = "6";
        timer1 = millis();
      }
      if (mouseX > 110 && mouseX < 175 && mouseY > 380 && mouseY < 445 && daggerV) {
        loadText = "7";
        timer1 = millis();
      }
      if (mouseX > 205 && mouseX < 270 && mouseY > 380 && mouseY < 445 && genieLampV) {
        loadText = "8";
        timer1 = millis();
      }
      if (mouseX > 300 && mouseX < 365 && mouseY > 380 && mouseY < 445 && torchV) {
        loadText = "9";
        timer1 = millis();
      }
      if (mouseX > 110 && mouseX < 175 && mouseY > 480 && mouseY < 545 && wineV) {
        loadText = "10";
        timer1 = millis();
      }
      if (mouseX > 205 && mouseX < 270 && mouseY > 480 && mouseY < 545 && gloveV) {
        loadText = "11";
        timer1 = millis();
      }
      if (mouseX > 300 && mouseX < 365 && mouseY > 480 && mouseY < 545 && loreEntryV && !bookOfEyeV) {
        loadText = "12";
        timer1 = millis();
      }
      if (mouseX > 110 && mouseX < 175 && mouseY > 580 && mouseY < 645 && dairyEntryV && !bookOfEyeV) {
        loadText = "13";
        timer1 = millis();
      }
      if (mouseX > 300 && mouseX < 365 && mouseY > 580 && mouseY < 645 && amuletOf6V) {
        loadText = "15";
        timer1 = millis();
      }
      if (mouseX > 500 && mouseX < 560 && mouseY > 115 && mouseY < 185 && diaryOfEdenV) {
        kamer = 27;
      }
      if (mouseX > 500 && mouseX < 560 && mouseY > 210 && mouseY < 272 && bookOfEyeV) {
        kamer = 26;
      }
      if (mouseX > 500 && mouseX < 560 && mouseY > 300 && mouseY < 370 && lightbringerV) {
        loadText = "19";
        timer1 = millis();
      }
      if (((mouseX > 620 && mouseX < 685) && ((mouseY > 435 && mouseY < 505 && key2V) || (mouseY > 535 && mouseY < 605 && key4V) || (mouseY > 635 && mouseY < 705 && key6V)))
        || (mouseX > 525 && mouseX < 590) && ((mouseY > 435 && mouseY < 505 && key1V) || (mouseY > 535 && mouseY < 605 && key3V) || (mouseY > 635 && mouseY < 705 && key5V))) {
        loadText = "20";
        timer1 = millis();
      }
      if (mouseX > 830 && mouseX < 950 && warNote1V && mouseY > 175 && mouseY < 243) {
        note1 = true;
      }
      if (mouseX > 925 && mouseX < 985 && warNote2V && mouseY > 175 && mouseY < 243) {
        note2 = true;
      }
      if (mouseX > 1015 && mouseX < 1080 && warNote3V && mouseY > 175 && mouseY < 243) {
        note3 = true;
      }
      if (mouseX > 1113 && mouseX < 1177 && warNote4V && mouseY > 175 && mouseY < 243) {
        note4 = true;
      }
      if (mouseX > 1076 && mouseX < 1123 && mouseY > 585 && mouseY < 660) {
        kamer = 25;
      }
      if (mouseX > 1032 && mouseX < 1184 && mouseY > 400 && mouseY < 481) {
        kamer = 28;
      }
    }
    if (note1 && mouseX > 793  && mouseX < 842 && mouseY > 673 && mouseY < 719) {
      note1 = false;
    }
    if (note2 && mouseX > 793  && mouseX < 842 && mouseY > 673 && mouseY < 719) {
      note2 = false;
    }
    if (note3 && mouseX > 793  && mouseX < 842 && mouseY > 673 && mouseY < 719) {
      note3 = false;
    }
    if (note4 && mouseX > 793  && mouseX < 842 && mouseY > 673 && mouseY < 719) {
      note4 = false;
    }
  }
  // Verander de tekst van kleur als de mouse erover hovert
  void hoverMenu() {
    if (!note1 && !note2 && !note3 && !note4) {
      if (mouseX > 105 && mouseX < 330 && mouseY > 742 && mouseY < 786) {
        fill(138, 7, 7);
        text("Close inventory", 100, 772);
      }
    }
  }


  // Geef extra uitleg over de objecten in de inventory weer onderaan het scherm
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "1" :
      text("A quill and some ink", 640, 785);
      break;
    case "2" : 
      text("A legendary, damaged shield", 640, 785);
      break;
    case "3" : 
      text("The Elixir of Rejuvenation", 640, 785);      
      break;
    case "4" : 
      text("The Amulet of Piercing Light", 640, 785);
      break;
    case "5" : 
      text("A rope ladder", 640, 785);
      break;
    case "6":
      text("Ganex ancient puzzle", 640, 785);
      break;
    case "7":
      text("The Lovecraftian Dagger", 640, 785);
      break;
    case "8":
      text("Djinn Murad’s lamp", 640, 785);
      break;
    case "9":
      text("A torch", 640, 785);
      break;
    case "10":
      text("A fine wine", 640, 785);
      break;
    case "11":
      text("Marcus Aetherius’ glove", 640, 785);
      break;
    case "12":
      text("I should find a book to store these in.", 640, 785);
      break;
    case "13":
      text("I should find a book to store these in.", 640, 785);
      break;
    case "15":
      text("The Amulet of Understanding.", 640, 785);
      break;
    case "16":
      text("A legendary shield infused with your blood.", 640, 785);
      break;
    case "19":
      text("The legendary Lightbringer,", 640, 745);
      text("shapeshifted into Trinity upon your touch.", 640, 785);
      break;
    case "20":
      text("A mysterious key", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}

// Display The Book of Eye
class Lorebook {

  PImage lorebookbackground;
  PImage openBook;
  PImage lore1_1;
  PImage lore1_2;  
  PImage lore1_3;
  PImage lore1_3i;
  PImage lore2_1;
  PImage lore2_1i;
  PImage lore2_2;
  PImage lore2_3;
  PImage lore2_3i;
  PImage lore3_1;
  PImage lore3_1i;
  PImage lore3_1w;
  PImage lore3_2;
  PImage lore3_3;
  PImage lore3_4i;
  PImage lore4_1;
  PImage lore4_1i;
  PImage lore4_1w;
  PImage lore4_2;
  PImage lore4_3;
  PImage lore4_4;
  PImage lore4_5i;
  PImage lore5_1;
  PImage lore5_1i;
  PImage lore5_1w;
  PImage lore5_2;
  PImage lore5_3;
  PImage lore5_4;
  PImage lore5_5;
  PImage lore5_6;
  PImage lore5_6i;
  PImage lore6_1;
  PImage lore6_1i;
  PImage lore6_2;
  PImage lore6_3;
  PImage lore6_4;
  PImage lore6_5;
  PImage lore6_6;
  PImage lore6_6i;
  PImage lore7_1;
  PImage lore7_1i;
  PImage lore7_2;
  PImage lore7_3;
  PImage lore7_4;
  PImage lore7_4i;
  PImage lore8_1;
  PImage lore8_1i;
  PImage lore8_2;
  PImage lore8_3;
  PImage lore8_4;
  PImage lore8_4i;
  boolean lore01;
  boolean lore02;
  boolean lore03;
  boolean lore04;
  boolean lore05;
  boolean lore06;
  boolean lore07;
  boolean lore08;
  int y = 1;

  Lorebook() {
    lorebookbackground = loadImage("pyres_pause.png");
    openBook = loadImage ("lore_open_book.png");
    lore1_1 = loadImage("lore1.1.png");
    lore1_2 = loadImage("lore1.2.png");  
    lore1_3 = loadImage("lore1.3.png");
    lore1_3i = loadImage("lore1.3ingame.png");
    lore2_1 = loadImage("lore2.1.png");
    lore2_1i  = loadImage("lore2.1ingame.png");
    lore2_2 = loadImage("lore2.2.png");
    lore2_3i = loadImage("lore2.3ingame.png");
    lore3_1 = loadImage("lore3.1.png");
    lore3_1i = loadImage("lore3.1ingame.png");
    lore3_1w = loadImage("lore3.1without.png");
    lore3_2 = loadImage("lore3.2.png");
    lore3_3 = loadImage("lore3.3.png");
    lore3_4i = loadImage("lore3.4ingame.png");
    lore4_1 = loadImage("lore4.1.png");
    lore4_1i = loadImage("lore4.1ingame.png");
    lore4_1w = loadImage("lore4.1without.png");
    lore4_2 = loadImage("lore4.2.png");
    lore4_3 = loadImage("lore4.3.png");
    lore4_4 = loadImage("lore4.4.png");
    lore4_5i = loadImage("lore4.5ingame.png");
    lore5_1 = loadImage("lore5.1.png");
    lore5_1i = loadImage("lore5.1ingame.png");
    lore5_1w = loadImage("lore5.1without.png");
    lore5_2 = loadImage("lore5.2.png");
    lore5_3 = loadImage("lore5.3.png");
    lore5_4 = loadImage("lore5.4.png");
    lore5_5 = loadImage("lore5.5.png");
    lore5_6 = loadImage("lore5.6.png");
    lore5_6i = loadImage("lore5.6ingame.png");
    lore6_1 = loadImage("lore6.1.png");
    lore6_1i = loadImage("lore6.1ingame.png");
    lore6_2 = loadImage("lore6.2.png");
    lore6_3 = loadImage("lore6.3.png");
    lore6_4 = loadImage("lore6.4.png");
    lore6_5 = loadImage("lore6.5.png");
    lore6_6 = loadImage("lore6.6.png");
    lore6_6i = loadImage("lore6.6ingame.png");
    lore7_1 = loadImage("lore7.1.png");
    lore7_1i = loadImage("lore7.1ingame.png");
    lore7_2 = loadImage("lore7.2.png");
    lore7_3 = loadImage("lore7.3.png");
    lore7_4 = loadImage("lore7.4.png");
    lore7_4i = loadImage("lore7.4ingame.png");
    lore8_1 = loadImage("lore8.1.png");
    lore8_1i = loadImage("lore8.1ingame.png");
    lore8_2 = loadImage("lore8.2.png");
    lore8_3 = loadImage("lore8.3.png");
    lore8_4 = loadImage("lore8.4.png");
    lore8_4i = loadImage("lore8.4ingame.png");
  }
  void lorebook() {
    background(lorebookbackground);
    image(openBook, 140, 34);
    fill(255, 255, 255);
    text("Go back", 50, 772);
    hoverMenu();

    // Blader door het boek
    if (lore01) {
      if (y == 1) {
        image(lore1_1, 140, 34);
      }
      if (y == 2) {
        image(lore1_2, 140, 34);
      }
      if (y == 3) {
        image(lore1_3, 140, 34);
      }
    }
    if (lore02) {
      if (y == 4) {
        image(lore2_1, 140, 34);
      }
      if (y == 5) {
        image(lore2_2, 140, 34);
      }
      if (y == 6 && !lore03) {
        image(lore3_1w, 140, 34);
      }
    }
    if (lore03) {
      if (y == 6) {
        image(lore3_1, 140, 34);
      }
      if (y == 7) {
        image(lore3_2, 140, 34);
      }
      if (y == 8) {
        image(lore3_3, 140, 34);
      }
      if (y == 9 && !lore04) {
        image(lore4_1w, 140, 34);
      }
    }
    if (lore04) {
      if (y == 9) {
        image(lore4_1, 140, 34);
      }
      if (y == 10) {
        image(lore4_2, 140, 34);
      }
      if (y == 11) {
        image(lore4_3, 140, 34);
      }
      if (y == 12) {
        image(lore4_4, 140, 34);
      }
      if (y == 13 && !lore05) {
        image(lore5_1w, 140, 34);
      }
    }
    if (lore05) {
      if (y == 13) {
        image(lore5_1, 140, 34);
      }
      if (y == 14) {
        image(lore5_2, 140, 34);
      }
      if (y == 15) {
        image(lore5_3, 140, 34);
      }
      if (y == 16) {
        image(lore5_4, 140, 34);
      }
      if (y == 17) {
        image(lore5_5, 140, 34);
      }
      if (y == 18) {
        image(lore5_6, 140, 34);
      }
    }
    if (lore06) {
      if (y == 19) {
        image(lore6_1, 140, 34);
      }
      if (y == 20) {
        image(lore6_2, 140, 34);
      }
      if (y == 21) {
        image(lore6_3, 140, 34);
      }
      if (y == 22) {
        image(lore6_4, 140, 34);
      }
      if (y == 23) {
        image(lore6_5, 140, 34);
      }
      if (y == 24) {
        image(lore6_6, 140, 34);
      }
    }
    if (lore07) {
      if (y == 25) {
        image(lore7_1, 140, 34);
      }
      if (y == 26) {
        image(lore7_2, 140, 34);
      }
      if (y == 27) {
        image(lore7_3, 140, 34);
      }
      if (y == 28) {
        image(lore7_4, 140, 34);
      }
    }
    if (lore08) {
      if (y == 29) {
        image(lore8_1, 140, 34);
      }
      if (y == 30) {
        image(lore8_2, 140, 34);
      }
      if (y == 31) {
        image(lore8_3, 140, 34);
      }
      if (y == 32) {
        image(lore8_4, 140, 34);
      }
    }
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    if (mouseX > 55 && mouseX < 163 && mouseY > 742 && mouseY < 777) {
      kamer = 23;
    }

    // Simuleer een pageflip met geluid in het Lore book
    if (mouseX > 981 && mouseX < 1084 && mouseY > 725 && mouseY < 750)
    {
      y++;
      if ( y >= 1 && y <= 32) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y==33) {
        y=32;
      }
    }
    if (mouseX > 218 && mouseX < 321 && mouseY > 725 && mouseY < 751)
    {
      y--;
      if ( y >= 1 && y <= 32) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y==0) {
        y=1;
      }
    }
  }

  void hoverMenu() {
    if (mouseX > 55 && mouseX < 163 && mouseY > 742 && mouseY < 777) {
      fill(138, 7, 7);
      text("Go back", 50, 772);
    }
  }
}

class Diary {

  PImage diarybackground;
  PImage diary;
  PImage entry1;
  PImage entry2;
  PImage entry3;
  PImage entry4;
  PImage entry5;
  PImage entry6;
  PImage entry7;
  boolean diaryEntry1;
  boolean diaryEntry2;
  boolean diaryEntry3;
  boolean diaryEntry4;
  boolean diaryEntry5;
  boolean diaryEntry6;
  boolean diaryEntry7;
  int y = 1;

  Diary() {

    diarybackground = loadImage("diary_background.jpg");
    diary = loadImage ("edensdiary.png");
    entry1 = loadImage("edensdiary1.png");
    entry2 = loadImage("edensdiary2.png");
    entry3 = loadImage("edensdiary3.png");
    entry4 = loadImage("edensdiary4.png");
    entry5 = loadImage("edensdiary5.png");
    entry6 = loadImage("edensdiary6.png");
    entry7 = loadImage("edensdiary7.png");
  }
  void diary() {
    background(diarybackground);
    imageMode(CENTER);
    image(diary, 640, 400);
    fill(255, 255, 255);
    text("Go back", 50, 772);
    hoverMenu();

    if (diaryEntry1 && y == 1) {
      image(entry1, 640, 400);
    }
    if (diaryEntry2 && y == 2) {
      image(entry2, 640, 400);
    }
    if (diaryEntry3 && y == 3) {
      image(entry3, 640, 400);
    }
    if (diaryEntry4 && y == 4) {
      image(entry4, 640, 400);
    }
    if (diaryEntry5 && y == 5) {
      image(entry5, 640, 400);
    }
    if (diaryEntry6 && y == 6) {
      image(entry6, 640, 400);
    }
    if (diaryEntry7 && y == 7) {
      image(entry7, 640, 400);
    }
    imageMode(CORNER);
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    if (mouseX > 55 && mouseX < 163 && mouseY > 742 && mouseY < 777) {
      kamer = 23;
    }

    // Simuleer een pageflip met geluid in Eden's Diary
    if (mouseX > 382 && mouseX < 436 && mouseY > 570 && mouseY < 714)
    {
      y++;
      if ( y >= 1 && y <= 7) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y == 8) {
        y = 7;
      }
    }
    if (mouseX > 392 && mouseX < 431 && mouseY > 93 && mouseY < 239)
    {
      y--;
      if ( y >= 1 && y <= 7) {
        pageflip.play();
        pageflip.rewind();
      }
      if (y == 0) {
        y = 1;
      }
    }
  }

  void hoverMenu() {
    if (mouseX > 55 && mouseX < 163 && mouseY > 742 && mouseY < 777) {
      fill(138, 7, 7);
      text("Go back", 50, 772);
    }
  }
}

class Achievements {
  PImage achievement;
  PImage achievement1;
  PImage achievement2;
  PImage achievement3;
  PImage achievement4;
  PImage achievement5;
  PImage achievement6;
  PImage achievement7;
  PImage achievement8;
  boolean achievement1V;
  boolean achievement2V;
  boolean achievement3V;
  boolean achievement4V;
  boolean achievement5V;
  boolean achievement6V;
  boolean achievement7V;
  boolean achievement8V;

  Achievements() {
    achievement = loadImage("achievents_uncomplete.png");
    achievement1 = loadImage("end_achievement.png");
    achievement2 = loadImage("lightbringer_achievement.png");
    achievement3 = loadImage("portraits_achievement.png");
    achievement4 = loadImage("diary_achievement.png");
    achievement5 = loadImage("lore_achievement.png");
    achievement6 = loadImage("war_achievement.png");
    achievement7 = loadImage("pyre_achievement.png");
    achievement8 = loadImage("keys_achievement.png");
  }
  void achievements() {
    achievement.resize(1280, 800);
    background(achievement);

    // Geef een achievement weer als deze al dan niet behaald is
    if (achievement1V) {
      image(achievement1, 112, 312);
    }
    if (achievement2V) {
      image(achievement2, 241, 572);
    }
    if (achievement3V) {
      image(achievement3, 422, 312);
    }
    if (achievement4V) {
      image(achievement4, 548, 572);
    }
    if (achievement5V) {
      image(achievement5, 664, 312);
    }
    if (achievement6V) {
      image(achievement6, 798, 572);
    }
    if (achievement7V) {
      image(achievement7, 924, 312);
    }
    if (achievement8V) {
      image(achievement8, 1093, 572);
    }
    achievementCheck();
    fill(255, 255, 255);
    text("Go back", 50, 772);
    hoverMenu();
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {

    if (mouseX > 55 && mouseX < 163 && mouseY > 742 && mouseY < 777) {
      kamer = 23;
    }
  }
  //checkt of de achievements vervult zijn
  void achievementCheck() {
    if (portrait.locked1 && portrait.locked2 && portrait.locked3 && portrait.locked4 && portrait.locked5 && portrait.locked6
      && portrait.locked7 && portrait.locked8 && portrait.locked9 && portrait.locked10 && portrait.locked11 && portrait.locked12) {
      achievement3V = true;
    }
    if (diary.diaryEntry1 && diary.diaryEntry2 && diary.diaryEntry3 && diary.diaryEntry4 && diary.diaryEntry5 && diary.diaryEntry6 && diary.diaryEntry7) {
      achievement4V = true;
    }
    if (lorebook.lore01 && lorebook.lore02 && lorebook.lore03 && lorebook.lore04 && lorebook.lore05 && lorebook.lore06 && lorebook.lore07 && lorebook.lore08) {
      achievement5V = true;
    }
    if (inventory.warNote1V && inventory.warNote2V && inventory.warNote3V && inventory.warNote4V) {
      achievement6V = true;
    }
    if (inventory.amuletOf6V) {
      achievement8V = true;
    }
  }
  void hoverMenu() {

    if (mouseX > 55 && mouseX < 163 && mouseY > 742 && mouseY < 777) {
      fill(138, 7, 7);
      text("Go back", 50, 772);
    }
  }
}