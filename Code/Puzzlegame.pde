class Puzzlegame {
  PImage arrow;
  PImage puzzleFound;
  PImage puzzleUnfound;
  PImage puzzlePlay;
  String loadText;
  int timer1;
  int timer2;
  int timer3;
  boolean puzzleFounded;
  boolean puzzleSolved;
  boolean once1 = true;
  boolean once2 = true;
  boolean once3 = true;
  boolean once = true;

  Puzzlegame() {
    state = "ShowGame";
    arrow = loadImage ("ARROWDOWN.png");
    puzzlePlay = loadImage("puzzle_background_nobox.png");
    puzzleFound = loadImage("puzzle_background_box.png");
    puzzleUnfound  = loadImage("puzzle_background_nobox.png");
    puzzleFound = loadImage("puzzle_background_box.png");
  }

  // Controleer of de puzzle box gevonden is en toon verschillende achtergronden van de tafel
  void puzzlegame() {
    println(timer3);
    if (room5.showPuzzleBox) {
      background(puzzleUnfound);
      if (once1) {
        loadText = "table";
        timer2 = millis();
        once1 = false;
      }
    } else if (!room5.showPuzzleBox) {
      background(puzzleFound);
      if (once2) {        
        loadText = "table2";
        timer2 = millis();
        once2 = false;
      }
      if (puzzleFounded)
      {
        background(puzzlePlay);
        textAlign(CENTER);
        textSize(24);
        textFont(font2);  
        rectMode(CENTER);
        switch(state) {
        case "ShowGame":
          if (once) {
            newScreen = new Screens();
            once =false;
            room5.start = true;
          }
          newScreen.showGame();
          break;
        case "ShowEnd":
          newScreen.showEnd();
          puzzleSolved = true;
          break;
        }
        rectMode(CORNER);
        textAlign(CORNER);
      }
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis () - timer2 < 5000) {
      showText();
    }

    // Toont een pijl op een bepaalde plaats op het scherm
    image(arrow, 90, 650, 420/5, 600/5);

    // Laad de timer
    timer();
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck()
  {
    if (mouseX > 104  && mouseX < 180 && mouseY > 651 && mouseY < 775) {
      kamer = 5;
    }
    if (mouseX > 564 && mouseX < 657 && mouseY > 321 && mouseY < 435 && !room5.showPuzzleBox)
    {
      inventory.puzzleBoxV = false;
      puzzleFounded = true;
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
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