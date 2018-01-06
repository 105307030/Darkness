//gamestate
final int GAME_START = 0, GAME_STORY1 = 1, GAME_STORY2 = 2, GAME_STORY3 = 3, GAME_RUN = 4, GAME_WIN = 5, GAME_LOSE = 6;
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
PImage gameStart, gameStory1, gameStory2, gameStory3, gameRun, gameWin, gameLose;
PImage startButton, startButton2, goButton, goButton2, restartButton, restartButton2;
PImage monsterImg1,monsterImg2,monsterImg3;
//press
boolean upPressed, downPressed, leftPressed, rightPressed = false;
boolean rightReleased;
boolean fireCheck=false;
boolean fireCheck2=false;
boolean ismoving=false;
boolean playerSpeedSlow=false;
boolean bgBigCheck=false;
boolean setCheck=false;
boolean monster1Alive=true;

//player
float playerX, playerY;
float playerInitialX=25;
float playerInitialY=625;
float playerSpeed=60;
int step;
float dS=0;
float dX=0;
float dY=0;
int screenX=0;

//item
Attack []attack;
Flashlight []flashlight;
Protect []protect;
Key [] Keyy;
Pool pool;
Typhoon typhoon;
Monster1 monster1;
//float AttackX=random(60, width-60);
//float AttackY=random(60, height-60);
//float FlashlightX=random(60, width-60);
//float FlashlightY=random(60, height-60);
//float ProtectX=random(60, width-60);
//float ProtectY=random(60, height-60);
float doorX =1450;
float doorY = 50;

int keyAmount=0;

;

void setup() {
  size(1000, 700, P2D);

  background(255);

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
  gameStart=loadImage("img/gameStart.png");
  gameWin=loadImage("img/gameWin.png");
  gameLose=loadImage("img/gameLose.png");
  //doorClose=loadImage("img/doorClose.png");
  //doorOpen=loadImage("img/doorOpen.png");
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
  monsterImg1=loadImage("img/monsterImg1.png");
  monsterImg2=loadImage("img/monsterImg2.png");
  monsterImg3=loadImage("img/monsterImg3.png");
  
  
  //time 
  gameTimer = GAME_INIT_TIMER;
  //player
  playerX=playerInitialX;
  playerY=playerInitialY;
  playerState=player_Up;
  step=0;

  //item
  attack=new Attack[5];
  for (int i=0; i<attack.length; i++) {
    if (i==0) {
      float newX =random(25, 500);
      float newY = random(25, 675);
      attack[i]=new Attack(newX, newY);
    }
    if (i==1 || i==2) {
      float newX =random(500, 1000);
      float newY = random(25, 675);
      attack[i]=new Attack(newX, newY);
    }  
    if (i==3 || i==4) {
      float newX =random(1000, 1475);
      float newY = random(25, 675);
      attack[i]=new Attack(newX, newY);
    }
  }

  flashlight=new Flashlight[5];
  for (int i=0; i<flashlight.length; i++) {
    if (i==0 || i==1) {
      float newX =random(25, 500);
      float newY = random(25, 675);
      flashlight[i]=new Flashlight(newX, newY);
    }
    if (i==2) {
      float newX =random(500, 1000);
      float newY = random(25, 675);
      flashlight[i]=new Flashlight(newX, newY);
    }  
    if (i==3 || i==4) {
      float newX =random(1000, 1475);
      float newY = random(25, 675);
      flashlight[i]=new Flashlight(newX, newY);
    }
  }

  protect=new Protect[5];
  for (int i=0; i<protect.length; i++) {
    if (i==0 || i==1) {
      float newX =random(25, 500);
      float newY = random(25, 675);
      protect[i]=new Protect(newX, newY);
    }
    if (i==2 || i==3) {
      float newX =random(500, 1000);
      float newY = random(25, 675);
      protect[i]=new Protect(newX, newY);
    }  
    if (i==4) {
      float newX =random(1000, 1475);
      float newY = random(25, 675);
      protect[i]=new Protect(newX, newY);
    }
  }

  Keyy=new Key[3]; 
  for (int i=0; i<Keyy.length; i++) {
    if ( i==0) {
      float newX= random(500, 1000);
      float newY= random(25, 200);
      Keyy[i]=new Key(newX, newY);
    }
    if (i==1) {
      float newX= random(500, 1000);
      float newY= random(500, 675);
      Keyy[i]=new Key(newX, newY);
    }
    if (i==2) {
      float newX= random(1400, 1475);
      float newY= random(200, 675);
      Keyy[i]=new Key(newX, newY);
    }
  }
  pool=new Pool();
  typhoon=new Typhoon();
  monster1= new Monster1();
}



