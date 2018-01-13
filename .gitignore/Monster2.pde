class Monster2 {
  void display() {
    if (monster2Alive) {
      pushMatrix();
      translate(monster2X, monster2Y);
      rotate(frameCount/10);
      image(monsterImg1, 0, 0);
      popMatrix();
    }
  }

  void checkCollision() {
    //monster2 chase 
    if (monster2Alive) {
      if (dist(monster2InitialX, monster2InitialY, playerX+screenX, playerY) <= 150 &&setCheck==false) {
        if (monster2X<playerX+screenX && monster2Y<playerY) {
          monster2X+=dist(monster2X, 0, playerX+screenX, 0)/90;
          monster2Y+=dist(0, monster2Y, 0, playerY)/90;
        }
        if (monster2X>playerX+screenX && monster2Y<playerY) {
          monster2X-=dist(monster2X, 0, playerX+screenX, 0)/90;
          monster2Y+=dist(0, monster2Y, 0, playerY)/90;
        }
        if (monster2X<playerX+screenX && monster2Y>playerY) {
          monster2X+=dist(monster2X, 0, playerX+screenX, 0)/90;
          monster2Y-=dist(0, monster2Y, 0, playerY)/90;
        }
        if (monster2X>playerX+screenX && monster2Y>playerY) {
          monster2X-=dist(monster2X, 0, playerX+screenX, 0)/90;
          monster2Y-=dist(0, monster2Y, 0, playerY)/90;
        }
        if (isHit(monster2X, monster2Y, monsterWidth, monsterHeight, playerX+screenX, playerY, 50, 50)) {
          monster2X= monster2InitialX;
          monster2Y= monster2InitialY;
          gameState=GAME_LOSE;
        }
      }
      //monster back
      else {
        if (monster2X<monster2InitialX && monster2Y<monster2InitialY) {
          monster2X+=dist(monster2X, 0, monster2InitialX, 0)/90;
          monster2Y+=dist(0, monster2Y, 0, monster2InitialY)/90;
        }
        if (monster2X>monster2InitialX && monster2Y<monster2InitialY) {
          monster2X-=dist(monster2X, 0, monster2InitialX, 0)/90;
          monster2Y+=dist(0, monster2Y, 0, monster2InitialY)/90;
        }
        if (monster2X<monster2InitialX && monster2Y>monster2InitialY) {
          monster2X+=dist(monster2X, 0, monster2InitialX, 0)/90;
          monster2Y-=dist(0, monster2Y, 0, monster2InitialY)/90;
        }
        if (monster2X>monster2InitialX && monster2Y>monster2InitialY) {
          monster2X-=dist(monster2X, 0, monster2InitialX, 0)/90;
          monster2Y-=dist(0, monster2Y, 0, monster2InitialY)/90;
        }
      }
      //attack
      if (fireCheck2 == true && dist(monster2X, monster2Y, playerX+screenX, playerY)<200) {
        monster2Alive=false;
      }
    }
  }
}