import fisica.*;
FWorld world;
FCompound compound;
boolean generate = true;

boolean mapMode = false;

PImage map;
float gridSize = 35;//TOGGLE: 35 NORMAL, 1.5 DEBUG (TURN OFF SOLID FIRST)

color white = color(255, 255, 255, 150);
color black = color(0, 0, 0);
color red = color(255, 0, 0, 150);
color blue = color(0, 0, 255, 150);
color green = color(0, 255, 0, 150);
color yellow = color(255, 255, 0, 150);

int cX = 0;
int cY = 0;

int pathDensity = 70;//TOGGLE: 120 HIGH, 70 LOW

int moX;
int moY;

ChunkOrigin cItem;

boolean f3 = false;

int rd = 10;//TOGGLE: 10 NORMAL, 300 DEBUG

FPlayer player;

void setup()
{
  size(600, 600);
  Fisica.init(this);
  
  world = new FWorld(-200000, -200000, 200000, 200000);
  world.setGravity(0, 0);
  
  map = loadImage("map2.png");
  
  //for (int y = 0; y < map.height; y++)
  //{
  //  for (int x = 0; x < map.width; x++)
  //  {
  //    color c = map.get(x, y);
  //    if (c == black)
  //    {
  //      FBox b = new FBox(gridSize, gridSize);
  //      b.setPosition(x*gridSize + gridSize/2, y*gridSize + gridSize/2);
  //      b.setStatic(true);
  //      b.setFillColor(black);
  //      world.add(b);
  //    }
  //  }
  //}
  player = new FPlayer();
  world.add(player);
  
      //oX=width/2;
      //oY=height/2;
      StartGen();
      
      oX = (player.getX() - width/2)/gridSize;
      oY = (player.getY() - height/2)/gridSize;
      GenStep(1200, testArray);
      for(int n = 0; n < testArray.size(); n++)
  {
    if(testArray.get(n).done == false && InSquare(testArray.get(n), pathDensity-40))
    {
      tempArray = new ArrayList<ChunkOrigin>();
      //cItem = testArray.get(n);
      tempArray.add(testArray.get(n));
      GenStep(1200, tempArray);
    }
  }
      //GenStep2(40);
      //GenStep();
      //GenStep();
}

void draw()
{
  //GenStep();
  //background(120, 180, 255);
  background(0, 0, 10);
 
  fill (0, 0, 20);
  if(mapMode)fill(50, 80, 150);
  rect(width/2 - gridSize*rd, height/2 - gridSize*rd, gridSize*rd*2, gridSize*rd*2);
  
  if(f3)
  {
  //fill (155, 50, 155, 50);
  //circle(cX*gridSize + width/2, cY*gridSize + height/2, 240 * gridSize *2);
  fill (155, 0, 5, 50);
  rect(width/2 - gridSize*pathDensity, height/2 - gridSize*pathDensity, gridSize*pathDensity*2, gridSize*pathDensity*2);
  fill (155, 0, 0, 50);
  rect(width/2 - gridSize*80, height/2 - gridSize*80, gridSize*160, gridSize*160);
  fill (155, 50, 0, 80);
  rect(width/2 - gridSize*60, height/2 - gridSize*60, gridSize*120, gridSize*120);
  fill (55, 50, 0, 80);
  rect(width/2 - gridSize*55, height/2 - gridSize*55, gridSize*110, gridSize*110);
  }
  
  
  
  world.step();
  player.Move();
  
 if (generate)
 {
   //oX = int((player.getX() - width/2)/gridSize);
   //oY = int((player.getY() - height/2)/gridSize);
   //oX = int((mouseX - width/2)/gridSize);
   //oY = int((mouseY - height/2)/gridSize);
   
 
 
 }
  
 

  //image(map, 0, 0);
  pushMatrix();
  translate((-player.getX() + width/2), -player.getY() + height/2);
  
  //if(f3)
  //{
  //fill (155, 50, 155, 50);
  //circle(cX*gridSize + width/2, cY*gridSize + height/2, 240 * gridSize *2);
  //fill (155, 0, 5, 50);
  //circle(cX*gridSize + width/2, cY*gridSize + height/2, 180 * gridSize *2);
  //fill (155, 0, 0, 50);
  //rect(width/2 - gridSize*40 + cX*gridSize, height/2 - gridSize*40 + cY*gridSize, gridSize*80, gridSize*80);
  //}
  
  //if (int(dist(oX, oY, cX, cY)) == 40)
  //{
  //  cX = int(oX);
  //  cY = int(oY);
  //  GenStep(240);
  //  GenStep2(40);
  //}
  
  GenStep1();
  GenStep2(80);
  testArray.removeIf(thing -> thing instanceof BlankBlock && InSquare(thing, 50));
  megaArray.removeIf(thing -> thing instanceof BlankBlock && InSquare(thing, 50));
  GenStep3();//TOGGLE SOLID, 4, 3, AND 2 FOR ONLY PATHS
  GenStep4();//TOGGLE FOR EMPTY ROOMS
  if(mapMode == false)SolidStep();//TOGGLE FOR SOLID WALLS
  

  GenDraw();
  world.draw();
  popMatrix();
  
  if (f3)
  {
    strokeWeight(0);
    fill(0, 0, 0, 80);
    rect(width-200, 0, 200, 300);
    textSize(20);
    fill(white);
    textAlign(RIGHT);
    text("rd: " + rd, width-10, 30);
    text("gridSize: " + gridSize, width-10, 60);
    text("oX: " + oX, width-10, 90);
    text("oY: " + oY, width-10, 120);
    text("moX: " + moX, width-10, 150);
    text("moY: " + moY, width-10, 180);
  }
 
}

void GenStep1()
{
  for(int n = 0; n < testArray.size(); n++)
  {
    if(testArray.get(n).done == false && InSquare(testArray.get(n), int(random(pathDensity, pathDensity+2))))
    {
      tempArray = new ArrayList<ChunkOrigin>();
      //cItem = testArray.get(n);
      tempArray.add(testArray.get(n));
      GenStep(120, tempArray);
    }
    
    //if(InSquare(testArray.get(n), 80))
    //if(testArray.get(n).done == true && testArray.get(n).done2 == false && InSquare(testArray.get(n), 80))
    //{
      
    //  //
    //  //
      
    //}
  }
}
boolean InSquare(ChunkOrigin item, int range)
{
  if(item.x < range + oX && item.x > -range + oX && item.y < range + oY && item.y > -range + oY)
  {
    return true;
  }
  else
  {
    return false;
  }
 
}
