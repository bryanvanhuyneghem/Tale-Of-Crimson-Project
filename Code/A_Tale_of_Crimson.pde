import ddf.minim.*;
import processing.video.*;
Minim minim;
Movie movie;
AudioPlayer pause;
AudioPlayer doorKnock;
AudioPlayer lockedChest;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song5;
AudioPlayer song6;
AudioPlayer song7;
AudioPlayer song1room4;
AudioPlayer song2room4;
AudioPlayer song3room4;
AudioPlayer song1room15;
AudioPlayer song1room16; 
AudioPlayer torchSound;
AudioPlayer quill;
AudioPlayer treasure;
AudioPlayer buttonPress;
AudioPlayer openChest;
AudioPlayer maria;
AudioPlayer pageflip;
AudioPlayer puzzleSound;
AudioPlayer diaryLore;
AudioPlayer whisper;
AudioPlayer switchSound;
AudioPlayer woodenDoor;
AudioPlayer scaryChoir;
AudioPlayer scarySound1;
AudioPlayer scarySound2;
AudioPlayer scarySound3;
AudioPlayer scarySound4;
AudioPlayer scarySound5;
AudioPlayer scarySound6;
AudioPlayer scarySound7;
AudioPlayer portalSound;
AudioPlayer wine;
AudioPlayer thunder;
AudioPlayer demon;
AudioPlayer cured;
AudioPlayer amuletSound;
AudioPlayer anvilSound;
AudioPlayer solvedSound;
AudioPlayer scroll;
AudioPlayer ink;
AudioPlayer shieldSlam;
AudioPlayer keySound;
AudioPlayer vialSound;
AudioPlayer openWall1;
AudioPlayer furnaceSound;
AudioPlayer lampSound;
AudioPlayer crimsonSound;
AudioPlayer diffSelect;
final int ShowGame = 2;
final int ShowEnd = 3;
PFont font1;
PFont font2;
PImage cursor1;
PImage cursor2;
PImage cursor3;
PImage cursor4;
PImage cursor5;
PImage cursor6;
PImage cursor7;
PImage inventoryIcon;
PImage titleIcon;
PImage hintIcon;
PImage timer1;
PImage timer2;
PImage cover;
PImage cross;
String time0 = "1000";
String time1 = "1000";
String time2 = "1000";
int currentRoom;
int kamer = 0;
int hour = 02;
int minutes = 00;
int startSeconds = 00;
int seconds;
int countdown;
int ss;
float transparency = 255;
boolean timer;
boolean timerPause;
boolean isRepeating;
Achievements achievements;
String state;
Instructions instructions;
Diary diary;
Lorebook lorebook;
Portrait portrait;
Inventory inventory;
Startmenu startmenu;
Pausemenu pausemenu;
Difficulty difficulty;
Credits credits;
Screens newScreen;
Puzzlegame puzzlegame;
Room20 room20;
Room19 room19;
Room18 room18;
Room17 room17;
Room16 room16;
Room15 room15;
Room14 room14;
Room13 room13;
Room12 room12;
Room11 room11;
Room10 room10;
Room9 room9;
Room8 room8;
Room7 room7;
Room6 room6;
Room5 room5;
Room4 room4;
Room3 room3;
Room2 room2;
Room1 room1;

// Start de game en teken het venster van de game
void setup() {
  size(1280, 800);
  frameRate(60);
  surface.setTitle( "A Tale of Crimson" );
  titleIcon = loadImage("lightbringer_origineel.png");
  cover = loadImage("Cover.png");
  image(cover, 0, 0);
  surface.setIcon(titleIcon);
  minim = new Minim(this);
  song1 = minim.loadFile("credits1song.mp3");
  song3 = minim.loadFile("backgroundmusic.mp3");
  song3.pause();
  song1.play();
}  

