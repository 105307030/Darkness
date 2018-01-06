class Protect {
  float arcStop=0;
  float arcStopSpeed=0.2;
  int protectTime=0;
  int protectTimeStop=540;
  float arcWidth=0;

  boolean protectTimeCheck=false;
  float ProtectX;
  float ProtectY;


  Protect(float X, float Y) {
    this.ProtectX=X;
    this.ProtectY=Y;
  }


  void display() {
    image(ProtectImg, ProtectX, ProtectY);
  }

  void checkCollision() {
    if (isHit(ProtectX, ProtectY, 50, 50, playerX+screenX, playerY, 60, 60)) {
      ProtectX=random(0, width);
      ProtectY=random(0, height);
      setCheck=true;
      protectTimeCheck=true;
    };
  }

  void Set() {   
    if (setCheck) {
      arcWidth=100;    
      stroke(0, 0, 255);
      strokeWeight(5);
      noFill();
      arc(playerX+dX, playerY+dY, arcWidth, arcWidth, 0, arcStop);
      arcStop+=arcStopSpeed;   
      if (protectTimeCheck==true) {
        arcStop=360;        
        protectTimeCheck=true;
        protectTime++;         
        if (protectTime==protectTimeStop) {
          protectTime=0;  
          arcStop=0;
          //  noStroke();
          setCheck=false;
          protectTimeCheck=false;
        }
      }
    }
  }
}