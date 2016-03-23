/*
import peasy.*;
PeasyCam cam;
*/
float time;
float longitud = 100; 
int radio = 700;

void setup() {
  size(640, 480, P3D);
//  cam = new PeasyCam(this, 1000); 

  stroke(255);
  noFill();
}

void draw() {
  smooth();
  background(0);
  strokeWeight(4);
  /*
  for(float x = 0; x <= width; x += 10){
   beginShape();
   for(float z = 0; z >= -width; z -= 5){
   float primary = cos((x+z)/100+time) * 100;
   float secondary = noise(x/100, z/100, time) * 50;
   
   vertex(x, primary + secondary, z);
   }
   endShape();
   }*/
  camera(sin(frameCount*0.01)*radio, 250,cos(frameCount*0.01)*radio, 0, 0, 0, 0, -1, 0);

  stroke(50, 50, 255);

  for (float x = -width/2; x <= width/2; x += 40) {
    for (float z = width/2; z >= -width/2; z -= 40) {
      float primary = cos((x+z)/100+time) * 100;
      float secondary = noise(x/100, z/100, time) * 50;
      line(x, primary + secondary, z, x, primary + secondary+longitud, z);
    }
  }

  time += .05;
}