// Laad muziek en kamers
void draw() {
  // De methodes binnen de boolean worden maar één keer geladen
  if (frameCount <= 1) {
    pause = minim.loadFile("pausesound.mp3");
    song2 = minim.loadFile("laugh.mp3");
    pageflip = minim.loadFile("pageflipsound.mp3");
    puzzleSound = minim.loadFile("puzzlesound.mp3");
    diaryLore = minim.loadFile("diaryloresound.mp3");
    whisper = minim.loadFile("whisperingsound.mp3");
    switchSound = minim.loadFile("switchsound.mp3");
    woodenDoor = minim.loadFile("woodendoorsound.mp3");
    scaryChoir = minim.loadFile("scarychoir.mp3");
    scarySound1 = minim.loadFile("scarysound1.mp3");
    scarySound2 = minim.loadFile("scarysound2.mp3");
    scarySound3 = minim.loadFile("scarysound3.mp3");
    scarySound4 = minim.loadFile("scarysound4.mp3");
    scarySound5 = minim.loadFile("scarysound5.mp3"); 
    scarySound6 = minim.loadFile("scarysound6.mp3");
    scarySound7 = minim.loadFile("scarysound7.mp3");
    song3 = minim.loadFile("backgroundmusic.mp3");
    lampSound = minim.loadFile("lampsound.mp3");
    quill = minim.loadFile("scribble_sound.mp3");
    doorKnock = minim.loadFile("Door_Knock.mp3");
    buttonPress = minim.loadFile("buttonpress.mp3");
    treasure = minim.loadFile("treasure6keyssound.mp3");
    song5 = minim.loadFile("Tearing_paper.mp3");
    song6 = minim.loadFile("I_am_Death.wav");
    song7 = minim.loadFile("candles_lit_creak.wav");
    song1room4 = minim.loadFile("vampirehiss.mp3");
    song2room4 = minim.loadFile("Demon01.mp3");
    song3room4 = minim.loadFile("sworddraw.wav");
    wine = minim.loadFile("wine_pouring.mp3");
    anvilSound = minim.loadFile("anvilsound.mp3");
    demon = minim.loadFile("demon_hiss.mp3");
    diffSelect = minim.loadFile("difficulty_select_sound.mp3");
    openChest = minim.loadFile("Open_Chest.mp3");
    cured = minim.loadFile("ritual_solved.mp3");
    lockedChest = minim.loadFile("Locked_Chest.wav");
    torchSound = minim.loadFile("torchsound.mp3");
    song1room15 = minim.loadFile("waterfootsteps.mp3");
    song1room16 = minim.loadFile("waterfootsteps2.mp3");
    amuletSound = minim.loadFile("amuletsound.mp3");
    thunder = minim.loadFile("thunder.wav");
    maria = minim.loadFile("sliding_room07.mp3");
    portalSound = minim.loadFile("portal_sound.wav");
    solvedSound = minim.loadFile("ritual_solved.mp3");
    ink = minim.loadFile("inkdrip.mp3");
    scroll = minim.loadFile("scrollsound.wav");
    shieldSlam = minim.loadFile("shieldslam.wav");
    keySound = minim.loadFile("keysound.wav");
    vialSound = minim.loadFile("vialsound.mp3");
    furnaceSound = minim.loadFile("furnacesound.mp3");
    openWall1 = minim.loadFile("daggerwall.mp3");
    crimsonSound = minim.loadFile("crimsonsound.mp3");
    font1 = loadFont("Chiller-Regular-50.vlw");
    font2 = loadFont("Candara-28.vlw");
    inventoryIcon = loadImage("inventory_icon.png");
    hintIcon = loadImage("hint_icon.png");
    timer1 = loadImage("timer_01.png");
    timer2 = loadImage("timer_02.png");
    cursor1 = loadImage("cursor.png");
    cursor2 = loadImage("hand_cursor.png");
    cursor3 = loadImage("curse_protected_icon.png");
    cursor4 = loadImage("ritual_hand.png");
    cursor5 = loadImage("torch_cursor.png");
    cross = loadImage("cross.png");
    movie = new Movie(this, "Creditsmovie.mp4");
    instructions = new Instructions();
    achievements = new Achievements();
    lorebook = new Lorebook();
    diary = new Diary();
    inventory = new Inventory();
    portrait = new Portrait();
    startmenu = new Startmenu();
    pausemenu = new Pausemenu();
    puzzlegame = new Puzzlegame();
    difficulty = new Difficulty();
    credits = new Credits();
    room20 = new Room20();
    room19 = new Room19();
    room18 = new Room18();
    room17 = new Room17();
    room16 = new Room16();
    room15 = new Room15();
    room14 = new Room14();
    room13 = new Room13();
    room12 = new Room12();
    room11 = new Room11();
    room10 = new Room10();
    room9 = new Room9();
    room8 = new Room8();
    room7 = new Room7();
    room6 = new Room6();
    room5 = new Room5();
    room4 = new Room4();
    room3 = new Room3();
    room2 = new Room2();
    room1 = new Room1();
  } else {
    // Dit gedeelte binnen de draw() methode wordt continu geladen

    // Laad de timer
    timer();
    if (!(kamer == 23 || kamer == 24 || kamer == 25 || kamer == 26 || kamer == 27 || kamer == 28 || kamer == 29)) {
      currentRoom = kamer;
    }  

    // De constructors van de klassen worden gelinkt met een nummer
    switch (kamer) {
    case 0:
      startmenu.menu();
      break;
    case 1: 
      room1.RoomLoad(); 
      break;
    case 2: 
      room2.RoomLoad(); 
      break;
    case 3: 
      room3.RoomLoad(); 
      break;
    case 4: 
      room4.RoomLoad(); 
      break;
    case 5: 
      room5.RoomLoad(); 
      break;
    case 6: 
      room6.RoomLoad(); 
      break;
    case 7: 
      room7.RoomLoad(); 
      break;
    case 8: 
      room8.RoomLoad(); 
      break;
    case 9: 
      room9.RoomLoad(); 
      break;
    case 10: 
      room10.RoomLoad(); 
      break;
    case 11: 
      room11.RoomLoad(); 
      break;
    case 12: 
      room12.RoomLoad(); 
      break;
    case 13: 
      room13.RoomLoad(); 
      break;
    case 14: 
      room14.RoomLoad(); 
      break;
    case 15: 
      room15.RoomLoad(); 
      break;
    case 16: 
      room16.RoomLoad(); 
      break;
    case 17: 
      room17.RoomLoad(); 
      break;
    case 18: 
      room18.RoomLoad(); 
      break;
    case 19: 
      room19.RoomLoad(); 
      break;
    case 20: 
      room20.RoomLoad(); 
      break;
    case 21: 
      credits.credits(); 
      break;
    case 22: 
      puzzlegame.puzzlegame();
      break;
    case 23: 
      inventory.inventory();
      break;
    case 24: 
      pausemenu.pauseMenu();
      break;
    case 25: 
      portrait.portrait();
      break;
    case 26: 
      lorebook.lorebook();
      break;
    case 27: 
      diary.diary();
      break;
    case 28:
      achievements.achievements();
      break;
    case 29:
      difficulty.difficulty();
      break;
    case 30:
      instructions.instructions();
    }
    if (!(kamer == 23 || kamer == 22 || kamer == 21 || kamer == 0 || kamer == 24 || kamer == 25 || kamer == 26 || kamer == 27 || kamer == 28 || kamer == 29 || kamer == 30)) {
      image (inventoryIcon, 1130, 691, 111, 95);
    }
    textFont(font1);
    gameOver();

    // Dit zorgt ervoor dat de muziek in de game op repeat komt als deze is beïndigd
    if (isRepeating && !inventory.mute)
    {
      if (!song3.isPlaying() && !(kamer == 23))
      {
        song3.rewind();
        song3.play();
      }
      if (!song3.isPlaying() && (kamer == 23)) 
      {
        song3.play();
      }
    }
  }
}

