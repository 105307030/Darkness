class Protect {
  float arcStop=0;
  float arcStopSpeed=0.2;
  float arcWidth=0;
  float ProtectX=random(1000, 1300);
  float ProtectY=random(100, 600);

  void display() {
    if (protectAlive==true) {
      image(ProtectImg, ProtectX, ProtectY);
    }
  }

  void checkCollision() {
    if (protectAlive==true) {
      if (isHit(ProtectX, ProtectY, 50, 50, playerX+screenX, playerY, 60, 60)) {
        setCheck=true;
        protectAlive=false;
      };
    }
  }
  void Set() {
    if (setCheck) {
      arcWidth=100;    
      stroke(0, 0, 255);
      strokeWeight(5);
      noFill();
      arc(playerX+dX, playerY+dY, arcWidth, arcWidth, 0, arcStop);
      arcStop+=arcStopSpeed;   
      if (arcStop>=360) {
        arcStop=360;
      }
    }
  }
}
