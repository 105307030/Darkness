import processing.video.*;
import ddf.minim.*;
Movie story;
Minim minim;
AudioPlayer footstep;
AudioPlayer footstepriver;
AudioPlayer bgsound;
AudioPlayer monster;
AudioPlayer typhoonS;
AudioPlayer scream;
AudioPlayer opendoor;

//gamestate
final int GAME_START = 0, GAME_STORY1 = 1, GAME_STORY2 = 2, GAME_INTRO =5, GAME_RUN = 6, GAME_STORY3 = 7, GAME_WIN = 8, GAME_LOSE = 9;
int gameState = 0;

//playerstate
final int player_Down = 6, player_Up = 7, player_Left = 8, player_Right = 9;
int playerState=7;

//time
final int GAME_INIT_TIMER = 7200;
int gameTimer = GAME_INIT_TIMER;

//image
PImage playerUp, playerDown, playerLeft, playerRight, playerUp_left, playerUp_right, playerDown_left, playerDown_right, playerRight_left, playerRight_right, playerLeft_right, playerLeft_left;
PImage AttackImg, AttackDie, AttackAlive, ProtectImg, ProtectDie, ProtectAlive, FlashlightImg, FlashlightDie, FlashlightAlive, KeyImg, KeyDie, KeyAlive;
PImage floor, bg, bgBig, PoolImg, doorClose, doorOpen, TyphoonImg;
PImage gameStart, gameStory1, gameStory2, gameStory3, gameStory4, gameIntro, gameStory5, gameRun, gameWin, gameLose;
PImage startButton, startButton2, goButton, goButton2, restartButton, restartButton2;
PImage monsterImg1;
PImage AttackFire;
//press
boolean upPressed, downPressed, leftPressed, rightPressed = false;
boolean rightReleased;
boolean fireCheck=false;
boolean fireCheck2=false;
boolean attackAlive=true;
boolean ismoving=false;
boolean playerSpeedSlow=false;
boolean flashlightAlive=true;
boolean bgBigCheck=false;
boolean protectAlive=true;
boolean setCheck=false;
boolean monster1Alive=true;
boolean monster2Alive=true;
boolean monster3Alive=true;

//player
float playerX, playerY;
float playerInitialX=25;
float playerInitialY=625;
float playerSpeed=50;
int step;
float dS=0;
float dX=0;
float dY=0;
int screenX=0;
float gameIntroX=1500;
float gameIntroY=350;
//item
Attack attack;
Flashlight flashlight;
Protect protect;
Pool pool;
Typhoon typhoon;
Monster1 monster1;
Monster2 monster2;
Monster3 monster3;
float doorX =1650;
float doorY = 50;
float place=100;
float winCircle=0;
//monster
float monsterWidth=90, monsterHeight=90;
float monster1InitialX=random(400, 700);
float monster1InitialY=random(200, 500);
float monster1X= monster1InitialX;
float monster1Y= monster1InitialY;
float monster2InitialX=random(850, 1200);
float monster2InitialY=random(400, 600);
float monster2X= monster2InitialX;
float monster2Y= monster2InitialY;
float monster3InitialX=random(1300, 1600);
float monster3InitialY=random(100, 400);
float monster3X= monster3InitialX;
float monster3Y= monster3InitialY;
float TyphoonX=200;
float TyphoonY=400;