// Pauzeer de timer
void pause() {
  startSeconds =  seconds ; 
  seconds = seconds + 0;
  minutes = minutes + 0;
  ss = int(millis()/1000);
}

// Initialiseer de timer 
void timer() {
  textFont(font1);
  countdown = int(millis()/1000) - ss;
  if (timerPause) {
    pause();
  } else {
    if (timer) { 
      ss= ss + 0 ;
      seconds = startSeconds-countdown;
    } else {
      seconds = startSeconds; 
      ss = int(millis()/1000);
    }
    time0 = nf(hour, 2);
    time1 = nf(minutes, 2);
    time2 = nf(seconds, 2);
    if (minutes == 0 && seconds == 0) {
      minutes += 60;
      hour --;
    }
    if (seconds <= 0) {
      startSeconds+=59;
      minutes--;
    }
  }
  noFill();
  textSize(50);
  if (minutes == 29 && hour == 00 )
  {
    timer1 = timer2;
  }
  image(timer1, 10, 10, 70/2, 80/2);
  text(time0 + ":" + time1 + ":" + time2, 50, 50);
}

// Als de tijd om is, stopt de game
void gameOver() {
  if (minutes == 59 && seconds == 59 && hour == -01 && kamer != 0) {
    song3.pause();
    song1.pause();
    song2.play();
    timerPause = true;
    background(0);
    textAlign(CENTER);
    fill(138, 7, 7);
    textSize(70);
    text("You've died...", 640, 300);
    textSize(50);
    text("Game over", 640, 450);
    textAlign(CORNER);
    if (mouseX > 51 && mouseX < 291 && mouseY > 742 && mouseY < 777) {
      fill(138, 7, 7);
      text("Go to startmenu", 50, 772);
    } else {
      fill(255, 255, 255);
      text("Go to startmenu", 50, 772);
      song3.pause();
    }
    if (mousePressed && mouseX > 51 && mouseX < 291 && mouseY > 742 && mouseY < 777) {
      kamer = 0;
      minutes = 00;
      seconds = 00;
      hour = 02;
      setup();
      frameCount = 0;
    }
  }
}