void draw() {
  imageMode(CENTER);

  switch(gameState) {
  case GAME_START:
    image(gameStart, 500, 350);
    image(startButton, 850, 500);
    if (isHit(mouseX, mouseY, 10, 10, 850, 600, 200, 100)) {
      image(startButton2, 850, 500);
      if (mousePressed) {
        gameState = GAME_STORY1;
        mousePressed=false;
      }
    }
    break;

  case GAME_STORY1:
    image(gameStory1, 500, 350);
    image(goButton, 850, 600);
    if (isHit(mouseX, mouseY, 10, 10, 850, 600, 200, 100)) {
      image(goButton2, 850, 600);
      if (mousePressed) {
        gameState = GAME_STORY2;
        mousePressed=false;
      }
    }
    break;

  case GAME_STORY2:
    image(gameStory2, 500, 350);
    image(goButton, 850, 600);
    if (isHit(mouseX, mouseY, 10, 10, 850, 600, 200, 100)) {
      image(goButton2, 850, 600);
      if (mousePressed) {
        gameState = GAME_STORY3;
        mousePressed=false;
      }
    }
    break;
  case GAME_STORY3:
    image(gameStory3, 500, 350);
    image(goButton, 850, 600);
    if (isHit(mouseX, mouseY, 10, 10, 850, 600, 200, 100)) {
      image(goButton2, 850, 600);
      if (mousePressed) {
        gameState = GAME_RUN;
        mousePressed=false;
      }
    }
    break;

  case GAME_RUN:

    //background(160, 160, 160);
    background(255);




    //floor

    pushMatrix();
    translate(-screenX-dS, 0);


    //item
    for (int i=0; i<attack.length; i++) {
      attack[i].display();
      attack[i].checkCollision();
    }

    for (int i=0; i<flashlight.length; i++) {
      flashlight[i].display();
      flashlight[i].checkCollision();
    }

    for (int i=0; i<protect.length; i++) {
      protect[i].display();
      protect[i].checkCollision();
    }

    //key
    for (int i=0; i<Keyy.length; i++) {
      Keyy[i].display();
      Keyy[i].checkCollision();
    }

    //pool   
    pool.display();
    pool.checkCollision();

    //typhoon
    typhoon.display();
    typhoon.checkCollision();


    //monster1
    monster1.display();
    monster1.checkCollision();
    
    
    ////door close   
    //image(doorClose,doorX,doorY);

    ////door open

    //if(keyAmount==3){
    // image(doorOpen,doorX,doorY); 
    //}


    popMatrix(); 

    //bg
    //if (bgBigCheck==false) {
    //  image(bg, playerX+dX, playerY+dY);
    //} else if (bgBigCheck==true) {
    //  image(bgBig, playerX+dX, playerY+dY);
    //}

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
                image(playerRight_right, playerX+10, playerY+10);
              }
              if (dS>=25&&dS<50) {
                image(playerRight_left, playerX+40, playerY-10);
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
                image(playerRight_right, playerX-5, playerY+10);
              }
              if (dX>=25&&dX<50) {
                image(playerRight_left, playerX+30, playerY-10);
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
                image(playerRight_right, playerX+10, playerY+10);
              }
              if (dS>=25&&dS<50) {
                image(playerRight_left, playerX+40, playerY-10);
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
                image(playerLeft_right, playerX-10, playerY-10);
              }
              if (dS<=-25&&dS>=-50) {
                image(playerLeft_left, playerX-40, playerY+10);
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
                image(playerLeft_right, playerX-10, playerY-10);
              }
              if (dS<=-25&&dS>=-50) {
                image(playerLeft_left, playerX-40, playerY+10);
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

    //item


    //if (dist(AttackX, AttackY, FlashlightX, FlashlightY)<=100) {
    //  AttackX=random(60, width-60);
    //  AttackY=random(60, height-60);
    //}

    //if (dist(AttackX, AttackY, ProtectX, ProtectY)<=100) {
    //  AttackX=random(0-60, width-60);
    //  AttackY=random(0-60, height-60);
    //}
    //if (dist(FlashlightX, FlashlightY, AttackX, AttackY)<=100) {
    //  FlashlightX=random(60, width-60);
    //  FlashlightY=random(60, height-60);
    //}
    //if (dist(FlashlightX, FlashlightY, ProtectX, ProtectY)<=100) {
    //  FlashlightX=random(60, width-60);
    //  FlashlightY=random(60, height-60);
    //}

    //if (dist(ProtectX, ProtectY, AttackX, AttackY)<=100) {
    //  ProtectX=random(60, width-60);
    //  ProtectY=random(60, height-60);
    //}

    //if (dist(ProtectX, ProtectY, FlashlightX, FlashlightY)<=100) {
    //  ProtectX=random(0-60, width-60);
    //  ProtectY=random(0-60, height-60);
    //}
    //time
    drawTimerUI();
    gameTimer --;


    //item

    for (int i=0; i<attack.length; i++) {
      attack[i].fire();
    }

    for (int i=0; i<protect.length; i++) {
      protect[i].Set();
    }

    //item show
    image(AttackDie, 50, 50);
    image(FlashlightDie, 120, 50);
    image(ProtectDie, 190, 50);

    if (fireCheck==true) {
      image(AttackAlive, 50, 50);
    }

    if (bgBigCheck==true) {
      image(FlashlightAlive, 120, 50);
    }

    if (setCheck==true) {
      image(ProtectAlive, 190, 50);
    }

    //key show
    for (int i=0; i<3; i++) {
      image(KeyDie, 820+i*70, 670);
    }
    for (int i=0; i<keyAmount; i++) {

      image(KeyAlive, 820+i*70, 670);
    }


    //game lose (time)
    if (gameTimer<=0) {
      gameState = GAME_LOSE;
    }

    //game win 
    if (keyAmount==3 && dist(playerX+screenX, playerY, 100, 100)<=100) {
      gameState = GAME_WIN;
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
    image(gameLose, 500, 350);
    image(restartButton, 500, 450);
    if (isHit(mouseX, mouseY, 10, 10, 500, 450, 200, 100)) {
      image(restartButton2, 500, 450);
      if (mousePressed) {
        gameTimer=GAME_INIT_TIMER;
        keyAmount=0;
        step=0;
        playerX=playerInitialX;
        playerY=playerInitialY;
        screenX=0;
        println(playerX);
        gameState =GAME_RUN;
        monster1Alive=true;
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
        playerX=playerInitialX;
        playerY=playerInitialY;
        screenX=0;
        keyAmount=0;
        step=0;
        gameState =GAME_RUN;
        mousePressed=false;
        monster1Alive=true;
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
      break;

    case DOWN :
      downPressed = true;
      ismoving = true;
      break;

    case LEFT :
      leftPressed = true;
      ismoving = true;
      break;

    case RIGHT :
      rightPressed = true;
      ismoving = true;
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