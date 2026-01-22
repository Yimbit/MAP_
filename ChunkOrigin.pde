

class ChunkOrigin
{
  int throwaway;
  
  int leftLength = 1;
  int rightLength = 1;
  int upLength = 1;
  int downLength = 1;
  
  int set;
  boolean left = false;
  boolean right = false;
  boolean up = false;
  boolean down = false;
  
  boolean blank = false;
  
  boolean done = false;
  boolean done2 = false;
  
  ChunkOrigin upBox;
  ChunkOrigin downBox;
  ChunkOrigin leftBox;
  ChunkOrigin rightBox;
  
  RoomBlock upRoom;
  RoomBlock downRoom;
  RoomBlock leftRoom;
  RoomBlock rightRoom;
  
  
  FBox upWall;
  FBox downWall;
  FBox leftWall;
  FBox rightWall;
  
  Path uPath;
  Path dPath;
  Path lPath;
  Path rPath;
  
  int x;
  int y;
  
  int dist;
  int dir;
  float chance = -.99;
  
  ChunkOrigin(int currentx, int currenty)
  {
    left = false;
    right = false;
    up = false;
    down = false;
    
    x = currentx;
    y = currenty;
    
    megaArray.add(this);
    if (tempArray != null) tempArray.add(this);

  }
  
  void SetState()
  {
    for(int num = 0; num < testArray.size(); num++)
    {
      //if (InSquare(testArray.get(num), 200))
      //{
      if(testArray.get(num).x == x)
      {
        
        if(testArray.get(num).y == y - 3)
        {
          //if(testArray.get(num).blank == false) 
          downBox = testArray.get(num);
          
        }
        
        if(testArray.get(num).y == y + 3)
        {
          //if(testArray.get(num).blank == false) 
          upBox = testArray.get(num);
        }
      }
       if(testArray.get(num).y == y)
      {
        if(testArray.get(num).x == x - 3)
        {
          //if(testArray.get(num).blank == false) 
          leftBox = testArray.get(num);
        }
         if(testArray.get(num).x == x + 3)
        {  
          //if(testArray.get(num).blank == false) 
          rightBox = testArray.get(num);
        }
      }
    }
    //}
  }
  
  void SetState2()
  {
    
        if((rightBox != null) && rightBox.left == true) 
          {
            right = true;
          }
         if(leftBox != null && leftBox.right == true) 
          {
            left = true;
          }
         if(upBox != null && upBox.down == true) 
          {
            up = true;
          }
         if(downBox != null && downBox.up == true) 
          {
            down = true;
          }
          
          if(downBox != null) upLength = 1 + downBox.upLength;
          if(upBox != null) downLength = 1 + upBox.upLength;
          if(rightBox != null) leftLength = 1 + rightBox.upLength;
          if(leftBox != null) rightLength = 1 + leftBox.upLength;
    while(set < 2)
    //for(int set = 0; set < 2; set++)
    {
  set++;
      dir = int(random(4));
    if(0 == dir)
    {
      UpSet();
      DownSet();
      LeftSet();
      RightSet();
    
    }
    
    if(1 == dir)
    {
      DownSet();
      LeftSet();
      RightSet();
      UpSet();
    }
    
     if(2 == dir)
    {
      LeftSet();
      RightSet();
      UpSet();
      DownSet();
    }
    
     if(3 == dir)
    {
      RightSet();
      UpSet();
      DownSet();
      LeftSet();
    }
    }
    //incase of genstep1 gap overlap with genstep2
    //if(upRoom != null) up = false;
    //if(downRoom != null) down = false;
    //if(leftRoom != null) left = false;
    //if(rightRoom != null) right = false;
    done = true;
  }
  
  void UpSet()
  {
    chance = -.99;
    if(up) chance++;   
    if(down) chance++;
    if(left) chance++;
    if(right) chance++;
    if (0 == int(random(chance*14*upLength)) && upBox == null) 
    {
      up = true;
    }
  }
  
  void DownSet()
  {
    chance = -.99;
    if(up) chance++;   
    if(down) chance++;
    if(left) chance++;
    if(right) chance++;
    if (0 == int(random(chance*14*downLength)) && downBox == null) 
    {
      down = true;
    }
  }
  
