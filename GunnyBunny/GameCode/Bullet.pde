class Bullet{
  float bulletX;
  float bulletY;
  float bulletSpeed;
  
  Bullet(float bulletX, float bulletY, float bulletSpeed) {
    this.bulletX = bulletX;
    this.bulletY = bulletY;
    this.bulletSpeed = bulletSpeed;
  }

  void display(){
    noStroke();
    rect(bulletX, bulletY, 50, 15);
    fill(150);
  }
  
  void move(){
    bulletX += bulletSpeed;
  }
  
}
