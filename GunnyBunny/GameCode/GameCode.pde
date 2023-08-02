/*
Savannah Chhann 
Title: Gunny Bunny 
*/

//Used for player movement
float left;
float right;
float jump;
float shoot;
float bulletX, bulletY;

//used to change the direction of the player
boolean faceLeft; 
float direction; 

//boolean statements for collisions
boolean isAttacked, isAttacked2;
boolean touching, stillTouching;

//Creates player images
PShape idleRPos; //creates idle position player image
PShape rightPos1;
PShape rightPos2;
PShape idleLPos;
PShape leftPos1;
PShape idleCabbage;

Player p1; //creates useable player
Enemies cabbage; // create enemy

void setup() { //load all shapes and create new variables in the setup
  fullScreen();
  idleRPos = loadShape("FullSizeRender 6.svg");
  rightPos1 = loadShape("FullSizeRender 8.svg");
  rightPos2 = loadShape("FullSizeRender 3.svg");
  idleLPos = loadShape("FullSizeRender 7.svg");
  leftPos1 = loadShape("FullSizeRender 4.svg");
  idleCabbage = loadShape("FullSizeRender 24.svg");

  p1 = new Player(0,0, 100, 0); 
  cabbage = new Enemies(width, height-300);

}

//Starting screen
void draw() {
  PFont f;
  f = createFont("Roboto", 32);
  textFont(f);
  background(200); 
  
  //Player movement
  p1.move();
  if(faceLeft == true){
    shape(idleLPos, p1.xpos, p1.ypos, 145, 350);
  }
  else if (faceLeft == false){
    shape(idleRPos, p1.xpos, p1.ypos, 180, 350);
  }
  
  //Enemy movement
  cabbage.move();

  if(dist(cabbage.xpos+50, cabbage.ypos, bulletX, bulletY) < 200){
    isAttacked = true;
    if(isAttacked == true && isAttacked2 == false){
      isAttacked2 = true;
      p1.score += 10;
      isAttacked = false;
    }
  }
  else{
    isAttacked2 = false;
  }
  
  if(dist(cabbage.xpos+50, cabbage.ypos, p1.xpos, p1.ypos) < 200){
    touching = true;
    if(touching == true && stillTouching == false){
      stillTouching = true;
      background(255,0,0,50);
      p1.health -= 10;
      touching = false;
    }
  }
  else{
    stillTouching = false;
  }
  p1.displayStats();
  
  if(p1.health <= 0){
    text("You lose", width/2, height/2);
  }
  if(p1.score == 100){
    text("You win", width/2, height/2);
  }
  
}

//void methods used to move character
void keyPressed(){
  if (key == 'd'){
    right = 1;
    faceLeft = false;
    shape(rightPos1, p1.xpos, p1.ypos, 180, 350);
    shape(rightPos2, p1.xpos, p1.ypos, 180, 350);
  }
  if (key == 'a'){
    faceLeft = true;
    left = -1; 
    shape(leftPos1, p1.xpos, p1.ypos, 145, 350);
  }
  if (key == 'j'){
    jump = -1;
  }
  if (key == 'k'){
    shoot = 1;
    if(faceLeft == true){
      direction = -2;
    }
    else{
      direction = 1;
    }
    bulletX = p1.xpos + (300 * direction);
    bulletY = p1.ypos + 190;
  }
  if(key == 'q') exit();
}
void keyReleased(){
  if (key == 'd'){
    right = 0;   
    faceLeft = false;
  }
  else if (key == 'a'){
    left = 0;
    faceLeft = true;
  }
  if (key == 'j'){
    jump = 0;
  }
  if (key == 's'){
    shoot = 0;
  }
}
