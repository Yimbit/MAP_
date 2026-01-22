class Path extends ChunkOrigin

{
  
  
  Path()
  {
  super(1, 1);
  left = false;
  right = false;
  up = false;
  down = false;
  
  pathArray.add(this);
  //megaArray.add(this);

  if (tempArray != null) tempArray.remove(this);

  }
  
  void Render()
  {
    if(f3) fill(0, 0, 0, 0);
    if(f3 == false) fill(0, 0, 0);
    rect(x*gridSize + width/2 - gridSize/2, y*gridSize + height/2  - gridSize/2, gridSize, gridSize);
    
  }
  
  
}
