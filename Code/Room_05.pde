class Room5 {
  PImage room5;
  PImage arrow;
  PImage arrow2;
  PImage eden;
  PImage painting1;
  PImage painting2;
  PImage painting3;
  PImage painting4;
  PImage painting5;
  PImage puzzlebox;
  PImage hint5_1;
  PImage hint5_2;
  boolean edenBook = true;
  boolean showPainting1;
  boolean showPainting2;
  boolean showPainting3;
  boolean showPainting4;
  boolean showPainting5;
  boolean showPuzzleBox = true;
  boolean once = true;
  boolean hint;
  boolean start;
  String loadText;
  int timer1;
  int timer2;
  int x;

  Room5() {
    room5 = loadImage("Room 05 - Master_bedroom.jpg");
    arrow = loadImage ("ARROWDOWN.png");
    arrow2 = loadImage ("ARROWLEFT.png");
    eden = loadImage ("diary_of_eden.png");
    painting1 = loadImage("Eden_portrait.png");
    painting2 = loadImage("Olivia1_portrait.png");
    painting3  = loadImage("Vlad_portrait.png");
    painting4 = loadImage("Crimson2_portrait.png");    
    painting5 = loadImage("Marcus_portrait.png");
    puzzlebox = loadImage("Puzzle_box.png");
    hint5_1 = loadImage("hint5.1.png");
    hint5_2 = loadImage("hint5.2.png");
  }

  void RoomLoad() {
    isRepeating = true;
    background(room5);

    // Toont het object op het scherm - afhankelijk of deze al dan niet aanwezig is in de inventory
    if (edenBook) {
      image(eden, 840, 670, 96/2, 90/2);
    }

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 105  && mouseX < 130 && mouseY > 695 && mouseY < 795) {
      image(arrow, 65, 680, 420/5, 600/5);
    }
    if (mouseX > 69  && mouseX <290 && mouseY > 91 && mouseY < 607) {
      image (arrow2, 146, 384, 420/4, 600/7);
    }

    // Display de naam van de kamer 
    if (millis () - timer1 < 6000) {
      fill(255);
      textAlign(CENTER);
      text("Master bedroom", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Geef de puzzle box weer
    if (showPuzzleBox) {
      image (puzzlebox, 505, 590, 20, 20);
    }

    // Display portraits (= paintings)
    if (showPainting1) {
      image (painting1, 320, 10, 600, 780);
    }
    if (showPainting2) {
      image (painting2, 320, 10, 600, 780);
    }
    if (showPainting3) {
      image (painting3, 320, 10, 600, 780);
    }
    if (showPainting4) {
      image (painting4, 320, 10, 600, 780);
    }
    if (showPainting5) {
      image(painting5, 320, 10, 600, 780);
    }

    // Controleer voorwaarden cleared
    if (difficulty.room_cleared && !edenBook && puzzlegame.puzzleSolved) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("Cleared", 1040, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
      hint = false;
    }

    // Hints 1 en 2
    if (hint && difficulty.hints && x == 1) {
      imageMode(CENTER);
      image(hint5_1, 640, 100);
      imageMode(CORNER);
    }
    if (hint && difficulty.hints && x == 2) {
      imageMode(CENTER);
      image(hint5_2, 640, 100);
      imageMode(CORNER);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis () - timer2 < 5000) {
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
    if (!(showPainting1|| showPainting2 || showPainting3 || showPainting4|| showPainting5 ))
    {
      if (mouseX > 840  && mouseX <895 && mouseY > 675 && mouseY <713 && edenBook) {
        diaryLore.play();
        loadText = "eden";
        inventory.diaryOfEdenV = true;
        edenBook = false;
        timer2 = millis();
      }
      
      // Wissel van kamer
      if (mouseX > 105  && mouseX < 130 && mouseY > 695 && mouseY < 795) {
        kamer = 3;
        hint = false;
        room3.timer1 = millis();
        timer2 = 0;
      }
      if (mouseX > 69  && mouseX <290 && mouseY > 91 && mouseY < 607) {
        kamer = 6;
        room6.timer1 = millis();
        hint = false;
        timer2 = 0;
        scarySound5.play();
        scarySound5.rewind();
      }
      
      if (mouseX > 510  && mouseX <530 && mouseY > 595 && mouseY < 610 && showPuzzleBox) {
        loadText = "puzzlebox";
        showPuzzleBox = false;
        inventory.puzzleBoxV = true;
        puzzleSound.play();
        timer2 = millis();
      }
      
      // Start de puzzle game
      if (mouseX > 947  && mouseX <1116 && mouseY > 593 && mouseY < 620 && !puzzlegame.puzzleSolved) {
        if (start) {
          puzzlegame.once = true;
        }
        hint = false;
        kamer = 22;
        timer2 = 0;
      }
    }
    
    // Geef portraits (= paintings) weer; controleer of de portraits (= paintings) openstaan en zet de tijd op pauze
    if (mouseX > 340 && mouseX <355 && mouseY > 284 && mouseY <350 ) {
      switchSound.play();
      switchSound.rewind();
      showPainting1 = true;
      portrait.locked6 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting1 = false;
    }
    if (mouseX > 325  && mouseX <353 && mouseY > 405 && mouseY <466) {
      switchSound.play();
      switchSound.rewind();
      showPainting2 = true;
      portrait.locked7 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting2 = false;
    }
    if (mouseX > 395  && mouseX <412 && mouseY > 375 && mouseY <425 ) {
      switchSound.play();
      switchSound.rewind();
      showPainting3 = true;
      portrait.locked8 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791 )) {
      showPainting3 = false;
    }
    if (mouseX > 445 && mouseX <460 && mouseY > 335 && mouseY <377 ) {
      switchSound.play();
      switchSound.rewind();
      showPainting4= true;
      portrait.locked9 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting4= false;
    }
    if (mouseX > 435  && mouseX <465 && mouseY > 415 && mouseY <466 ) {
      switchSound.play();
      switchSound.rewind();
      showPainting5 = true;
      portrait.locked10 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791 )) {
      showPainting5 = false;
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
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "eden" :
      text("“This is Eden’s diary, but pages seem to be missing.”", 640, 785);
      break;
    case "puzzlebox" :
      text("You acquire an unusual puzzle box. Use the table in this room to solve it.", 640, 785);
      break;
    case "table" :
      text("“I should look for a puzzle box to solve.”", 640, 785);
      break;
    case "table2" :
      text("You sit down and attempt to solve the puzzle box.", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}