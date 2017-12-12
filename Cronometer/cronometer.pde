void setup() {
  size(800, 600);
  noStroke();
  
}
float add = TWO_PI/60;
float acre = 0;
void draw() {
  background(120);
  fill(60);
  ellipse(400, 300, 600, 600);
  fill(255);
  ellipse(400, 300, 540, 540);
  fill(60);
  translate(400, 300);
  rotate(3*PI/2);
  
  for (float ang=0; ang<TWO_PI; ang+=add) {
    ellipse(250*cos(ang), 250*sin(ang), 10, 10);
  }
  
  stroke(60);
  polarLine(TWO_PI/60000*millis(), 250, 6);
  noStroke();
  
  //acre=millis();
  println(millis());
}

void polarLine(float ang, float tamanho, float espessura) {
  strokeWeight(espessura);
  line(0, 0, tamanho*cos(ang), tamanho*sin(ang));
}