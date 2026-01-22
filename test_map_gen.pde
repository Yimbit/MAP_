ArrayList<ChunkOrigin> testArray = new ArrayList<ChunkOrigin>();
ArrayList<ChunkOrigin> roomArray = new ArrayList<ChunkOrigin>();
ArrayList<ChunkOrigin> pathArray = new ArrayList<ChunkOrigin>();
ArrayList<ChunkOrigin> megaArray = new ArrayList<ChunkOrigin>();
ArrayList<ChunkOrigin> blankArray = new ArrayList<ChunkOrigin>();
ArrayList<ChunkOrigin> tempArray;

ArrayList<FBox> solids = new ArrayList<FBox>();

int genNum;
int testNum;

int throwaway = 0; 

float oX;
float oY;
void StartGen()
{
  testArray.add(new ChunkOrigin(0, 0));
  testArray.get(0).up = true;
}

void GenStep(int range, ArrayList<ChunkOrigin> array)
{
   //while(testNum < testArray.size())
   //{
   
   
   //}
   
     //testArray.get(testNum).SetState2();
     //testArray.get(testNum).Generate();
     //testNum++;
   int number = array.size() + range;
  for(int n = 0; n < array.size(); n++)
  {
    //testArray.get(n).SetState2();
    //testArray.get(n).Generate();
    //testArray.get(n).Place();   
    //testArray.get(n).Render();
    
    

    if(array.size() < number && array.get(n).done == false)
    //if(dist(testArray.get(n).x, testArray.get(n).y, oX, oY) < range && testArray.get(n).done == false)
    {
      array.get(n).SetState();
      array.get(n).SetState2();
      array.get(n).Generate();
      array.get(n).Place();
    }
  }
  
}


void GenStep2(int range)
{
  
  
  for(int n = 0; n < testArray.size(); n++)
  {
   //int number = testArray.size() + range*10;
    
    if(InSquare(testArray.get(n), range) && testArray.get(n).done2 == false && testArray.get(n).done == true)
    //if(testArray.size() < number && testArray.get(n).done2 == false)
    {
      testArray.get(n).SetState();
      testArray.get(n).RoomGen();
      testArray.get(n).done2 = true;

    }
  }
}



void GenStep3()
{
  for(int n = 0; n < roomArray.size(); n++)
  //int n = throwaway;
  {  
    if (InSquare(roomArray.get(n), 60))
    {
      if(roomArray.get(n).done == false) 
      {
        roomArray.get(n).Generate();
        roomArray.get(n).done = true;
      }

    }
  }

  
}

void GenStep4()
{
  for(int n = 0; n < roomArray.size(); n++)
  {
    if (InSquare(roomArray.get(n), 55) && roomArray.get(n).done == true && roomArray.get(n).done2 == false) 
    {
      roomArray.get(n).RoomGen();
      roomArray.get(n).done2 = true;
    }
  
  }

}



void GenSolid()
{
  
  for (int y = int(oY) - 10; y < int(oY + 10); y++)
  {
    for (int x = int(oX) - 10; x < int(oX + 10); x++)
    {
      
      
      
      boolean add = true;
          
          
      for(ChunkOrigin thing:megaArray)
      {
        if (thing.x == x && thing.y == y && thing.blank == false)
        {
          add = false;
        }
      }
      for(FBox thing:solids)
      {
        if (thing.getX() == x*gridSize + width/2 && thing.getY() == y*gridSize + height/2)
        {
          add = false;
        }
      }
      
      if(add)
      {
        FBox solid = new FBox(gridSize, gridSize);
        solid.setStatic(true);
        solid.setFillColor(color(0, 0, 0));
        solid.setPosition(x*gridSize + width/2, y*gridSize + height/2);
        world.add(solid);
        solids.add(solid);
      }
    }
  }
    
}

void SolidStep()
{
  
  for(int n = 0; n < solids.size(); n++)
  {
    
    solids.get(n).setFillColor(color(20, 90, 80, 255-dist((solids.get(n).getX()-width/2)/gridSize, (solids.get(n).getY()-height/2)/gridSize, oX, oY)*20));
      
    if ((solids.get(n).getX() - width/2)/gridSize < oX - 11 || (solids.get(n).getX() - width/2)/gridSize > oX + 11 || (solids.get(n).getY() - height/2)/gridSize < oY - 11 || (solids.get(n).getY() - height/2)/gridSize > oY + 11)
    {
      world.remove(solids.get(n));
      solids.remove(solids.get(n));
      println("removed", solids.size());
      
    }
  }
  GenSolid();
}

void GenDraw()
{
  strokeWeight(0);
  for(int n = 0; n < megaArray.size(); n++)
  {    
    if(InSquare(megaArray.get(n), rd))
    //if(testArray.get(n).x > oX - rd && testArray.get(n).x < oX + rd && testArray.get(n).y > oY - rd && testArray.get(n).y < oY + rd) 
    {
      strokeWeight(0);
      stroke(0);
      megaArray.get(n).Render();
      

 
    } 

    
    
  }
  //for(int n = 0; n < roomArray.size(); n++)
  //{  
  //   roomArray.get(n).Render();
  //}
  
}

void Zoom()
{
  if (upKey)
  {
    
  }
}

void mousePressed()
{
  
  for(ChunkOrigin thing: megaArray)
  {
    if (thing.x == moX && thing.y == moY)
    {
      println("x, y:", thing.x, thing.y, "UDLR:", thing.up, thing.down, thing.left, thing.right, "COMPLETION:", thing.done, thing.done2, "ADJACENT:", thing.upBox != null, thing.downBox != null, thing.leftBox != null, thing.rightBox != null, "LENGTH:", thing.upLength, thing.downLength, thing.leftLength, thing.rightLength);
    }
  }
  
  //GenSolid();
  //println(solids.size());
  

  //GenStep3();
  //generate = true;
  
  //println(testArray.get(0).x, testArray.get(0).y, testArray.get(0).leftWall);
  //for(int n = 0; n<testArray.size(); n++)
  //{
  //  println(n, testArray.get(n).x, testArray.get(n).y,(testArray.get(n).upBox == null), (testArray.get(n).downBox == null), (testArray.get(n).leftBox == null), (testArray.get(n).rightBox == null))
  //;}
}

// (testArray.get(n).upBox == null), (testArray.get(n).downBox == null), (testArray.get(n).leftBox == null), (testArray.get(n).rightBox == null)
