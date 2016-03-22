import peasy.*;
PeasyCam cam;

float time;

void setup() {
  size(640, 480, P3D);
  cam = new PeasyCam(this, 1000); 

  stroke(255);
  noFill();
}

void draw() {
  smooth();
  background(0);
 
  for(float x = 0; x <= width; x += 10){
    beginShape();
      for(float z = 0; z >= -width; z -= 5){
        float primary = cos((x+z)/100+time) * 100;
        float secondary = noise(x/100, z/100, time) * 50;
  
        vertex(x, primary + secondary, z);
      }
    endShape();
  }
  
  time += .05; 
}
