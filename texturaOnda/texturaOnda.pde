 
int xspacing = 30;   // distancia entre líneas horizontales 
int w;              // Width of entire wave

float theta = 0.0;  // comienza angulo en 0
float amplitude = 100;  // altura de onda
float period = 500.0;  // pixeles antes de la repetición
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // array guarda valores de onda

void setup() {
  size(1200, 500);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  theta += 0.02;
  // calcula el valor de y con sin
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // dibuja rect en cada pos
  for (int x = 0; x < yvalues.length; x++) {
    rect(x*xspacing, height/2+yvalues[x],5,80);
  }
}