// Zorgt voor klikinteracties van de gebruiker
void mousePressed() {
  if ((!(kamer == 23 || kamer == 22 || kamer == 21 || kamer == 0 || kamer == 24 || kamer == 25 || kamer == 26 || kamer == 27 || kamer == 28 || kamer == 29)) && (mouseX > 1130 && mouseX <1241 && mouseY > 691 && mouseY < 790)) {
    kamer = 23;
  }

  // De klikmethodes van de verschillende klassen worden gelinkt met een nummer
  switch (kamer) {
  case 0: 
    startmenu.keyCheck();
    break;
  case 1: 
    room1.keyCheck(); 
    break;
  case 2: 
    room2.keyCheck(); 
    break;
  case 3: 
    room3.keyCheck(); 
    break;
  case 4: 
    room4.keyCheck(); 
    break;
  case 5: 
    room5.keyCheck(); 
    break;
  case 6: 
    room6.keyCheck(); 
    break;
  case 7: 
    room7.keyCheck(); 
    break;
  case 8: 
    room8.keyCheck(); 
    break;
  case 9: 
    room9.keyCheck(); 
    break;
  case 10: 
    room10.keyCheck(); 
    break;
  case 11: 
    room11.keyCheck(); 
    break;
  case 12: 
    room12.keyCheck(); 
    break;
  case 13: 
    room13.keyCheck(); 
    break;
  case 14: 
    room14.keyCheck(); 
    break;
  case 15: 
    room15.keyCheck(); 
    break;
  case 16: 
    room16.keyCheck(); 
    break;
  case 17: 
    room17.keyCheck(); 
    break;
  case 18: 
    room18.keyCheck(); 
    break;
  case 19: 
    room19.keyCheck(); 
    break;
  case 20: 
    room20.keyCheck(); 
    break;
  case 21:
    credits.keyCheck();
    break;
  case 22:
    puzzlegame.keyCheck();
    break;
  case 23: 
    inventory.keyCheck();
    break;
  case 25: 
    portrait.keyCheck();
    break;
  case 26: 
    lorebook.keyCheck();
    break;
  case 27: 
    diary.keyCheck();
    break;
  case 28: 
    achievements.keyCheck();
    break;
  case 29:
    difficulty.keyCheck();
    break;
  case 30:
    instructions.keyCheck();
  }
}

// Controleer of de speler de game wil pauzeren of de inventory wil openen door op een bepaalde toets te drukken
void keyPressed () {
  if (key == 'P' || key == 'p' && !(kamer == 23 || kamer == 21 || kamer == 0 || kamer == 24 || kamer == 30 || kamer == 29)) {
    pausemenu.pauseMenu();
    kamer = 24;
  } else if (key == 'P' || key == 'p' && kamer == 24) {
    kamer = currentRoom;
    timerPause = false;
    pause.play();
    pause.rewind();
  } 
  if (key == 'I' ||key == 'i' && !(kamer == 21 || kamer == 0 ||kamer == 24 ||kamer == 30 || kamer == 29)) {  
    kamer = 23;
  } else if (key == 'I' || key == 'i'  && kamer == 23) {
    kamer = currentRoom;
    timerPause = false;
  } 
  if (key == ESC) {
    key = 0;
  }
}

// Deze methode checkt of er een nieuwe frame van de video beschikbaar is
void movieEvent(Movie movie) {
  movie.read();
}