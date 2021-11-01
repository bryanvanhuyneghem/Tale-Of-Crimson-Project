// De speler kiest zijn moeilijkheidsgraad
class Difficulty {
  PImage bg1, bg2, bg3;
  boolean backg1, backg2 = true, backg3;
  boolean hints;
  boolean room_cleared = true;
  boolean cursor;
  String loadText;
  int timer2;
  String versie;

  Difficulty() {
    bg1 = loadImage("difficulty_novice.png");
    bg2 = loadImage("difficulty_seasonedgamer.png");
    bg3 = loadImage("difficulty_hardcore.png");
  }

  void difficulty() {
    if (backg1) {
      background(bg1);
    } else if (backg2) {
      background(bg2);
    } else if (backg3) {
      background(bg3);
    }

    // Geeft een torch als cursor weer wanneer over een bepaalde plaats wordt gehoverd
    if (cursor) {
      cursor(cursor5, 5, 5);
    }
    if (!cursor) {
      cursor(cursor1, 5, 5);
    }

    fill(255);
    textFont(font1);
    text("Continue", 543, 696);
    textFont(font1);
    text("Go back", 50, 750);
    hoverMenu();

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 < 5000) {
      showText();
    }
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    if (mouseX > 542 && mouseX < 701 && mouseY > 666 && mouseY < 705) {
      kamer = 30;
    }  
    if (mouseX > 399 && mouseX < 529 && mouseY > 325 && mouseY < 470) {
      loadText = "novice";
      timer2 = millis();
      diffSelect.play();
      diffSelect.rewind();
      backg1 = true;
      backg2 = false;
      backg3 = false;
      hints = true;
      room_cleared = true;
      versie = "novice";
    }  
    if (mouseX > 549 && mouseX < 678 && mouseY > 313 && mouseY < 497) {
      loadText = "seasoned_gamer";
      timer2 = millis();
      diffSelect.play();
      diffSelect.rewind();
      backg1 = false;
      backg2 = true;
      backg3 = false;
      hints = false;
      room_cleared = true;
      versie = "seasoned gamer";
    } 
    if (mouseX > 719 && mouseX < 900 && mouseY > 327 && mouseY < 559) {
      loadText = "hardcore";
      timer2 = millis();
      diffSelect.play();
      diffSelect.rewind();
      backg1 = false;
      backg2 = false;
      backg3 = true;
      hints = false;
      room_cleared = false;
      versie = "hardcore";
    }
    if (mouseX > 57 && mouseX < 320 && mouseY > 717 && mouseY < 760) {
      kamer = 0;
    }
  }

  void hoverMenu() {
    if ((mouseX > 399 && mouseX < 529 && mouseY > 325 && mouseY < 470) || (mouseX > 549 && mouseX < 678 && mouseY > 313 && mouseY < 497) || (mouseX > 719 && mouseX < 900 && mouseY > 327 && mouseY < 559)) {
      cursor = true;
    } else {
      cursor = false;
    }
    textFont(font1);
    fill(138, 7, 7);
    if (mouseX > 542 && mouseX < 701 && mouseY > 666 && mouseY < 705) {
      text("Continue", 543, 696);
    }
    if (mouseX > 57 && mouseX < 320 && mouseY > 717 && mouseY < 760) {
      text("Go back", 50, 750);
    }
    fill(255);
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "novice" :
      text("“Hints” and “Room-cleared” enabled.", 640, 785);
      break;
    case "seasoned_gamer" : 
      text("“Hints” disabled and “Room-cleared” enabled.", 640, 785);
      break;
    case "hardcore" : 
      text("“Hints” and “Room-cleared” disabled. You will not survive.", 640, 785);      
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}

// Er worden instructies getoond
class Instructions {
  PImage chooselanguage;
  PImage instructions1e;
  PImage instructions2e;
  PImage instructions1d;
  PImage instructions2d;
  int x = 1;

  Instructions() {
    chooselanguage = loadImage("chooselanguageimg.png");
    instructions1e = loadImage("instructions_english1.png");
    instructions2e = loadImage("instructions_english2.png");
    instructions1d = loadImage("instructions_nederlands1.png");
    instructions2d = loadImage("instructions_nederlands2.png");
  }
  
  void instructions() {
    if (x == 1) {
      background(chooselanguage);
      fill(255);
      text("Nederlands", 800, 470);
      text("English", 400, 470);
      text("Go back", 50, 750);
    }
    if (x == 2) {
      background(instructions1e);
      text("Go back", 50, 750);
    }    
    if (x == 3) {
      background(instructions2e);
    }    
    if (x == 4) {
      background(instructions1d);
      text("Go back", 50, 750);
    }    
    if (x == 5) {
      background(instructions2d);
    }
    hoverMenu();
  }
  void keyCheck() {
    if (mouseX > 57 && mouseX < 320 && mouseY > 717 && mouseY < 760 && x == 1) {
      kamer = 29;
    }
    if (mouseX > 57 && mouseX < 320 && mouseY > 717 && mouseY < 760 && (x == 4 || x == 2)) {
      x = 1;
    }
    if (mouseX > 800 && mouseX < 966 && mouseY > 438 && mouseY < 475 && x == 1) {
      x = x+3;
    }
    if (mouseX > 401 && mouseX < 508 && mouseY > 438 && mouseY < 475 && x == 1) {
      x++;
    }
    if (mouseX > 524 && mouseX < 770 && mouseY > 716 && mouseY < 785 && (x == 5 || x == 3)) {
      x--;
    } else if (mouseX > 524 && mouseX < 770 && mouseY > 716 && mouseY < 785 && (x == 4 || x == 2)) {
      x++;
    }
    if (mouseX > 486 && mouseX < 819 && mouseY > 500 && mouseY < 578 && (x == 5 || x == 3)) {
      kamer = 1;
      timer = true;
      timerPause = false;
      room1.timer1 = millis();
      song1.pause();
      song1.rewind();
      song3.play();
    }
  }
  void hoverMenu() {
    textFont(font1);
    fill(138, 7, 7);
    if (mouseX > 401 && mouseX < 508 && mouseY > 438 && mouseY < 475 && x == 1) {
      text("English", 400, 470);
    }
    if (mouseX > 800 && mouseX < 966 && mouseY > 438 && mouseY < 475 && x == 1) {
      text("Nederlands", 800, 470);
    }
    if (mouseX > 57 && mouseX < 320 && mouseY > 717 && mouseY < 760 && (x == 1 || x == 2 || x == 4)) {
      text("Go back", 50, 750);
    }
    fill(255);
  }
}