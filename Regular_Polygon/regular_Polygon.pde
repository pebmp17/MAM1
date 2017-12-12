int lados = 5;
float ang = TWO_PI/lados, tamanho = 100;
void setup(){
  size(800,800);
  translate(400,400);
  for (int i =0; i<lados; i++){
    rotate(ang);
    triangle(0,0,cos(ang)*tamanho,sin(ang)*tamanho,cos(ang*2)*tamanho,sin(ang*2)*tamanho);
  }
}