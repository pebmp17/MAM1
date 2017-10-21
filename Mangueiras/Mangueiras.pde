String posicaoQuebras[] = {"0", "meio","terco","corner","meio"};//ordenacao invertida
int numeroDivisoes= 3;

void setup() {
  size(600, 600);
}

void draw() {
  String n[] = {" "};
  noStroke();
  criarCamada(0, 0, width, height, numeroDivisoes, n, posicaoQuebras, 50);
}

void criarCamada(float xInicial, float yInicial, float xFinal, float yFinal, int divisao, String[] direcaoQuebra, String[] posQuebra, float espessura) {
  if (divisao >0) {
    criarLados(xInicial, yInicial, xFinal, yFinal, divisao, direcaoQuebra, posQuebra, espessura, "topDown");
    criarLados(xInicial,yInicial,xFinal,yFinal,divisao,direcaoQuebra,posQuebra,espessura,"leftRight");  
    criarCamada(xInicial+espessura, yInicial+espessura, xFinal-espessura, yFinal-espessura, divisao-1, direcaoQuebra, posQuebra, espessura);
  }
}

void criarLados(float xInicial, float yInicial, float xFinal, float yFinal, int divisao, String[] direcaoQuebra, String[] posQuebra, float espessura, String lado) {
  if (lado.equals("topDown")) {
    if (posQuebra[divisao].equals("corner")) {
      rect(xInicial, yInicial, espessura, espessura);
      semiCirculo(xInicial+espessura, yInicial+espessura, 2*espessura, "cima");
      semiCirculo(xInicial+3*espessura, yInicial+espessura, 2*espessura, "cima");
      rect(xInicial+3*espessura, yInicial, (xFinal-xInicial)-6*espessura, espessura);
      semiCirculo(xFinal-espessura, yInicial+espessura, 2*espessura, "cima");
      semiCirculo(xFinal-3*espessura, yInicial+espessura, 2*espessura, "cima");
      rect(xFinal-espessura, yInicial, espessura, espessura);

      rect(xInicial, yFinal-espessura, espessura, espessura);
      semiCirculo(xInicial+espessura, yFinal-espessura, 2*espessura, "baixo");
      semiCirculo(xInicial+3*espessura, yFinal-espessura, 2*espessura, "baixo");
      rect(xInicial+3*espessura, yFinal-espessura, (xFinal-xInicial)-6*espessura, espessura);
      semiCirculo(xFinal-espessura, yFinal-espessura, 2*espessura, "baixo");
      semiCirculo(xFinal-3*espessura, yFinal-espessura, 2*espessura, "baixo");
      rect(xFinal-espessura, yFinal-espessura, espessura, espessura);
    } else if (posQuebra[divisao].equals("terco")) {
      rect(xInicial, yInicial, 2*espessura, espessura);
      semiCirculo(xInicial+2*espessura, yInicial+espessura, 2*espessura, "cima");
      semiCirculo(xInicial+4*espessura, yInicial+espessura, 2*espessura, "cima");
      rect(xInicial+4*espessura, yInicial, (xFinal-xInicial)-8*espessura, espessura);
      semiCirculo(xFinal-4*espessura, yInicial+espessura, 2*espessura, "cima");
      semiCirculo(xFinal-2*espessura, yInicial+espessura, 2*espessura, "cima");
      rect(xFinal-2*espessura, yInicial, 2*espessura, espessura);

      rect(xInicial, yFinal-espessura, 2*espessura, espessura);
      semiCirculo(xInicial+2*espessura, yFinal-espessura, 2*espessura, "baixo");
      semiCirculo(xInicial+4*espessura, yFinal-espessura, 2*espessura, "baixo");
      rect(xInicial+4*espessura, yFinal-espessura, (xFinal-xInicial)-8*espessura, espessura);
      semiCirculo(xFinal-4*espessura, yFinal-espessura, 2*espessura, "baixo");
      semiCirculo(xFinal-2*espessura, yFinal-espessura, 2*espessura, "baixo");
      rect(xFinal-2*espessura, yFinal-espessura, 2*espessura, espessura);
    } else if (posQuebra[divisao].equals("meio")) {
      rect(xInicial, yInicial, ((xFinal-xInicial)/2)-espessura-xInicial, espessura);
      semiCirculo(((xFinal-xInicial)/2)-espessura, yInicial+espessura, 2*espessura, "cima");
      semiCirculo(((xFinal-xInicial)/2)+espessura, yInicial+espessura, 2*espessura, "cima");
      rect(((xFinal-xInicial)/2)+espessura, yInicial, (xFinal-((xFinal-xInicial)/2)-espessura), espessura);

      rect(xInicial, yFinal-espessura, ((xFinal-xInicial)/2)-espessura-xInicial, espessura);
      semiCirculo(((xFinal-xInicial)/2)-espessura, yFinal-espessura, 2*espessura, "baixo");
      semiCirculo(((xFinal-xInicial)/2)+espessura, yFinal-espessura, 2*espessura, "baixo");
      rect(((xFinal-xInicial)/2)+espessura, yFinal-espessura, (xFinal-((xFinal-xInicial)/2)-espessura), espessura);
    } else if (posQuebra[divisao].equals("vazia")) {
      rect(xInicial, yInicial, xFinal-xInicial, espessura);

      rect(xInicial, yFinal-espessura, xFinal-xInicial, espessura);
    }
  } else if (lado.equals("leftRight")) {
      if (posQuebra[divisao].equals("corner")) {
        rect(xInicial, yInicial, espessura, espessura);
        semiCirculo(xInicial+espessura, yInicial+espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, yInicial+3*espessura, 2*espessura, "esquerda");
        rect(xInicial, yInicial+3*espessura, espessura, (yFinal-yInicial)-6*espessura);
        semiCirculo(xInicial+espessura, yFinal-espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, yFinal-3*espessura, 2*espessura, "esquerda");
        rect(xInicial, yFinal-espessura, espessura, espessura);

        rect(xFinal, yInicial, espessura, espessura);
        semiCirculo(xFinal-espessura, yInicial+espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, yInicial+3*espessura, 2*espessura, "direita");
        rect(xFinal-espessura, yInicial+3*espessura, espessura, (yFinal-yInicial)-6*espessura);
        semiCirculo(xFinal-espessura, yFinal-espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, yFinal-3*espessura, 2*espessura, "direita");
        rect(xInicial, yFinal-espessura, espessura, espessura);
      } else if (posQuebra[divisao].equals("terco")) {
        rect(xInicial, yInicial, espessura, 2*espessura);
        semiCirculo(xInicial+espessura, yInicial+2*espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, yInicial+4*espessura, 2*espessura, "esquerda");
        rect(xInicial, yInicial+4*espessura,espessura , (yFinal-yInicial)-8*espessura);
        semiCirculo(xInicial+espessura, yFinal-4*espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, yFinal-2*espessura, 2*espessura, "esquerda");
        rect(xInicial, yFinal-2*espessura, espessura, 2*espessura);

        rect(xFinal-espessura, yInicial, espessura, 2*espessura);
        semiCirculo(xFinal-espessura, yInicial+2*espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, yInicial+4*espessura, 2*espessura, "direita");
        rect(xFinal-espessura, yInicial+4*espessura,espessura , (yFinal-yInicial)-8*espessura);
        semiCirculo(xFinal-espessura, yFinal-4*espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, yFinal-2*espessura, 2*espessura, "direita");
        rect(xFinal-espessura, yFinal-2*espessura, espessura, 2*espessura);
      } else if (posQuebra[divisao].equals("meio")) {
        rect(xInicial, yInicial, espessura, ((yFinal-yInicial)/2)-espessura-yInicial);
        semiCirculo(xInicial+espessura, (yFinal-yInicial)/2-espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, ((yFinal-yInicial)/2)+espessura, 2*espessura, "esquerda");
        rect(xInicial,((yFinal-yInicial)/2)+espessura, espessura, (xFinal-((xFinal-xInicial)/2)-espessura));

        rect(xFinal-espessura, yInicial, espessura, ((yFinal-yInicial)/2)-espessura-yInicial);
        semiCirculo(xFinal-espessura, (yFinal-yInicial)/2-espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, ((yFinal-yInicial)/2)+espessura, 2*espessura, "direita");
        rect(xFinal-espessura,((yFinal-yInicial)/2)+espessura, espessura, (xFinal-((xFinal-xInicial)/2)-espessura));
      } else if (posQuebra[divisao].equals("vazia")) {
        rect(xInicial, yInicial, xFinal-xInicial, espessura);

        rect(xInicial, yFinal-espessura, xFinal-xInicial, espessura);
      }
  }
}

void semiCirculo (float x, float y, float tamanho, String orientacao) {
  switch(orientacao) {
  case "cima":
    arc(x, y, tamanho, tamanho, PI, TAU);
    break;
  case "baixo":
    arc(x, y, tamanho, tamanho, -TAU, -PI);
    break;
  case "esquerda":
    arc(x, y, tamanho, tamanho, HALF_PI, HALF_PI+PI);
    break;
  case "direita":
    arc(x, y, tamanho, tamanho, -HALF_PI, HALF_PI);
    break;
  }
}