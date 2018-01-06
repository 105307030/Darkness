class Key {
  float KeyX;
  float KeyY;
  boolean KeyAlive=true;

  Key(float X, float Y) {
    this.KeyX=X;
    this.KeyY=Y;
  }

  void display() {
    if (KeyAlive) {
      image(KeyImg, KeyX, KeyY);
    }
  }

  void checkCollision() {
    if (KeyAlive) {
      if (isHit(KeyX, KeyY, 50, 50, playerX+screenX, playerY, 50, 50)) {
        KeyAlive=false;  
        keyAmount++;
      }
    }
  }
}