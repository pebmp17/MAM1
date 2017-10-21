float tAtual = 0;
float vInicial = 30;
float aAtual = -1;
float dAtual;

void setup() {
    frameRate(1);
    size(600, 600);
    background(255);
}

void draw() {
    dAtual = MRUV(vInicial, aAtual, tAtual);
    println(tAtual, dAtual);
    ellipse(dAtual, 300, 10, 10);
    tAtual++;
}

float MRUV(float v, float a, float t){
    float d;
    d = (v * t + a * t * t / 2);
    return(d);
}
