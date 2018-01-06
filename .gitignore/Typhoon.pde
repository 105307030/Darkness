class Typhoon{
  float TyphoonX=100;
  float TyphoonY=100;
  float TyphoonWidth;
  float TyphoonHeight;

  void display() {
    pushMatrix();
translate(TyphoonX,TyphoonX);
rotate(frameCount/10);
image(TyphoonImg,0, 0);
popMatrix();
  }

  void checkCollision() {
    if (isHit(TyphoonX, TyphoonY, 200, 200, playerX+screenX, playerY, 50, 50)) {
      if(playerX>TyphoonX && playerY>TyphoonY){
        playerX-= dist(playerX,0,TyphoonX,0)/50;
        playerY-=dist(0,playerY,0,TyphoonY)/50;
      }
      if(playerX<TyphoonX && playerY>TyphoonY){
        playerX+= dist(playerX,0,TyphoonX,0)/50;
        playerY-=dist(0,playerY,0,TyphoonY)/50;
      }
      if(playerX>TyphoonX && playerY<TyphoonY){
        playerX-= dist(playerX,0,TyphoonX,0)/50;
        playerY+=dist(0,playerY,0,TyphoonY)/50;
      }
      if(playerX<TyphoonX && playerY<TyphoonY){
        playerX+= dist(playerX,0,TyphoonX,0)/50;
        playerY+=dist(0,playerY,0,TyphoonY)/50;
      }
      
    } 
  }

  
  
  
  
  
}