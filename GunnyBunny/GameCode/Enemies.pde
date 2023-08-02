class Enemies{
  float xpos;
  float ypos;
  
  Enemies(float xpos, float ypos){
    this.xpos = xpos;
    this.ypos = ypos;
   
  }
  
  float xSpeed = -4;
  void move(){
    shape(idleCabbage, cabbage.xpos, cabbage.ypos, 330,300); 
    xpos += xSpeed;
    if(xpos > width || xpos < -300){
      xSpeed *= -1;
    }
    else if(p1.health == 0 || p1.score == 300){
      xSpeed = 0;
    }
  }
  
}
