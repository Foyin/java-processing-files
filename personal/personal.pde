// boxx.displayboxx(), is the modular display function
// use directional pad to move around
color green;
color lightGreen;
color yellow;
color brown;
color darkBrown;
color field;


//save data
color sCtrunk;
color sCleaves;
float sXtree;
float sYtree;
float streeWidth;
float streeHeight;
float streeSize;
float sleavesWidth;
float sleavesHeight;

color[] leavesColor = new color[4];
int numTrees = 20;
tree mytree1;

boxx b1;


void setup() {
  
  size (900,500);

  b1 = new boxx(width/2, height/2, 50, 50, 3, 3);
  
  
  rectMode(CENTER);
  green = color(2, 188, 3);
  lightGreen = color(66, 242, 73);
  yellow = color(200, 200, 0);
  brown = color(242, 148, 5);
  darkBrown = color(113, 69, 1);
  field = color(67, 170, 71);
  
    
  leavesColor[0] = green;
  leavesColor[1] = lightGreen;
  leavesColor[2] = yellow;
  leavesColor[3] = brown;
  
  sCtrunk = darkBrown;
  sCleaves = leavesColor[(int)random(4)];
  sXtree = random(width);
  sYtree = random(height/4, height*3/4);
  streeWidth = random(20, 30);
  streeHeight = random(60, 150);
  sleavesWidth = random(60, 100);
  sleavesHeight = random(50, 100);

   /*for(int i = 0; i < numTrees; i++){
     mytree1 = new tree(sCtrunk, sCleaves, 
                        sXtree, sYtree, 
                        streeWidth, streeHeight, 
                        sleavesWidth, sleavesHeight);  
    mytree1.drawTree();
  }*/
  


}


void draw() {
  
  background(255);
  b1.y += b1.yspeed;
  b1.x += b1.xspeed;
  if (b1.x < 0) {
    b1.x = 0;
  }
  else if (b1.x+b1.breadth > width) {
    b1.x = width-b1.breadth;
  }
  
   //left/right boundary
  if ( b1.x < 0 || b1.x+b1.breadth >= width ) {
    b1.xspeed = 0;
  
  }
b1.dog();
moveSpot(b1.x, b1.y);


}

void keyPressed() {
  if (keyCode == LEFT || key == 'a') {
    b1.xspeed = 3;
    b1.xspeed *= -1;
  }
  else if (keyCode == RIGHT || key == 'd') {
    b1.xspeed = 3;
    b1.xspeed += b1.xspeed;
  }
  else if (keyCode == UP || key == 'w') {
    b1.yspeed = 3;
    b1.yspeed *= -1;
  }
  else if (keyCode == DOWN || key == 's') {
    b1.yspeed = 3;
    b1.yspeed += b1.yspeed;
  }

}
 
void keyReleased() {
  if (key == 's' || key == 'a' || keyCode == LEFT || keyCode == RIGHT) {
    b1.xspeed = 0;
  }
  else if(key == 'w' || key == 's' || keyCode == UP || keyCode == DOWN){
    b1.yspeed = 0;
  }
 
}

public class boxx{
int x;
int y;
int breadth;
int lengthh;
int xspeed;
int yspeed;
int weight;

boxx(int xpos, int ypos, int b, int l, int xs, int ys){
x = xpos;
y = ypos;
breadth = b;
lengthh = l;
xspeed = xs;
yspeed = ys;
}


void dog()
{
 int breadth = 100;
 color brown = color(219, 116, 4);
 color darkbrown = color(95, 49, 0);
 color pink = color(255, 201, 252);
 int i = 0;

 
 rectMode(CENTER);
 fill(darkbrown);
 rect(x - 20, y + breadth/2, 25, 25); //left foot
 rect(x + 20, y + breadth/2, 25, 25); //right foot
 stroke(0);
 fill(brown);
 ellipse(x, y, breadth +20, breadth +20); //body
 noStroke();
 fill(darkbrown);
 ellipse(x - breadth/2, y + 20, 20, breadth ); //left ear
 ellipse(x + breadth/2, y + 20, 20, breadth ); //right ear
 fill(brown);
 stroke(0);
 ellipse(x, y, breadth, breadth); //face
 noStroke();
 fill(0);
 ellipse(x, y, breadth/5, breadth/5); //nose
 fill(255);
 ellipse(x - 20, y - 18, 35, 35); //left eye cornea
 ellipse(x + 20, y - 18, 35, 35); //right eye cornea
 fill(2, 180, 232);
 ellipse(x - 20, y - 18, 15, 15); //left eye pupil
 ellipse(x + 20, y - 18, 15, 15); //right eye pupil
 fill(darkbrown);
 ellipse(x - 20, y + breadth/2 + 15, 25, 25); //left foot
 ellipse(x + 20, y + breadth/2 + 15, 25, 25); //right foot

 //tongue
 fill(pink);
 rectMode(CENTER);
 rect(x, y + 25, 15, 20 );
 ellipse(x, y +35, 15, 10 );
}

void displayBoxx(){
  color blue = color(125, 224, 252);
  fill(blue);
  stroke(blue);
  rect(x, y, 30, 30);
  }

}

public class tree { 
  color Ctrunk;
  color Cleaves;
  float Xtree;
  float Ytree;
  float treeWidth;
  float treeHeight;
  float treeSize;
  float leavesWidth;
  float leavesHeight;

  // The Constructor is defined with arguments.
  tree(color cT, color cL, 
       float x, float y, 
       float tWidth, float tHeight, 
       float lW,   float lH) { 
    
    Ctrunk = cT;
    Cleaves = cL;
    Xtree = x;
    Ytree = y;
    treeWidth = tWidth;
    treeHeight = tHeight;
    leavesWidth = lW;

    leavesHeight = lH;
  }

  void drawTree() {
   
    
    fill(Ctrunk);
    stroke(Ctrunk);
    rect(Xtree, Ytree, treeWidth, treeHeight);
    fill(Cleaves);
    stroke(Cleaves);
    ellipse(Xtree, Ytree - treeHeight/2, leavesWidth, leavesHeight);
  }
  
  
{

}
}