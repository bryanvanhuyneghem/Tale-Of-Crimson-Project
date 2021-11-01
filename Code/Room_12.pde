class Room12 {
  PImage room12;
  PImage arrow;
  PImage scary;
  boolean flashing;
  boolean flik;
  boolean once = true;
  int time;
  int stopFlash;
  int timer1;
  Room12() {
    scary = loadImage("Scary.jpg");
    room12 = loadImage("Room 12 - Path_of_Truth.jpg");
    arrow =  loadImage("ARROWDOWN.png");
  }
  void RoomLoad() {
    isRepeating = true;
    background(room12);
    fill(255);
    textAlign(CENTER);
    textFont(font1);
    text("Cleared", 1040, 50);
    textAlign(BASELINE);
    fill(138, 7, 7);

    // Flash een image
    if (flashing && once) {
      if  (flik) {
        image (scary, 0, 0);
      }
      if (!flik) {
        background(0);
      }
      if (millis()/100 > time) {
        flik = !flik;
        time= time + 1;
        if (stopFlash + 4 == time) {
          flashing = false;
          once = false;
        }
      }
    }

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800) {
      image (arrow, 90, 670, 420/5, 600/5);
    }

    // Display de naam van de kamer 
    if (millis () - timer1 < 6000) {
      fill(255);
      textAlign(CENTER);
      text("Path of Truth", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Toon het hintsymbool rechts boven op het scherm
    if (difficulty.hints) {
      image(hintIcon, 1201, 19);
    }

    // Laad de timer
    timer();

    // Laad de standaard cursor
    cursor(cursor1, 5, 5);
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    if (mouseX > 651  && mouseX <788 && mouseY > 336 && mouseY < 438 ) {
      kamer = 13;
      room13.timer1 = millis();
    }
    if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800) {
      kamer = 11;
      room11.timer1 = millis();
    }
  }
}