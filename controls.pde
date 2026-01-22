boolean upKey, downKey, leftKey, rightKey, spaceKey, f3Key, wKey, aKey, sKey, dKey, shiftKey;

void keyPressed()
{
  if (key == 'm') 
  {
    if(mapMode)
    {
      for(FBox thing:solids) world.add(thing);
      mapMode = false;
      rd = 10;
      gridSize = 35;
    }
    else
    {
      for(FBox thing:solids) world.remove(thing);
      mapMode = true;
      rd = 300;
      gridSize = 2;
    }
  }
  
  
  if (keyCode == UP) rd = rd+5;
  if (keyCode == DOWN) rd = rd-5;
  if (keyCode == LEFT && gridSize > .5) 
  {
    gridSize = gridSize - .5;
    player.setPosition(oX*gridSize  + width/2, oY*gridSize  + height/2);
  }
  if (keyCode == RIGHT) 
  {
    gridSize = gridSize + .5;
    player.setPosition(oX*gridSize  + width/2, oY*gridSize  + height/2);
  }
  if (key == ' ') spaceKey = true;
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 'a' || key == 'A') aKey = true;
  if (key == 's' || key == 'S') sKey = true;
  if (key == 'd' || key == 'D') dKey = true;
   
  if (keyCode == 16) shiftKey = true;
  
  if (key == '3') 
  {
    //println("coded", keyCode, f3);
    if (f3 == false) 
    {
      f3 = true;
    }
    else 
    {
      f3 = false;
    }
  }
  
  //println("coded", keyCode);
}

void keyReleased()
{
  //if (keyCode == UP) upKey = false;
  //if (keyCode == DOWN) downKey = false;
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == RIGHT) rightKey = false;
  if (key == ' ') spaceKey = false;
  if (key == 'w' || key == 'W') wKey = false;
  if (key == 'a' || key == 'A') aKey = false;
  if (key == 's' || key == 'S') sKey = false;
  if (key == 'd' || key == 'D') dKey = false;
  if (keyCode == 16) shiftKey = false;

  //if (key == '3') f3Key = false;
}
