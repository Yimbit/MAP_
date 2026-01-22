class BlankBlock extends ChunkOrigin

{
  BlankBlock(int ix, int iy)
  {
  super(1, 1);
  left = false;
  right = false;
  up = false;
  down = false;
  
  x = ix;
  y = iy;
  done = true;
  done2 = true;
  blank = true;
  blankArray.add(this);
  if (tempArray != null) tempArray.remove(this);

  }
  
  
  void Render()
  {

    if(f3) 
    {
      strokeWeight(.05*gridSize);
      stroke(0, 200, 255);
      fill(255, 255, 255, 10);

      rect(x*gridSize + width/2 - gridSize/2, y*gridSize + height/2  - gridSize/2, gridSize, gridSize);
    }
    
  
  }
  void BlankDraw()
  {
    
    if(f3) fill(255, 200, 255);
    if(f3 == false) fill(black);
    rect(x*gridSize + width/2 - gridSize/6, y*gridSize + height/2  - gridSize/6, gridSize/3, gridSize/3);
    
  }
}
