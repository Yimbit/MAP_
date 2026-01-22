class FPlayer extends FBox
{
  int speed = 500;
  FPlayer()
  {
    super(10, 10);
    setPosition(width/2, height/2);
    setFillColor(white);
    setStatic(false);
    setDamping(10);
    setRotatable(false);
  }
  
  void Move()
  {
    //oX = (mouseX-width/2)/gridSize;
    //oY = (mouseY-height/2)/gridSize;
    
    oX = (getX() - width/2)/gridSize;
    oY = (getY() - height/2)/gridSize;
    moX = int((mouseX - width/2)/gridSize + oX);
    moY = int((mouseY - height/2)/gridSize + oY);
    //setPosition(oX*gridSize  + width/2, oY*gridSize + height/2 );
    if(shiftKey) speed = 600;
    else speed = 300;
    if(wKey) addForce(0, -speed);
    if(sKey) addForce(0, speed);
    if(aKey) addForce(-speed, 0);
    if(dKey) addForce(speed, 0);
   
  }
}
