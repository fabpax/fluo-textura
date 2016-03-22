import peasy.*;
PeasyCam cam;

float time;
float longitud = 100; 

void setup() {
  size(640, 480, P3D);
  cam = new PeasyCam(this, 1000); 

  stroke(255);
  noFill();
}
int linea = 0;
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

  for (float x = 0; x <= width; x += 20) {
    //beginShape();
    for (float z = 0; z >= -width; z -= 20) {
      float primary = cos((x+z)/100+time) * 100;
      float secondary = noise(x/100, z/100, time) * 50;
      //vertex(x, primary + secondary, z);
      if (linea==0)
        stroke(255);
      else
        stroke(50, 50, 255);
      line(x, primary + secondary, z, x, primary + secondary+longitud, z);
      linea++;
      linea=linea%2;
    }
    //endShape();
  }

  time += .05;
}

