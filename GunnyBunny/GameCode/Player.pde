//Player class => User controls main character
class Player{
  float xpos;
  float ypos;
  int health;
  int score;
  Player(float xpos, float ypos, int health, int score){ //player constructor
    this.xpos = xpos;
    this.ypos = ypos;
    this.health = health;
    this.score = score;
  }
  
  //Variables used to move player
  float ground = height - 350;
  float walkSpeed = 20;
  float jumpSpeed = 20;
  PVector position = new PVector(400, ground);
  PVector velocity = new PVector(0, 0);
  float gravity = 10;
  
  void move() {   
   //left and right movement => 'a' or 'd' button is pressed
   velocity.x = walkSpeed * (left + right);
   if(right == 1 || left == -1){
     xpos += velocity.x;
     delay(30);
    }
  
   //jump => 'j' button is pressed
   if (position.y >= ground && jump != 0){  
     velocity.y = -jumpSpeed;
     ypos += velocity.y;
   }
   else if(jump == 0 || ypos > 10){ //applies gravity
     velocity.y = -1;
     velocity.y *= -gravity;
     if(ypos != ground){
       ypos += velocity.y;  
     }
   }
   
   //shoot => 'k' button is pressed
   if(shoot == 1){
     Bullet b = new Bullet(bulletX, bulletY, 200);
     b.move();
     b.display();
     shoot = 0;
   }   
   
   //Statements for side scrolling
   if (xpos > width) {
     xpos = 0;
   }
   if(xpos < 0){
     xpos = width;
   }
 
  }
  
  void displayStats(){
    fill(0);
    text("Press 'q' to exit", width-300, 850);
    fill(0);
    text("Gunny Bunny", 600, 50);
    fill(0);
    text("Health: " + health + "/100", 25, 80);
    fill(0);
    text("Score: " + score, width-200, 80);
 
  }
  
}
