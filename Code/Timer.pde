class Timer {
  int secondsPuzzle;
  int secMax;
  int secMin;
  int savedMS;   
  int currentMS;

  Timer(int minimum, int maximum, int saveBit) {
    secMin = minimum;
    secMax = maximum;
    savedMS = saveBit;
    currentMS = millis();
  }

  // Aftellen tijd
  void counter(int currentTime) {

    currentMS = currentTime;
    secondsPuzzle = secMax-(currentMS - savedMS)/1000;

    textAlign(CENTER);
    noStroke();
    fill(255);
    rect(630, 170, 300, 50);
    fill(0);
    text("Time Left: "+secondsPuzzle, 630, 170);
    fill(138, 7, 7);
  }

  // Reset de tijd
  void reset(int currentTime) {
    secondsPuzzle = secMax;
    savedMS = currentTime;
  }

  // Verstuurt de huidige seconden
  int sendSeconds() {
    return secondsPuzzle;
  }

  // Verstuur het minimum vereiste seconden 
  int sendMin() {
    return secMin;
  }
}