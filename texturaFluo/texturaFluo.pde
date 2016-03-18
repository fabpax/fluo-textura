
/*
TECLAS:
S: png
P: PDF
 */

// imports
import generativedesign.*;
import processing.pdf.*;


// parametros principales
int xCount = 60;
int yCount = 60;
float gridSize = 600;

float pcX, pcY, pcZ; //pos camara
int radio = 50;

// array nodos
Node[] myNodes = new Node[xCount*yCount];

// attractor
Attractor myAttractor;

// im output
boolean saveOneFrame = false;
boolean saveToPrint = false;



void setup() {  
  size(800, 800, OPENGL); 

  // setup drawing parameters
  colorMode(RGB, 255, 255, 255, 100);
  smooth();
  stroke(3);
  fill(0);

  background(255); 


  // nodos reticula
  initGrid();

  // setup attractor
  myAttractor = new Attractor(0, 0);
}

void draw() {
  if (saveToPrint) {
    beginRecord(PDF, ".pdf");
  }

  background(255);
   update();
  camera(pcX, pcY, pcZ, 0, 0, 0, 0, -1, 0); 

  for (int i = 0; i < myNodes.length; i++) {
      myAttractor.attract(myNodes[i]);
    
    if (saveToPrint) {
      ellipse(myNodes[i].x, myNodes[i].y, 2, 2);
    }
    else {
      rect(myNodes[i].x, myNodes[i].y, 1, 1);
    }
  }


  // image output
  if (saveToPrint) { 
    saveToPrint = false;
    endRecord();
  }

  if (saveOneFrame == true) {
    saveFrame(".png");
    saveOneFrame = false;
  }
}


void initGrid() {
  int i = 0; 
  for (int y = 0; y < yCount; y++) {
    for (int x = 0; x < xCount; x++) {
      float xPos = x*(gridSize/(xCount-1))+(width-gridSize)/2;
      float yPos = y*(gridSize/(yCount-1))+(height-gridSize)/2;
      myNodes[i] = new Node(xPos, yPos);
      myNodes[i].setBoundary(0, 0, width, height);
      myNodes[i].setDamping(0.8);  //// 0.0 - 1.0
      i++;
    }
  }
}


void keyPressed() {
  if (key=='r' || key=='R') {
    initGrid();
  }

  if (key=='s' || key=='S') {
    saveOneFrame = true;
  }
  if (key=='p' || key=='P') {
    saveToPrint = true; 
    saveOneFrame = true; 
    println("saving to pdf - starting (this may take some time)");
  }
}


void update() {
  pcY=radio;
  pcX = sin(frameCount*0.01)*radio;
  pcZ = cos(frameCount*0.01)*radio;
}










