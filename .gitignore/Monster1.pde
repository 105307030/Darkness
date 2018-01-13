class Monster1 {
  void display() {
    if (monster1Alive) {
      pushMatrix();
      translate(monster1X, monster1Y);
      rotate(frameCount/20);
      image(monsterImg1, 0, 0);
      popMatrix();
    }
  }

  void checkCollision() {
    //monster1 chase 
    if (monster1Alive) {
      if (dist(monster1InitialX, monster1InitialY, playerX+screenX, playerY) <= 150 &&setCheck==false) {
        if (monster1X<playerX+screenX && monster1Y<playerY) {
          monster1X+=dist(monster1X, 0, playerX+screenX, 0)/100;
          monster1Y+=dist(0, monster1Y, 0, playerY)/70;
        }
        if (monster1X>playerX+screenX && monster1Y<playerY) {
          monster1X-=dist(monster1X, 0, playerX+screenX, 0)/100;
          monster1Y+=dist(0, monster1Y, 0, playerY)/70;
        }
        if (monster1X<playerX+screenX && monster1Y>playerY) {
          monster1X+=dist(monster1X, 0, playerX+screenX, 0)/100;
          monster1Y-=dist(0, monster1Y, 0, playerY)/70;
        }
        if (monster1X>playerX+screenX && monster1Y>playerY) {
          monster1X-=dist(monster1X, 0, playerX+screenX, 0)/100;
          monster1Y-=dist(0, monster1Y, 0, playerY)/70;
        }
      } else if (isHit(monster1X, monster1Y, monsterWidth, monsterHeight, playerX+screenX, playerY, 50, 50)) {
        monster1X= monster1InitialX;
        monster1Y= monster1InitialY;
        gameState=GAME_LOSE;
      }
      //monster back
      else {
        if (monster1X<monster1InitialX && monster1Y<monster1InitialY) {
          monster1X+=dist(monster1X, 0, monster1InitialX, 0)/100;
          monster1Y+=dist(0, monster1Y, 0, monster1InitialY)/100;
        }
        if (monster1X>monster1InitialX && monster1Y<monster1InitialY) {
          monster1X-=dist(monster1X, 0, monster1InitialX, 0)/100;
          monster1Y+=dist(0, monster1Y, 0, monster1InitialY)/100;
        }
        if (monster1X<monster1InitialX && monster1Y>monster1InitialY) {
          monster1X+=dist(monster1X, 0, monster1InitialX, 0)/100;
          monster1Y-=dist(0, monster1Y, 0, monster1InitialY)/100;
        }
        if (monster1X>monster1InitialX && monster1Y>monster1InitialY) {
          monster1X-=dist(monster1X, 0, monster1InitialX, 0)/100;
          monster1Y-=dist(0, monster1Y, 0, monster1InitialY)/100;
        }
      }
      //attack
      if (fireCheck2 == true && dist(monster1X, monster1Y, playerX+screenX, playerY)<200) {
        monster1Alive=false;
      }
    }
  }