void setup() {
  size(1000, 700, P2D);


  background(255);
  //movie
  story =new Movie(this, "story.m4v");

  minim = new Minim(this);
  footstep = minim.loadFile("footstep.wav");
  footstepriver=minim.loadFile("footstepriver.wav");
  bgsound=minim.loadFile("bgsound.wav");
  monster=minim.loadFile("monster.wav");
  typhoonS=minim.loadFile("typhoon.wav");
  scream=minim.loadFile("scream.wav");
  opendoor=minim.loadFile("opendoor.mp3");


  playerUp=loadImage("img/playerUp.png");
  playerDown=loadImage("img/playerDown.png");
  playerRight=loadImage("img/playerRight.png");
  playerLeft=loadImage("img/playerLeft.png");
  playerUp_left=loadImage("img/playerUp_left.png");
  playerUp_right=loadImage("img/playerUp_right.png");
  playerDown_left=loadImage("img/playerDown_left.png");
  playerDown_right=loadImage("img/playerDown_right.png");
  playerRight_left=loadImage("img/playerRight_left.png");
  playerRight_right=loadImage("img/playerRight_right.png");
  playerLeft_left=loadImage("img/playerLeft_left.png");
  playerLeft_right=loadImage("img/playerLeft_right.png");
  AttackImg=loadImage("img/Attack.png");
  ProtectImg=loadImage("img/Protect.png");
  FlashlightImg=loadImage("img/Flashlight.png");
  floor=loadImage("img/floor.png");
  bg=loadImage("img/bg.png");
  bgBig=loadImage("img/bgBig.png");
  KeyImg=loadImage("img/Key.png");
  KeyDie=loadImage("img/KeyDie.png");
  PoolImg=loadImage("img/Pool.png");
  KeyAlive=loadImage("img/KeyAlive.png");
  gameStart=loadImage("img/gameStart.jpg");
  gameWin=loadImage("img/gameWin.jpg");
  gameLose=loadImage("img/gameLose.jpg");
  doorClose=loadImage("img/doorClose.png");
  doorOpen=loadImage("img/doorOpen.png");
  AttackDie=loadImage("img/AttackDie.png");
  AttackAlive=loadImage("img/AttackAlive.png");
  ProtectDie=loadImage("img/ProtectDie.png");
  ProtectAlive=loadImage("img/ProtectAlive.png");
  FlashlightDie=loadImage("img/FlashlightDie.png");
  FlashlightAlive=loadImage("img/FlashlightAlive.png");
  startButton=loadImage("img/startButton.png");
  startButton2=loadImage("img/startButton2.png");
  goButton=loadImage("img/goButton.png");
  goButton2=loadImage("img/goButton2.png");
  restartButton=loadImage("img/restartButton.png");
  restartButton2=loadImage("img/restartButton2.png");
  TyphoonImg=loadImage("img/Typhoon.png");
  gameStory1=loadImage("img/gameStory1.png");
  gameStory2=loadImage("img/gameStory2.png");
  gameStory3=loadImage("img/gameStory3.png");
  gameStory4=loadImage("img/gameStory4.png");
  gameStory5=loadImage("img/gameStory5.png");
  monsterImg1=loadImage("img/monsterImg1.png");
  gameIntro=loadImage("img/gameIntro.png");
  AttackFire=loadImage("img/AttackFire.png");


  //time 
  gameTimer = GAME_INIT_TIMER;
  //player
  playerX=playerInitialX;
  playerY=playerInitialY;
  playerState=player_Right;
  step=0;

  //item
  attack=new Attack();
  flashlight=new Flashlight();
  protect=new Protect();
  pool=new Pool();
  typhoon=new Typhoon();
  monster1= new Monster1();
  monster2= new Monster2();
  monster3= new Monster3();
}


