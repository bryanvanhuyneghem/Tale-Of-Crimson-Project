class Puzzle {
  int value;
  int xpos;
  int ypos;
  int w; 
  int h;
  color col;

  Puzzle(int val, int xval, int yval, int wide, int high, color c) {
    value = val;
    xpos = xval;
    ypos = yval;
    col = c;
    w = wide;
    h = high;
  }

  // Geef het puzzelstuk een nieuwe positie
  void storePos(int xval, int yval) {
    xpos = xval;
    ypos = yval;
  }


  // Verstuur de x-positie van het puzzelstuk
  int sendX() {
    return xpos;
  }

  // Verstuur de y-positie van het puzzelstuk
  int sendY() {
    return ypos;
  }

  // Teken het puzzelstuk
  void create() {
    noStroke();
    fill(col);
    rect(xpos, ypos, w, h, 7);
    fill(255);
    text(value+1, xpos, ypos);
  }
}