  void LeftSet()
  {
    chance = -.99;
    if(up) chance++;   
    if(down) chance++;
    if(left) chance++;
    if(right) chance++;
    if (0 == int(random(chance*14*leftLength)) && leftBox == null) 
    {
      left = true;
    }
  }
  
  void RightSet()
  {
    chance = -.99;
    if(up) chance++;   
    if(down) chance++;
    if(left) chance++;
    if(right) chance++;
    
    if (0 == int(random(chance*14*rightLength)) && rightBox == null) 
    {
      right = true;
    }
  }
  
  void Generate()
  {
    dir = int(random(4));
    if(0 == dir)
    {
    
    if (upBox == null && up) 
    {
      testArray.add(new ChunkOrigin(x, y+3));
    }
    if (downBox == null && down) 
    {
      testArray.add(new ChunkOrigin(x, y-3));
    }
    if (leftBox == null && left) 
    {
      testArray.add(new ChunkOrigin(x-3, y));
    }
    if (rightBox == null && right) 
    {
      testArray.add(new ChunkOrigin(x+3, y));
    }
    }
    
    
    if(1 == dir)
    {
    if (downBox == null && down) 
    {
      testArray.add(new ChunkOrigin(x, y-3));
    }
    if (leftBox == null && left) 
    {
      testArray.add(new ChunkOrigin(x-3, y));
    }
    if (rightBox == null && right) 
    {
      testArray.add(new ChunkOrigin(x+3, y));
    }
    if (upBox == null && up) 
    {
      testArray.add(new ChunkOrigin(x, y+3));
    }
    }
    if(2 == dir)
    {
    if (leftBox == null && left) 
    {
      testArray.add(new ChunkOrigin(x-3, y));
    }
    if (rightBox == null && right) 
    {
      testArray.add(new ChunkOrigin(x+3, y));
    }
    if (upBox == null && up) 
    {
      testArray.add(new ChunkOrigin(x, y+3));
    }
    if (downBox == null && down) 
    {
      testArray.add(new ChunkOrigin(x, y-3));
    }
    }
    if(3 == dir)
    {
    if (rightBox == null && right) 
    {
      testArray.add(new ChunkOrigin(x+3, y));
    }
    if (upBox == null && up) 
    {
      testArray.add(new ChunkOrigin(x, y+3));
    }
    if (downBox == null && down) 
    {
      testArray.add(new ChunkOrigin(x, y-3));
    }
    if (leftBox == null && left) 
    {
      testArray.add(new ChunkOrigin(x-3, y));
    }
    }
  }
  
  

  
  void Render()
  {
    strokeWeight(0);
    fill(black);
    rect(x*gridSize + width/2 - gridSize/2, y*gridSize + height/2 - gridSize/2, gridSize, gridSize);
    
    if (up)
    {
      if (f3)
      {
      fill(blue);
      }
      else
    {
      fill(black);
    }
    rect(x*gridSize + width/2 - gridSize/2, y*gridSize + height/2 + gridSize - gridSize/2, gridSize, gridSize);
    }
    
    if (down)
    {
      if (f3)
      {
      fill(red);
      }
      else
    {
      fill(black);
    }
    rect(x*gridSize + width/2 - gridSize/2, y*gridSize + height/2 - gridSize - gridSize/2, gridSize, gridSize);
    }
    
    if (left)
    {
      if (f3)
      {
      fill(green);
      }
      else
    {
      fill(black);
    }
    rect(x*gridSize + width/2 - gridSize - gridSize/2, y*gridSize + height/2 - gridSize/2, gridSize, gridSize);
    }
    
    if (right)
    {
      if (f3)
      {
      fill(yellow);
      }
      else
    {
      fill(black);
    }
    rect(x*gridSize + width/2 + gridSize - gridSize/2, y*gridSize + height/2 - gridSize/2, gridSize, gridSize);
    }
  }
  
  
  void Place()
  {
    if (up && uPath == null)
    {
      uPath = new Path();
      uPath.x = x;
      uPath.y = y + 1;
      uPath.down = true;
      uPath.up = true;
    }
    if (down && dPath == null)
    {
      dPath = new Path();
      dPath.x = x;
      dPath.y = y - 1;
      dPath.down = true;
      dPath.up = true;
    }
    if (left && lPath == null)
    {
      lPath = new Path();
      lPath.x = x - 1;
      lPath.y = y;
      lPath.left = true;
      lPath.right = true;
    }
    if (right && rPath == null)
    {
      rPath = new Path();
      rPath.x = x + 1;
      rPath.y = y;
      rPath.left = true;
      rPath.right = true;
    }
  }
  
  
  void Wall()
  {
    if (up == false)
    {
      if (upWall == null && dist(x, y, oX, oY) < rd-3)
      {
        upWall = new FBox(gridSize/3, gridSize/6);
        upWall.setStatic(true);
        upWall.setFillColor(white);
        world.add(upWall);
      }
      if(dist(x, y, oX, oY) > rd-3)
      {
        world.remove(upWall);
      
      }
    if(upWall != null)
     {
        upWall.setPosition(x*gridSize  + width/2, y*gridSize + height/2 + gridSize/4);
        upWall.setWidth(gridSize/3);
        upWall.setHeight(gridSize/6);
     }
      
        
    }
    
    if (down == false)
    {
      if(downWall == null && dist(x, y, oX, oY) < rd-3)
      {
        downWall = new FBox(gridSize/3, gridSize/6);
        downWall.setStatic(true);
        downWall.setFillColor(white);
        world.add(downWall);
      }
        
        if(dist(x, y, oX, oY) > rd-3)
      {
        world.remove(downWall);
        
      }
    if(downWall != null)
     {
        downWall.setPosition(x*gridSize  + width/2, y*gridSize + height/2 - gridSize/4);
        downWall.setWidth(gridSize/3);
        downWall.setHeight(gridSize/6);
     }
      
    }
    if (left == false)
    {
      if(leftWall == null && dist(x, y, oX, oY) < rd-3)
      {
        leftWall = new FBox(gridSize/6, gridSize/1.5);
        leftWall.setStatic(true);
        leftWall.setFillColor(white);
        world.add(leftWall);
        println(x, y, "added");
      }
      if(dist(x, y, oX, oY) > rd-3)
      {
        world.remove(leftWall);
        //println(x, y, "removed");
    
        
      }
       if(leftWall != null)
     {
        leftWall.setPosition(x*gridSize  + width/2  - gridSize/4, y*gridSize + height/2);
        leftWall.setWidth(gridSize/6);
        leftWall.setHeight(gridSize/3);
     }
      
    }
    if (right == false)
    {
      
       if(rightWall == null && dist(x, y, oX, oY) < rd-3)
      {
        rightWall = new FBox(gridSize/6, gridSize/1.5);
        rightWall.setStatic(true);
        rightWall.setFillColor(white);
        world.add(rightWall);
      }
      if(dist(x, y, oX, oY) > rd-3)
      {
        world.remove(rightWall);
      
        
      }
     if(rightWall != null)
     {
        rightWall.setPosition(x*gridSize  + width/2  + gridSize/4, y*gridSize + height/2);
        rightWall.setWidth(gridSize/6);
        rightWall.setHeight(gridSize/3);
     }
      
    }
  }
  
  void RoomGen()
  {
    if (upBox == null || (upBox != null && upBox.blank == true))
    {
      upRoom = new RoomBlock();

      upRoom.x = x;
      upRoom.y = y + 2;

      upRoom.up = true;
      testArray.add(new BlankBlock(x, y+3));

    }
    if (downBox == null || (downBox != null && downBox.blank == true))
    {
      downRoom = new RoomBlock();

      downRoom.x = x;
      downRoom.y = y - 2;

      downRoom.down = true;
      testArray.add(new BlankBlock(x, y-3));

    }
    if (leftBox == null || (leftBox != null && leftBox.blank == true))
    {
      leftRoom = new RoomBlock();

      leftRoom.x = x - 2;
      leftRoom.y = y;

      leftRoom.left = true;
      testArray.add(new BlankBlock(x-3, y));

    }
    if (rightBox == null || (rightBox != null && rightBox.blank == true))
    {
      rightRoom = new RoomBlock();

      rightRoom.x = x + 2;
      rightRoom.y = y;

      rightRoom.right = true;
      testArray.add(new BlankBlock(x+3, y));


    }
  //println("room");
  }
}