void draw() {
  imageMode(CENTER);

  switch(gameState) {
  case GAME_START:
    bgsound.play();
    image(gameStart, 500, 350);
    image(startButton, 500, 450);
    if (isHit(mouseX, mouseY, 10, 10, 500, 450, 125, 75)) {
      image(startButton2, 500, 450);
      if (mousePressed) {
        gameState = GAME_STORY1;
        mousePressed=false;
      }
    }
    break;

  case GAME_STORY1:
    if (story.available()==true) {
      story.read();
    }
    story.play();
    image(story, 500, 350);
    if (mouseX<width&&mouseX>0&&mouseY>0&&mouseY<height) {
      if (mousePressed) {
        story.stop();
        gameState=GAME_STORY2;
      }
    }
    break;

  case GAME_STORY2:
    image(gameStory4, 500, 350);
    image(goButton, 850, 600);
    if (isHit(mouseX, mouseY, 10, 10, 850, 600, 200, 100)) {
      image(goButton2, 850, 600); 
      if (mousePressed) {
        gameState = GAME_INTRO;
        mousePressed=false;
      }
    }
    break;

  case GAME_INTRO:
    background(0);
    image(gameIntro, gameIntroX, gameIntroY);
    gameIntroX-=dist(gameIntroX, 0, 510, 0)/35;
    if (gameIntroX<=510.1) {
      gameIntroX-=dist(gameIntroX, 0, -500, 0)/60;
      if (gameIntroX<=-490) {

        gameState = GAME_RUN;
      }
    }
    break;

  case GAME_RUN:
    bgsound.pause();
    //background(160, 160, 160);
    background(255);

    pushMatrix();
    translate(-screenX-dS, 0);

    //item

    //pool   
    pool.display();
    pool.checkCollision();

    //typhoon
    typhoon.display();
    typhoon.checkCollision();    

    //attack
    attack.display();
    attack.checkCollision();

    //flashlight
    flashlight.display();
    flashlight.checkCollision();

    //protect
    protect.display();
    protect.checkCollision();

    //monster1
    monster1.display();
    monster1.checkCollision();
    monster2.display();
    monster2.checkCollision();
    monster3.display();
    monster3.checkCollision();

    //door close   
    image(doorClose, doorX, doorY);

    //door open
    if (fireCheck==true && bgBigCheck==true && setCheck==true) {
      opendoor.play();
      image(doorOpen, doorX, doorY);
    }
    popMatrix(); 

    //bg
    if (bgBigCheck==false) {
      image(bg, playerX+dX, playerY+dY);
    } else if (bgBigCheck==true) {
      image(bgBig, playerX+dX, playerY+dY);
    }

    //pool
    pool.ripple();

    //player
    switch (playerState) {

    case player_Up:
      if (ismoving==false) {
        image(playerUp, playerX, playerY);
      } else {
        if (rightPressed == true) {
          playerState = player_Right;
        }
        if (leftPressed == true) {
          playerState = player_Left;
        }
        if (downPressed == true) {
          playerState = player_Down;
        }
        if (upPressed == true) {
          if (playerY-60>0 && playerSpeedSlow==false) {
            dY -= 50/15; 
            if (dY<=0&&dY>=-35) {
              image(playerUp_right, playerX+10, playerY-10);
            }
            if (dY<=-25&&dY>-50) {
              image(playerUp_left, playerX-10, playerY-40);
            }

            if ( dY <= -50 ) {             
              playerState = player_Up;
              playerY -= playerSpeed;
              dY = 0;
            }
          } else if (playerY-60>=0 && playerSpeedSlow==true) {         
            dY -= 50/30; 
            if (dY<=0&&dY>=-35) {              
              image(playerUp_right, playerX+10, playerY-10);
            }
            if (dY<=-25&&dY>-50) {
              image(playerUp_left, playerX-10, playerY-40);
            }

            if ( dY <= -50 ) {             
              playerState = player_Up;
              playerY -= playerSpeed;
              dY = 0;
            }
          } else {
            image(playerUp, playerX, playerY);
            playerState=player_Up;
          }
        }
      }
      break;

    case player_Right:
      if (ismoving==false) {
        image(playerRight, playerX, playerY);
      } else {
        if (rightPressed == true) {
          if (playerX+60<width && playerSpeedSlow==false) {
            if ( step<5 || step>=19) {             
              dX += 50/15; 
              if (dX>=0&&dX<=35) {
                image(playerRight_right, playerX+10, playerY+10);
              }
              if (dX>=25&&dX<50) {
                image(playerRight_left, playerX+40, playerY-10);
              }     
              if ( dX >= 50 ) {     
                playerX += playerSpeed; 
                playerState = player_Right;            
                dX = 0;
                step++;
                println(step);
              }
            } else {
              dS += 50/15;
              if (dS>=0&&dS<=35) {
                image(playerRight_right, playerX-15, playerY+10);
              }
              if (dS>=25&&dS<50) {
                image(playerRight_left, playerX+15, playerY-10);
              }     

              if ( dS >= 50 ) {       
                playerState = player_Right;
                //playerX +=playerSpeed ;
                dS = 0;
                screenX+=playerSpeed;
                step++;
              }
            }
          } else if (playerX+60<width && playerSpeedSlow==true) {
            if ( step<5 || step>=19 ) {             
              dX += 50/30; 
              if (dX>=0&&dX<=35) {
                image(playerRight_right, playerX+10, playerY+10);
              }
              if (dX>=25&&dX<50) {
                image(playerRight_left, playerX+40, playerY-10);
              }     
              if ( dX >= 50 ) {     
                playerX += playerSpeed; 
                playerState = player_Right;            
                dX = 0;
                step++;
                println(step);
              }
            } else {
              dS += 50/30;
              if (dS>=0&&dS<=35) {
                image(playerRight_right, playerX-15, playerY+10);
              }
              if (dS>=25&&dS<50) {
                image(playerRight_left, playerX+15, playerY-10);
              }     
              if ( dS >= 50 ) {       
                playerState = player_Right;
                //playerX +=playerSpeed ;
                dS = 0;
                screenX+=playerSpeed;
                step++;
              }
            }
          } else {
            image(playerRight, playerX, playerY);
            playerState = player_Right;
          }
        }

        if (leftPressed == true) {
          playerState = player_Left;
        }
        if (downPressed == true) {
          playerState = player_Down;
        }
        if (upPressed == true) {
          playerState = player_Up;
        }
      }
      break;

    case player_Left:
      if (ismoving==false) {
        image(playerLeft, playerX, playerY);
      } else {
        if (rightPressed == true) {
          playerState = player_Right;
        }

        if (leftPressed == true) {
          if (playerX-60>0 && playerSpeedSlow==false) {
            if (step<6 || step >19) {  
              dX -= 50/15;
              if (dX<=0&&dX>=-35) {
                image(playerLeft_right, playerX-10, playerY-10);
              }
              if (dX<=-25&&dX>=-50) {
                image(playerLeft_left, playerX-40, playerY+10);
              }
              if ( dX <= -50 ) { 
                playerX -= playerSpeed; 
                playerState = player_Left;         
                dX = 0;
                step--;
                println(step);
              }
            } else {
              dS -= 50/15;          
              if (dS<=0&&dS>=-35) {
                image(playerLeft_right, playerX+15, playerY-10);
              }
              if (dS<=-25&&dS>=-50) {
                image(playerLeft_left, playerX-15, playerY+10);
              }
              if ( dS < -50 ) {            
                playerState = player_Left;  
                dS = 0;
                screenX-=playerSpeed; 
                step--;
              }
            }
          } else if (playerX-60>0 && playerSpeedSlow==true) {
            if (step<6 || step >19) {  
              dX -= 50/30;
              if (dX<=0&&dX>=-35) {
                image(playerLeft_right, playerX-10, playerY-10);
              }
              if (dX<=-25&&dX>=-50) {
                image(playerLeft_left, playerX-40, playerY+10);
              }

              if ( dX <= -50 ) { 
                playerX -= playerSpeed; 
                playerState = player_Left;         
                dX = 0;
                step--;
                println(step);
              }
            } else {

              dS -= 50/30;          
              if (dS<=0&&dS>=-35) {
                image(playerLeft_right, playerX+15, playerY-10);
              }
              if (dS<=-25&&dS>=-50) {
                image(playerLeft_left, playerX-15, playerY+10);
              }
              if ( dS < -50 ) {            
                playerState = player_Left;  
                dS = 0;
                screenX-=playerSpeed; 
                step--;
              }
            }
          } else {
            image(playerLeft, playerX, playerY);
            playerState = player_Left;
          }
        }

        if (downPressed == true) {
          playerState = player_Down;
        }
        if (upPressed == true) {
          playerState = player_Up;
        }
      }
      break;

    case player_Down:
      if (ismoving==false) {
        image(playerDown, playerX, playerY);
      } else {
        if (rightPressed == true) {
          playerState = player_Right;
        }
        if (leftPressed == true) {
          playerState = player_Left;
        }
        if (downPressed == true) {
          if (playerY+60<height && playerSpeedSlow==false ) {
            dY += 50/15; 
            if (dY>=0&&dY<=35) {
              image(playerDown_left, playerX+10, playerY+10);
            }
            if (dY>=25&&dY<50) {
              image(playerDown_right, playerX-10, playerY+40);
            }      
            if ( dY >= 50 ) {       
              playerState = player_Down;
              playerY += playerSpeed; 
              dY = 0;
            }
          } else if (playerY+60<height && playerSpeedSlow==true) {
            dY += 50/30; 
            if (dY>=0&&dY<=35) {
              image(playerDown_left, playerX+10, playerY+10);
            }
            if (dY>=25&&dY<50) {
              image(playerDown_right, playerX-10, playerY+40);
            }      
            if ( dY >= 50 ) {       
              playerState = player_Down;
              playerY += playerSpeed; 
              dY = 0;
            }
          } else {
            playerState=player_Down;
          }
        }
        if (upPressed == true) {
          playerState = player_Up;
        }
      }
      break;
    }

    if (dist(playerX+screenX, playerY, monster1InitialX, monster1InitialY)<=250) {
      monster.rewind();
      monster.play();
    }

    if (dist(playerX+screenX, playerY, monster2InitialX, monster2InitialY)<=250) {
      monster.rewind();
      monster.play();
    }
    if (dist(playerX+screenX, playerY, monster2InitialX, monster2InitialY)<=300) {
      monster.rewind();
      monster.play();
    }


    if (dist(playerX+screenX, playerY, TyphoonX, TyphoonY)<300) {
      typhoonS.rewind();
      typhoonS.play();
    }

    //time
    drawTimerUI();
    gameTimer --;

    //item
    attack.fire();
    protect.Set();

    //item show
    image(AttackDie, 90, 60);
    image(FlashlightDie, 90, 68);
    image(ProtectDie, 90, 60);

    if (fireCheck==true) {
      image(AttackAlive, 90, 60);
    }

    if (bgBigCheck==true) {
      image(FlashlightAlive, 90, 68);
    }

    if (setCheck==true) {
      image(ProtectAlive, 90, 60);
    }


    //game lose (time)
    if (gameTimer<=0) {
      scream.play();
      gameState = GAME_LOSE;
    }

    if (isHit(monster1X, monster1Y, monsterWidth, monsterHeight, playerX+screenX, playerY, 50, 50)) {
      scream.play();
    }
    if (isHit(monster2X, monster2Y, monsterWidth, monsterHeight, playerX+screenX, playerY, 50, 50)) {

      scream.play();
    }
    if (isHit(monster3X, monster3Y, monsterWidth, monsterHeight, playerX+screenX, playerY, 50, 50)) {
      scream.play();
    }

    //game win 
    if (fireCheck==true && bgBigCheck==true && setCheck==true && dist(playerX+screenX, playerY, doorX, doorY )<=100) {
      fill(255);
      noStroke();
      ellipse(doorX, doorY, winCircle, winCircle);
      winCircle+=10;
      if (winCircle>=1000) {
        gameState = GAME_STORY3;
      }
    }
    //step
    if (step<=0) {
      step=0;
    }

    if (step>=30) {
      step=30;
    }
    break;

  case GAME_LOSE:
    bgsound.play();
    image(gameLose, 500, 350);
    image(restartButton, 500, 450);
    if (isHit(mouseX, mouseY, 10, 10, 500, 450, 200, 100)) {
      image(restartButton2, 500, 450);
      if (mousePressed) {
        gameTimer=GAME_INIT_TIMER;
        step=0;
        playerX=playerInitialX;
        playerY=playerInitialY;
        screenX=0;
        println(playerX);
        gameState =GAME_RUN;
        fireCheck=false;
        fireCheck2=false;
        attackAlive=true;
        flashlightAlive=true;
        bgBigCheck=false;
        protectAlive=true;
        setCheck=false;
        monster1Alive=true;
        monster1X= monster1InitialX;
        monster1Y= monster1InitialY;
        monster2Alive=true;
        monster2X= monster2InitialX;
        monster2Y= monster2InitialY;
        monster3Alive=true;
        monster3X= monster3InitialX;
        monster3Y= monster3InitialY;
        mousePressed=false;
      }
    }
    break;

  case GAME_STORY3:

    image(gameStory5, 500, 350);


    place++;
    noStroke();
    fill(255);
    rect(place, 60, 600, 130);
    rect(place-500, 160, 1400, 230);
    rect(place-1000, 260, 1900, 330);
    rect(place-1500, 380, 2400, 450);
    rect(place-2000, 490, 2900, 560);
    if (place-2000>=800) {
      gameState=GAME_WIN;
    }
    if (isHit(mouseX, mouseY, 10, 10, 850, 600, 200, 100)) {
      image(goButton2, 850, 600); 
      if (mousePressed) {
        gameState=GAME_WIN;
        mousePressed=false;
      }
    }
    break;
  case GAME_WIN:
    image(gameWin, 500, 350);
    image(restartButton, 500, 450);
    if (isHit(mouseX, mouseY, 10, 10, 500, 450, 200, 100)) {
      image(restartButton2, 500, 450);
      if (mousePressed) {
        gameTimer=GAME_INIT_TIMER;
        step=0;
        playerX=playerInitialX;
        playerY=playerInitialY;
        screenX=0;
        println(playerX);
        gameState =GAME_RUN;
        fireCheck=false;
        fireCheck2=false;
        attackAlive=true;
        flashlightAlive=true;
        bgBigCheck=false;
        protectAlive=true;
        setCheck=false;
        monster1Alive=true;
        monster1X= monster1InitialX;
        monster1Y= monster1InitialY;
        monster2Alive=true;
        monster2X= monster2InitialX;
        monster2Y= monster2InitialY;
        monster3Alive=true;
        monster3X= monster3InitialX;
        monster3Y= monster3InitialY;
        mousePressed=false;
        place=100;
      }
    }
    break;
  }
}




