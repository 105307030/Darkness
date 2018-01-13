class Monster3 {
  void display() {
    if (monster3Alive) {
      pushMatrix();
      translate(monster3X, monster3Y);
      rotate(frameCount/1);
      image(monsterImg1, 0, 0);
      popMatrix();
    }
  }

  void checkCollision() {
    //monster3 chase 
    if (monster3Alive) {
      if (dist(monster3InitialX, monster3InitialY, playerX+screenX, playerY) <= 200 &&setCheck==false) {
        if (monster3X<playerX+screenX && monster3Y<playerY) {
          monster3X+=dist(monster3X, 0, playerX+screenX, 0)/80;
          monster3Y+=dist(0, monster3Y, 0, playerY)/80;
        }
        if (monster3X>playerX+screenX && monster3Y<playerY) {
          monster3X-=dist(monster3X, 0, playerX+screenX, 0)/80;
          monster3Y+=dist(0, monster3Y, 0, playerY)/80;
        }
        if (monster3X<playerX+screenX && monster3Y>playerY) {
          monster3X+=dist(monster3X, 0, playerX+screenX, 0)/80;
          monster3Y-=dist(0, monster3Y, 0, playerY)/80;
        }
        if (monster3X>playerX+screenX && monster3Y>playerY) {
          monster3X-=dist(monster3X, 0, playerX+screenX, 0)/80;
          monster3Y-=dist(0, monster3Y, 0, playerY)/80;
        }
        if (isHit(monster3X, monster3Y, monsterWidth, monsterHeight, playerX+screenX, playerY, 50, 50)) {
          monster3X= monster3InitialX;
          monster3Y= monster3InitialY;
          gameState=GAME_LOSE;
        }
      }
      //monster back
      else {
        if (monster3X<monster3InitialX && monster3Y<monster3InitialY) {
          monster3X+=dist(monster3X, 0, monster3InitialX, 0)/80;
          monster3Y+=dist(0, monster3Y, 0, monster3InitialY)/80;
        }
        if (monster3X>monster3InitialX && monster3Y<monster3InitialY) {
          monster3X-=dist(monster3X, 0, monster3InitialX, 0)/80;
          monster3Y+=dist(0, monster3Y, 0, monster3InitialY)/80;
        }
        if (monster3X<monster3InitialX && monster3Y>monster3InitialY) {
          monster3X+=dist(monster3X, 0, monster3InitialX, 0)/80;
          monster3Y-=dist(0, monster3Y, 0, monster3InitialY)/80;
        }
        if (monster3X>monster3InitialX && monster3Y>monster3InitialY) {
          monster3X-=dist(monster3X, 0, monster3InitialX, 0)/80;
          monster3Y-=dist(0, monster3Y, 0, monster3InitialY)/80;
        }
      }
      //attack
      if (fireCheck2 == true && dist(monster3X, monster3Y, playerX+screenX, playerY)<200) {
        monster3Alive=false;
      }
    }
  }
}