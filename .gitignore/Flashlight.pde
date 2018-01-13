class Flashlight {
  float FlashlightX=random(500, 800);
  float FlashlightY=random(100, 600);

  void display() {
    if (flashlightAlive==true) {
      image(FlashlightImg, FlashlightX, FlashlightY);
    }
  }
  void checkCollision() {
    if (flashlightAlive==true) {
      if (isHit(FlashlightX, FlashlightY, 50, 50, playerX+screenX, playerY, 60, 60)) {
        flashlightAlive=false;
        bgBigCheck=true;
      };
    }
  }
}
