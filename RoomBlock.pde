class RoomBlock extends ChunkOrigin

{
  
  
  int border = 0;
  boolean entrance = false;
  
  RoomBlock(int ix, int iy, boolean u, boolean d, boolean l, boolean r, boolean comp1, boolean comp2)
  {
  super(1, 1);
  left = l;
  right = r;
  up = u;
  down = d;
  
  done = comp1;
  done2 = comp2;
  
  x = ix;
  y = iy;
  

  testArray.add(new BlankBlock(x+5, y));
  testArray.add(new BlankBlock(x-5, y));
  testArray.add(new BlankBlock(x, y+5));
  testArray.add(new BlankBlock(x, y-5));
  testArray.add(new BlankBlock(x+5, y+1));
  testArray.add(new BlankBlock(x-5, y+1));
  testArray.add(new BlankBlock(x+1, y+5));
  testArray.add(new BlankBlock(x+1, y-5));
  testArray.add(new BlankBlock(x+5, y-1));
  testArray.add(new BlankBlock(x-5, y-1));
  testArray.add(new BlankBlock(x-1, y+5));
  testArray.add(new BlankBlock(x-1, y-5));
  testArray.add(new BlankBlock(x+5, y+5));
  testArray.add(new BlankBlock(x-5, y+5));
  testArray.add(new BlankBlock(x-5, y-5));
  testArray.add(new BlankBlock(x+5, y-5));
  testArray.add(new BlankBlock(x+5, y+4));
  testArray.add(new BlankBlock(x+4, y+5));
  testArray.add(new BlankBlock(x-4, y+5));
  testArray.add(new BlankBlock(x-5, y+4));
  testArray.add(new BlankBlock(x-4, y-5));
  testArray.add(new BlankBlock(x-5, y-4));
  testArray.add(new BlankBlock(x+4, y-5));
  testArray.add(new BlankBlock(x+5, y-4));
  //megaArray.add(this);
  }
  
  RoomBlock()
  {
  super(1, 1);
  left = false;
  right = false;
  up = false;
  down = false;
  
  roomArray.add(this);
  //testArray.add(new BlankBlock(x+5, y));
  //testArray.add(new BlankBlock(x-5, y));
  //testArray.add(new BlankBlock(x, y+5));
  //testArray.add(new BlankBlock(x, y-5));
  //testArray.add(new BlankBlock(x+5, y+5));
  //testArray.add(new BlankBlock(x-5, y+5));
  //testArray.add(new BlankBlock(x-5, y-5));
  //testArray.add(new BlankBlock(x+5, y-5));
  //megaArray.add(this);
  }
  
  void Generate()
  {
    entrance = (0 == int(random(8)));
    boolean ok = false;
    for(ChunkOrigin thing:testArray)
    {
      if(InSquare(thing, 80))
      {
      
      if(up && thing.x == x && thing.y == y-2 && thing.blank == false) ok = true;
      if(down && thing.x == x && thing.y == y+2 && thing.blank == false) ok = true;
      if(left && thing.x == x+2 && thing.y == y && thing.blank == false) ok = true;
      if(up && thing.x == x-2 && thing.y == y && thing.blank == false) ok = true;  
      }
    }
    
    if (ok == false) entrance = false;
    
    
    //int n = throwaway;
    for (int n = 0; n < roomArray.size(); n++)
    {  //<>//
      if (InSquare(roomArray.get(n), 80))
      {
      if (up == true && roomArray.get(n).x == x + 1 && roomArray.get(n).y == y) done = true;
      if (up == true && roomArray.get(n).x == x && roomArray.get(n).y == y + 1) 
      {
        done = true;
        //entrance = false;
      }
      if (up == true && roomArray.get(n).x == x && roomArray.get(n).y == y - 1) done = true;
      
      
      if (down == true && roomArray.get(n).x == x - 1 && roomArray.get(n).y == y) done = true;
      if (down == true && roomArray.get(n).x == x && roomArray.get(n).y == y - 1) 
      {
        done = true;
        //entrance = false;
      }
      if (down == true && roomArray.get(n).x == x && roomArray.get(n).y == y + 1) done = true;
      
      if (left == true && roomArray.get(n).x == x && roomArray.get(n).y == y + 1) done = true;
      if (left == true && roomArray.get(n).x == x - 1 && roomArray.get(n).y == y) 
      {
        done = true;    
        //entrance = false;
      }
      if (left == true && roomArray.get(n).x == x + 1 && roomArray.get(n).y == y) done = true;    
      
      if (right == true && roomArray.get(n).x == x && roomArray.get(n).y == y - 1) done = true;
      if (right == true && roomArray.get(n).x == x + 1 && roomArray.get(n).y == y) 
      {
        done = true;
        //entrance = false;
      }
      if (right == true && roomArray.get(n).x == x - 1 && roomArray.get(n).y == y) done = true;
      
      

      if (up == true && roomArray.get(n).x == x && roomArray.get(n).y == y - 2) 
      {
        if(done == false) roomArray.add(new RoomBlock(x, y - 1, false, false, false, true, true, false));
        entrance = false;

      }
      if (down == true && roomArray.get(n).x == x && roomArray.get(n).y == y + 2) 
      {
        if(done == false) roomArray.add(new RoomBlock(x, y + 1, false, false, true, false, true, false));
        entrance = false;
 
      }
      if (left == true && roomArray.get(n).x == x + 2 && roomArray.get(n).y == y) 
      {
        if(done == false) roomArray.add(new RoomBlock(x + 1, y, true, false, false, false, true, false));
        entrance = false;
 
      }
      if (right == true && roomArray.get(n).x == x - 2 && roomArray.get(n).y == y) 
      {
        if(done == false) roomArray.add(new RoomBlock(x - 1, y, false, true, false, false, true, false));
        entrance = false;

      }
      
      
      //println("done", up, down, left, right, x, y);
      }
      
      //if(roomArray.get(n).x == x && roomArray.get(n).y == y+1) border++;
      //if(roomArray.get(n).x == x && roomArray.get(n).y == y-1) border++;
      //if(roomArray.get(n).x == x+1 && roomArray.get(n).y == y) border++;
      //if(roomArray.get(n).x == x-1 && roomArray.get(n).y == y) border++;
      
      //if(border >= 2) done = true;
    }
      if (done == false && up) roomArray.add(new RoomBlock(x + 1, y, true, false, false, false, false, false));
      if (done == false && down) roomArray.add(new RoomBlock(x - 1, y, false, true, false, false, false, false));
      if (done == false && left) roomArray.add(new RoomBlock(x, y + 1, false, false, true, false, false, false));
      if (done == false && right) roomArray.add(new RoomBlock(x, y - 1, false, false, false, true, false, false));
      
      done = true;
    //println("done2", done, x, y);
    //throwaway++;
  }
  
  void RoomGen()
  {
      if(up && entrance)roomArray.add(new RoomBlock(x, y-1, false, false, false, false, true, true));
      if(down && entrance)roomArray.add(new RoomBlock(x, y+1, false, false, false, false, true, true));
      if(left && entrance)roomArray.add(new RoomBlock(x+1, y, false, false, false, false, true, true));
      if(right && entrance)roomArray.add(new RoomBlock(x-1, y, false, false, false, false, true, true));
  
    for (int n = 0; n < roomArray.size(); n++)
    { 
      if(InSquare(roomArray.get(n), 80))
      {
      if (up == true && roomArray.get(n).x == x && roomArray.get(n).y == y+1) up = false;
      if (down == true && roomArray.get(n).x == x && roomArray.get(n).y == y-1) down = false;
      if (left == true && roomArray.get(n).x == x-1 && roomArray.get(n).y == y) left = false;
      if (right == true && roomArray.get(n).x == x+1 && roomArray.get(n).y == y) right = false;
      
      if (up == false && down == false && left == false && right == false) done2 = true;
      }
    }
      if(up && done2 == false) 
      {
        roomArray.add(new RoomBlock(x, y+1, true, false, true, true, true, false));
        //testArray.add(new BlankBlock(x, y+1));
      }
      if(down && done2 == false) 
      {
        roomArray.add(new RoomBlock(x, y-1, false, true, true, true, true, false));
        //testArray.add(new BlankBlock(x, y-1));
      }
      if(left && done2 == false) 
      {
        roomArray.add(new RoomBlock(x-1, y, true, true, true, false, true, false));
        //testArray.add(new BlankBlock(x-1, y));
      }
      if(right && done2 == false) 
      {
        roomArray.add(new RoomBlock(x+1, y, true, true, false, true, true, false));
        //testArray.add(new BlankBlock(x+1, y));
      }


      
      
  }
  
  void Render()
  {
    strokeWeight(0);
    if(f3) fill(100, 200, 255, 100);
    if(f3 && entrance) fill(white);
    if(f3 == false) fill(0, 0, 0, 255);
    rect(x*gridSize + width/2 - gridSize/2, y*gridSize + height/2  - gridSize/2, gridSize, gridSize);
    
  }
}
