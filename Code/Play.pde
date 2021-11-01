class Play {
  Puzzle[] pieces = new Puzzle[9];
  color[] cVal = {color(255, 0, 55), color(223, 0, 83), color(195, 0, 111), color(167, 0, 139), color(139, 0, 167), color(111, 0, 195), color(83, 0, 223), color(55, 0, 255), color(255, 255, 255)};
  boolean[] numSolved = {false, false, false, false, false, false, false, false, false};
  int[] location = {0, 0, 0, 0, 0, 0, 0, 0, 0};
  int[] locX = {530, 630, 730, 530, 630, 730, 530, 630, 730};
  int[] locY = {280, 280, 280, 380, 380, 380, 480, 480, 480};
  int i, u, o, tempX, tempY;

  Play() {   
    for (i=0; i<9; i++) {
      pieces[i] = new Puzzle(i, locX[i], locY[i], 98, 98, cVal[i]);
      pieces[i].create();
    }
  }


  //Shuffle de locaties van de puzzelstukken
  void shuffle() {
    u = 0;

    for (i=0; i<9; i++) {
      location[i] = 0;
    }  
    i=0;

    // Shuffle
    while (i<9) {
      u = int(random(0, 9));
      if (location[u]==0) {
        pieces[i].storePos(locX[u], locY[u]);
        location[u] = 1;
        i++;
      }
    }

    //Reset
    for (i=0; i<9; i++) {
      pieces[i].create();
    }
  }

  // Verplaats een puzzelstuk
  void movePiece(int i) {
    if ( checkMove(pieces[8].sendX(), pieces[8].sendY(), pieces[i].sendX(), pieces[i].sendY() ) ) {

      tempX = pieces[8].sendX();
      tempY = pieces[8].sendY();
      pieces[8].storePos(pieces[i].sendX(), pieces[i].sendY());
      pieces[i].storePos(tempX, tempY);
      pieces[8].create();
      pieces[i].create();
    }
  }

  // Controleer of de puzzel opgelost is
  boolean checkSolved() {
    int u=0;
    for (int i=0; i<9; i++) {
      if ( pieces[i].sendX()==locX[i] && pieces[i].sendY()==locY[i] ) {
        numSolved[i]=true;
        u++;
      }
    }
    if (u==9) {
      return true;
    } else {
      return false;
    }
  }

  // Controleer of een puzzelstuk kan bewegen
  boolean checkMove(int x8, int y8, int xi, int yi) {
    if ( xi==x8 && ( (yi-100)==y8 || (yi+100==y8) ) ) {
      return true;
    } else if ( yi==y8 && ( (xi-100)==x8 || (xi+100==x8) ) ) {
      return true;
    } else {
      return false;
    }
  }

  // Controleer of de cursor over een puzzelstuk hovert
  boolean checkMouse(int i) {
    if (mouseX>=pieces[i].sendX()-50 && mouseX<=pieces[i].sendX()+50 && mouseY>=pieces[i].sendY()-50 && mouseY<=pieces[i].sendY()+50 && cVal[i]!=color(255, 255, 255)) {
      return true;
    } else {
      return false;
    }
  }

  // Toon puzzelstukken
  void showPieces() {
    for (i=0; i<9; i++) {
      pieces[i].create();
    }
  }
}