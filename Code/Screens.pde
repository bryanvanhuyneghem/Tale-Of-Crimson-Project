class Screens {
  Play game;
  Timer myTimer;
  boolean init = true;
  boolean once = true;
  int score;
  int timer2;
  int currentMS;

  Screens() {
    myTimer = new Timer(0, 120, millis());
    game = new Play();
    score = 0;
    init = true;
    game.shuffle();
  }

  // Toon het slotscherm
  void showEnd() {
    init = true;
    drawBlank();
    fill(255);
    text("The puzzle box slowly unlocks. Inside you find a dagger", 640, 360);
    fill(138, 7, 7);
    if (once) {    
      timer2 = millis();
      once = false;
    }
    if (millis() - timer2 > 5000) {
      kamer = 5;
    }
    inventory.daggerV = true;
    puzzlegame.puzzleSolved = true;
  }


  // Toon het scherm van de game
  void showGame() {
    if ( init == true ) {
      newScreen.drawBlank();
      init = false;
    }
    // Toon puzzelstukken
    game.showPieces();

    // Teken de ‘new puzzle’ knop
    fill(100);
    rect(630, 575, 200, 50);
    fill(255);
    text("New Puzzle", 630, 580);

    // Reset de game en tijd als je klikt op de ‘new puzzle’ knop
    if (mousePressed == true && mouseX > 533 && mouseX < 736 && mouseY > 552 && mouseY < 603) {
      game.shuffle();
      myTimer.reset(millis());
    }

    // Laat de tijd lopen en puzzelsteken beweegbaar zijn als de puzzel nog niet is opgelost
    if ( game.checkSolved()==false ) {
      myTimer.counter(millis()); 

      for (int i=0; i<9; i++) {
        if (mousePressed==true && game.checkMouse(i)==true ) {
          game.movePiece(i);
          fill(138, 7, 7);
        }
      }
    }

    // Reset de game en timer als de puzzel opgelost is
    if (game.checkSolved() == true) {
      showEnd();
    }

    // Reset de game en timer als de tijd om is
    if (myTimer.sendSeconds()<myTimer.sendMin() ) {
      game.shuffle();
      myTimer.reset(millis());
      score = 0;
    }
  }

  // Teken de achtergrond zonder puzzle box
  void drawBlank() {
    background(loadImage("puzzle_background_nobox.png"));
  }
}