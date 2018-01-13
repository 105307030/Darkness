class Pool {
  float PoolX=1400;
  float PoolY=300;
  float PoolWidth;
  float PoolHeight;
  float ellipseripple1=0;
  float ellipseripple2=-20;
  float ellipseripple3=-40;
  float ellipseripple4=-60;
  void display() {
    image(PoolImg, PoolX, PoolY);
  }

  void checkCollision() {
    if (isHit(PoolX, PoolY, 450, 350, playerX+screenX, playerY, 50, 50)) {
      playerSpeedSlow=true;
    } else {
      playerSpeedSlow=false;
    }
  }


  void ripple() {
    if (playerSpeedSlow ==true && ismoving ==true ) {
      //ripple 1
      stroke(255);
      strokeWeight(2);
      noFill();
      ellipseripple1+=4;
      if (ellipseripple1>=150) {
        ellipseripple1=0;
      }
      ellipse(playerX+dX, playerY+dY, ellipseripple1, ellipseripple1);

      //ripple 2
      stroke(255);
      strokeWeight(2);
      noFill();
      ellipseripple2+=4;
      if (ellipseripple2>=150) {
        ellipseripple2=0;
      }
      ellipse(playerX+dX, playerY+dY, ellipseripple2, ellipseripple2);

      //ripple 3
      stroke(255);
      strokeWeight(2);
      noFill();
      ellipseripple3+=4;
      if (ellipseripple3>=150) {
        ellipseripple3=0;
      }
      ellipse(playerX+dX, playerY+dY, ellipseripple3, ellipseripple3);

      //ripple 4
      stroke(255);
      strokeWeight(2);
      noFill();
      ellipseripple4+=4;
      if (ellipseripple4>=150) {
        ellipseripple4=0;
      }
      ellipse(playerX+dX, playerY+dY, ellipseripple4, ellipseripple4);
    }
  }
}
