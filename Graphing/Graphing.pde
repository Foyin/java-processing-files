//Click and hold for bargraph

final String filename = "scitech-spending.csv";
String[] lines;
int numSectors;
int[] numSpent;
String[] sectorNames;
color[] colorWheel = new color[7];
int pad;
sector sectorGraph;
sector sectorCircle;

class sector
{
  String name;
  int amount;
  int xpos;
  int ypos;
 
  sector(String n, int a, int x, int y){
  name = n;
  amount = a;
  xpos = x;
  ypos = y;
  }
}

void setup()
{
  size(500, 600);
  
  lines = loadStrings(filename);
  numSectors = lines.length - 6;
  numSpent = new int[numSectors];
  sectorNames = new String[numSectors];
  
  int lineIndex = 0;
  while (lineIndex < lines.length)
  {
    
    if (lineIndex < 1 || lineIndex >= lines.length - 5)
    {
      lineIndex++;
      continue;
    }
  
    int sectorNum = lineIndex - 1;
    String[] splitLine = lines[lineIndex].split(",");
    sectorNames[sectorNum] = splitLine[0];
    numSpent[sectorNum] = Integer.parseInt(splitLine[1]);
    lineIndex++;
  }
  
 drawLinegraph(sectorGraph);
}

void draw()
{
  smooth();
  fill(0);
  text("Domestic spending on research and development (GERD),", 20, 20);
  text("funding sector, by province (Canada) in 2012", 20, 40);
  fill(255, 10);
  text("(Click and hold for different graph)", 20, 70);
  
  fill(170);
  stroke(170);
  rect(0, 0, 10, height);
  
  int gridPointWidth = width;
  int gridPointX = 0;
  int gridPointY = height;
  fill(255);
  while(gridPointY > 0)
 {
   stroke(170);
   rect(gridPointX, gridPointY, gridPointWidth, 0.0001);
   gridPointY -= 70;
 }
}

void drawBargraph(sector sectorGraph)
{
  pad = 40;
  for(int i = 0; i < numSectors; i++)
  {
    sectorGraph = new sector(sectorNames[i], numSpent[i]/70, 40, height - numSpent[i]/70);
    noStroke();
    fill(255);
    rect(sectorGraph.xpos + pad, sectorGraph.ypos, 20, sectorGraph.amount);
    fill(0);
    text(sectorNames[i], sectorGraph.xpos + pad, sectorGraph.ypos);
    pad += 60;
  }
}



void drawLinegraph(sector sectorGraph)
{
  int lastX = 80;
  int lastY = height - 31307/70;
  pad = 40;
  for(int i = 0; i < numSectors; i++)
  {
    sectorGraph = new sector(sectorNames[i], numSpent[i]/70, 40, height - numSpent[i]/70);
    
    stroke(255, 0, 0);

    line(lastX, lastY, sectorGraph.xpos + pad, sectorGraph.ypos);
    lastX = sectorGraph.xpos + pad;
    lastY = sectorGraph.ypos;
    fill(0);
    ellipse(sectorGraph.xpos + pad, sectorGraph.ypos, 5, 5);
    text(sectorNames[i], sectorGraph.xpos + pad, sectorGraph.ypos);
    pad += 60;
  }
}

void mousePressed()
{
  background(190);
  
  drawBargraph(sectorGraph);
}

void mouseReleased()
{
  background(190);
  drawLinegraph(sectorGraph);
  
}