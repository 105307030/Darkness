class Monster1 {
  float monster1InitialX=500;
  float monster1InitialY=350;
  float monster1X= monster1InitialX;
  float monster1Y= monster1InitialY;
  float monsterWidth=50, monsterHeight=50;


  void display() {
    if (monster1Alive) {
      image(monsterImg1, monster1X, monster1Y);
    }
  }

  void checkCollision() {
    //monster1 chase 
    if (monster1Alive) {
      if (dist(monster1InitialX, monster1InitialY, playerX+screenX, playerY) <= 300 &&setCheck==false) {
        if (monster1X<playerX+screenX && monster1Y<playerY) {
          monster1X+=dist(monster1X, 0, playerX+screenX, 0)/50;
          monster1Y+=dist(0, monster1Y, 0, playerY)/50;
        }
        if (monster1X>playerX+screenX && monster1Y<playerY) {
          monster1X-=dist(monster1X, 0, playerX+screenX, 0)/50;
          monster1Y+=dist(0, monster1Y, 0, playerY)/50;
        }
        if (monster1X<playerX+screenX && monster1Y>playerY) {
          monster1X+=dist(monster1X, 0, playerX+screenX, 0)/50;
          monster1Y-=dist(0, monster1Y, 0, playerY)/50;
        }
        if (monster1X>playerX+screenX && monster1Y>playerY) {
          monster1X-=dist(monster1X, 0, playerX+screenX, 0)/50;
          monster1Y-=dist(0, monster1Y, 0, playerY)/50;
        }
        if (isHit(monster1X, monster1Y, monsterWidth, monsterHeight, playerX+screenX, playerY, 50, 50)) {
          monster1X= monster1InitialX;
          monster1Y= monster1InitialY;
          gameState=GAME_LOSE;
        }
      }
      //monster back
      else {
        if (monster1X<monster1InitialX && monster1Y<monster1InitialY) {
          monster1X+=dist(monster1X, 0, monster1InitialX, 0)/50;
          monster1Y+=dist(0, monster1Y, 0, monster1InitialY)/50;
        }
        if (monster1X>monster1InitialX && monster1Y<monster1InitialY) {
          monster1X-=dist(monster1X, 0, monster1InitialX, 0)/50;
          monster1Y+=dist(0, monster1Y, 0, monster1InitialY)/50;
        }
        if (monster1X<monster1InitialX && monster1Y>monster1InitialY) {
          monster1X+=dist(monster1X, 0, monster1InitialX, 0)/50;
          monster1Y-=dist(0, monster1Y, 0, monster1InitialY)/50;
        }
        if (monster1X>monster1InitialX && monster1Y>monster1InitialY) {
          monster1X-=dist(monster1X, 0, monster1InitialX, 0)/50;
          monster1Y-=dist(0, monster1Y, 0, monster1InitialY)/50;
        }
      }
      //attack
      if (fireCheck2 == true && dist(monster1X, monster1Y, playerX, playerY)<200) {
        monster1Alive=false;
      }
    }
  }
}