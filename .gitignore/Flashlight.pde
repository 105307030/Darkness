class Flashlight {
  int FlashlightTime=0;
  int FlashlightTimeStop=600;
  float FlashlightX;
  float FlashlightY;
  
  Flashlight(float X, float Y) {
    this.FlashlightX=X;
    this.FlashlightY=Y;
  }

  void display() {
    image(FlashlightImg, FlashlightX, FlashlightY);
  }

  void checkCollision() {
    if (isHit(FlashlightX, FlashlightY, 50, 50, playerX+screenX, playerY, 60, 60)) {
      FlashlightX=random(0, width);
      FlashlightY=random(0, height);
      bgBigCheck=true;
    };
    if (bgBigCheck==true) {
      FlashlightTime++;
      if (FlashlightTime==FlashlightTimeStop) {
        FlashlightTime=0;
        bgBigCheck=false;
      }
    }
  }
}