//time
void drawTimerUI() {
  String timeString = convertFramesToTimeString(gameTimer); // Requirement #4: Get the mm:ss string using String convertFramesToTimeString(int frames)

  textAlign(LEFT, BOTTOM);

  // Time Text Shadow Effect - You don't have to change this!
  fill(0, 120);
  textSize(40);
  text(timeString, 3, height + 3);

  // Actual Time Text
  color timeTextColor = getTimeTextColor(gameTimer);   // Requirement #5: Get the correct color using color getTimeTextColor(int frames)
  fill(timeTextColor);
  textSize(40);
  text(timeString, 0, height);
}

String convertFramesToTimeString(int frames) { // Requirement #4
  frames /= 60;
  return nf((int)(frames/60), 2) + ":" + nf((int)(frames%60), 2);
}

color getTimeTextColor(int frames) {    // Requirement #5
  if (frames<7200&&frames>=3600) {
    return #ffffff;
  } else {
    return #ff0000;
  }
}

boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  if (ax-(aw/2)<bx-(bw/2)+bw && ax-(aw/2)+aw>bx-(bw/2) && ay-(ah/2)<by-(bh/2)+bh && ay-(aw/2)+ah>by-(bw/2)) {
    return true;
  } else {
    return false;
  }
}


void keyPressed() {

  if (key == CODED ) {


    switch(keyCode) {

    case UP:
      upPressed = true;
      ismoving = true;
      footstep.rewind();
      footstep.play();
      if (playerSpeedSlow==true) {
        footstepriver.rewind();
        footstepriver.play();
      }
      break;

    case DOWN :
      downPressed = true;
      ismoving = true;
      footstep.rewind();
      footstep.play();
      if (playerSpeedSlow==true) {
        footstepriver.rewind();
        footstepriver.play();
      }
      break;

    case LEFT :
      leftPressed = true;
      ismoving = true;
      footstep.rewind();
      footstep.play();
      if (playerSpeedSlow==true) {
        footstepriver.rewind();
        footstepriver.play();
      }
      break;

    case RIGHT :
      rightPressed = true;
      ismoving = true;
      footstep.rewind();
      footstep.play();
      if (playerSpeedSlow==true) {
        footstepriver.rewind();
        footstepriver.play();
      }
      break;
    }
  } else {
    if (key=='b') {
      gameTimer-=1000;
    }
    if (fireCheck==true) {      
      if ( key==' ') {        
        fireCheck2=true;
      }
    }
    if (key=='a') {
      fireCheck=true;
      fireCheck2=true;
    }
    if (key=='p') {
      setCheck=true;
    }
    if (key=='f') {
      bgBigCheck=true;
    }
    if (key=='s') {
      gameState=GAME_RUN;
    }
    if (key=='w') {
      gameState=GAME_STORY3;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch(keyCode) {

    case UP:
      upPressed = false;
      ismoving = false;
      break;

    case DOWN:
      downPressed = false;
      ismoving = false;
      break;

    case LEFT :
      leftPressed = false;
      ismoving = false;
      break;

    case RIGHT :
      rightPressed = false;
      ismoving = false;
      break;
    }
  }
}
