//Quadro1  //<>//
String posicaoQuebrasTopDownQ1[] = {"0", "vazio", "vazio","meio@interna" ,"vazio", "vazio"};
String posicaoQuebrasLeftRightQ1[] = {"0", "vazio", "vazio", "meio@externa", "meio@externa", "meio@externa"};
int numeroDivisoesQ1= 5;
float espessuraQ1 = 58;
color coresRGBQ1[] = {color(205, 75, 73), color(108, 169, 214), color(222, 221, 201), color(50, 157, 43), color(45, 47, 46), color(207, 198, 167)};

//Quadro2
String posicaoQuebrasTopDownQ2[] = {"0", "vazio", "meio@externa","vazio" ,"meio@interna", "terco@externa"};
String posicaoQuebrasLeftRightQ2[] = {"0", "vazio", "vazio", "meio@interna", "vazio", "meio@interna"};
int numeroDivisoesQ2= 5;
float espessuraQ2= 58;
color coresRGBQ2[] = {color(51, 84, 89), color(229, 218, 186), color(136, 174, 113), color(227, 212, 181), color(223, 104, 84), color(207, 198, 167)};

//Quadro3
String posicaoQuebrasTopDownQ3[] = {"0", "vazio", "vazio", "vazio", "meio@externa", "meio@externa", "meio@externa"};
String posicaoQuebrasLeftRightQ3[] = {"0", "vazio", "vazio", "vazio", "meio@interna", "vazio", "vazio"};
int numeroDivisoesQ3= 6;
float espessuraQ3= 50;
color coresRGBQ3[] = {color(224, 218, 206), color(30, 30, 30), color(134, 139, 55), color(185, 34, 25), color(52, 68, 57), color(30, 30, 30), color(207, 198, 167)};

//Quadro4
String posicaoQuebrasTopDownQ4[] = {"0","vazio","vazio", "vazio", "meio@externa", "meio@externa", "meio@externa", "corner@externa"};
String posicaoQuebrasLeftRightQ4[] = {"0","vazio", "meio@interna", "vazio", "vazio", "meio@externa", "meio@externa", "vazio"};
int numeroDivisoesQ4= 7;
float espessuraQ4= 41;
color coresRGBQ4[] = {color(1,79,102),color(9, 39, 125), color(189, 29, 17), color(22, 160, 162), color(40, 127, 206), color(222, 49, 42), color(21, 126, 147), color(207, 198, 167)};

Mangueiras quadroQ1,quadroQ2,quadroQ3,quadroQ4,q1,q2,q3,q4;
int contador =0;

void setup() {
  size(600, 600);
  noStroke();
  frameRate(60);
  //colorMode(HSB, 360,100,100);
  background(207, 198, 167);
  quadroQ1 = new Mangueiras (10, 10, width-10, height-10, numeroDivisoesQ1, posicaoQuebrasTopDownQ1, posicaoQuebrasLeftRightQ1, espessuraQ1, coresRGBQ1);
  quadroQ2 = new Mangueiras (10, 10, width-10, height-10, numeroDivisoesQ2, posicaoQuebrasTopDownQ2, posicaoQuebrasLeftRightQ2, espessuraQ2, coresRGBQ2);
  quadroQ3 = new Mangueiras (10, 10, width-10, height-10, numeroDivisoesQ3, posicaoQuebrasTopDownQ3, posicaoQuebrasLeftRightQ3, espessuraQ3, coresRGBQ3);
  quadroQ4 = new Mangueiras (10, 10, width-10, height-10, numeroDivisoesQ4, posicaoQuebrasTopDownQ4, posicaoQuebrasLeftRightQ4, espessuraQ4, coresRGBQ4);
}

void draw() {
  if((contador>=0)&&(contador<120)){
    quadroQ1.criarQuadro();
  }
  if((contador>=120)&&(contador<240))
    quadroQ2.criarQuadro();
  if((contador>=240)&&(contador<360))
    quadroQ3.criarQuadro();
  if((contador>=360)&&(contador<480))
    quadroQ4.criarQuadro();
  if(contador>=480){
    contador =0;
    quadroQ1 = new Mangueiras (10, 10, width-10, height-10, numeroDivisoesQ1, posicaoQuebrasTopDownQ1, posicaoQuebrasLeftRightQ1, espessuraQ1, coresRGBQ1);
    quadroQ2 = new Mangueiras (10, 10, width-10, height-10, numeroDivisoesQ2, posicaoQuebrasTopDownQ2, posicaoQuebrasLeftRightQ2, espessuraQ2, coresRGBQ2);
    quadroQ3 = new Mangueiras (10, 10, width-10, height-10, numeroDivisoesQ3, posicaoQuebrasTopDownQ3, posicaoQuebrasLeftRightQ3, espessuraQ3, coresRGBQ3);
    quadroQ4 = new Mangueiras (10, 10, width-10, height-10, numeroDivisoesQ4, posicaoQuebrasTopDownQ4, posicaoQuebrasLeftRightQ4, espessuraQ4, coresRGBQ4);
  }
   println(contador);
   contador++;
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

class Mangueiras {
  int divisao, divisaoInicial;
  float xInicial, xFinal, yInicial, yFinal, espessura;
  String[] posQuebraTopDown, posQuebraLeftRight;
  color[] coresCamadas;

  Mangueiras (float xInicial, float yInicial, float xFinal, float yFinal, int divisao, String[] posQuebraTopDown, String[] posQuebraLeftRight, float espessura, color[] coresCamadas) {
    this.xInicial = xInicial;
    this.yInicial = yInicial;
    this.xFinal = xFinal;
    this. yFinal = yFinal;
    this.divisao = divisao;
    this.divisaoInicial = divisao;
    this.posQuebraTopDown = posQuebraTopDown;
    this.posQuebraLeftRight = posQuebraLeftRight;
    this.espessura = espessura;
    this.coresCamadas= coresCamadas;
  }

  void criarLados() {
    String[] quebra = posQuebraTopDown[divisao].split("@");
    if (quebra.length>1) {
      if (quebra[1].equals("externa")){
        fill(coresCamadas[divisao]);
      } 
      else if (quebra[1].equals("interna")) {
        fill(coresCamadas[divisao-2]);
      }
      rect(xInicial, yInicial, xFinal-xInicial, espessura);
      rect(xInicial,yFinal-espessura,xFinal-xInicial,espessura);
    }
    fill(coresCamadas[divisao-1]);
    if (quebra[0].equals("corner")) {
      rect(xInicial, yInicial, espessura, espessura);
      if (quebra[1].equals("interna")) {
        semiCirculo(xInicial+espessura, yInicial, 2*espessura, "baixo");
        semiCirculo(xInicial+3*espessura, yInicial, 2*espessura, "baixo");
        semiCirculo(xFinal-espessura, yInicial, 2*espessura, "baixo");
        semiCirculo(xFinal-3*espessura, yInicial, 2*espessura, "baixo");
      } else if (quebra[1].equals("externa")) {
        semiCirculo(xInicial+espessura, yInicial+espessura, 2*espessura, "cima");
        semiCirculo(xInicial+3*espessura, yInicial+espessura, 2*espessura, "cima");
        semiCirculo(xFinal-espessura, yInicial+espessura, 2*espessura, "cima");
        semiCirculo(xFinal-3*espessura, yInicial+espessura, 2*espessura, "cima");
      }
      rect(xInicial+3*espessura, yInicial, (xFinal-xInicial)-6*espessura, espessura);
      rect(xFinal-espessura, yInicial, espessura, espessura);

      rect(xInicial, yFinal-espessura, espessura, espessura);
      if (quebra[1].equals("interna")) {
        semiCirculo(xInicial+espessura, yFinal, 2*espessura, "cima");
        semiCirculo(xInicial+3*espessura, yFinal, 2*espessura, "cima");
        semiCirculo(xFinal-espessura, yFinal, 2*espessura, "cima");
        semiCirculo(xFinal-3*espessura, yFinal, 2*espessura, "cima");
      } else if (quebra[1].equals("externa")) {
        semiCirculo(xInicial+espessura, yFinal-espessura, 2*espessura, "baixo");
        semiCirculo(xInicial+3*espessura, yFinal-espessura, 2*espessura, "baixo");
        semiCirculo(xFinal-espessura, yFinal-espessura, 2*espessura, "baixo");
        semiCirculo(xFinal-3*espessura, yFinal-espessura, 2*espessura, "baixo");
      }
      rect(xInicial+3*espessura, yFinal-espessura, (xFinal-xInicial)-6*espessura, espessura);
      rect(xFinal-espessura, yFinal-espessura, espessura, espessura);
    } else if (quebra[0].equals("terco")) {
      rect(xInicial, yInicial, 2*espessura, espessura);
      if (quebra[1].equals("interna")) {
        semiCirculo(xInicial+2*espessura, yInicial, 2*espessura, "baixo");
        semiCirculo(xInicial+4*espessura, yInicial, 2*espessura, "baixo");
        semiCirculo(xFinal-4*espessura, yInicial, 2*espessura, "baixo");
        semiCirculo(xFinal-2*espessura, yInicial, 2*espessura, "baixo");
      } else if (quebra[1].equals("externa")) {
        semiCirculo(xInicial+2*espessura, yInicial+espessura, 2*espessura, "cima");
        semiCirculo(xInicial+4*espessura, yInicial+espessura, 2*espessura, "cima");
        semiCirculo(xFinal-4*espessura, yInicial+espessura, 2*espessura, "cima");
        semiCirculo(xFinal-2*espessura, yInicial+espessura, 2*espessura, "cima");
      }
      rect(xInicial+4*espessura, yInicial, (xFinal-xInicial)-8*espessura, espessura);
      rect(xFinal-2*espessura, yInicial, 2*espessura, espessura);

      rect(xInicial, yFinal-espessura, 2*espessura, espessura);
      if (quebra[1].equals("interna")) {
        semiCirculo(xInicial+2*espessura, yFinal, 2*espessura, "cima");
        semiCirculo(xInicial+4*espessura, yFinal, 2*espessura, "cima");
        semiCirculo(xFinal-4*espessura, yFinal, 2*espessura, "cima");
        semiCirculo(xFinal-2*espessura, yFinal, 2*espessura, "cima");
      } else if (quebra[1].equals("externa")) {
        semiCirculo(xInicial+2*espessura, yFinal-espessura, 2*espessura, "baixo");
        semiCirculo(xInicial+4*espessura, yFinal-espessura, 2*espessura, "baixo");
        semiCirculo(xFinal-4*espessura, yFinal-espessura, 2*espessura, "baixo");
        semiCirculo(xFinal-2*espessura, yFinal-espessura, 2*espessura, "baixo");
      }
      rect(xInicial+4*espessura, yFinal-espessura, (xFinal-xInicial)-8*espessura, espessura);
      rect(xFinal-2*espessura, yFinal-espessura, 2*espessura, espessura);
    } else if (quebra[0].equals("meio")) {
      rect(xInicial, yInicial, ((xFinal-xInicial)/2)-espessura, espessura);
      if (quebra[1].equals("externa")) {
        semiCirculo(((xFinal-xInicial)/2)+xInicial-espessura, yInicial+espessura, 2*espessura, "cima");
        semiCirculo(((xFinal-xInicial)/2)+xInicial+espessura, yInicial+espessura, 2*espessura, "cima");
      } else if (quebra[1].equals("interna")) {
        semiCirculo(((xFinal-xInicial)/2)+xInicial-espessura, yInicial, 2*espessura, "baixo");
        semiCirculo(((xFinal-xInicial)/2)+xInicial+espessura, yInicial, 2*espessura, "baixo");
      }
      rect(((xFinal-xInicial)/2)+xInicial+espessura, yInicial, (xFinal-((xFinal-xInicial)/2)-xInicial-espessura), espessura);

      rect(xInicial, yFinal-espessura, ((xFinal-xInicial)/2)-espessura, espessura);
      if (quebra[1].equals("externa")) {
        semiCirculo(((xFinal-xInicial)/2)+xInicial-espessura, yFinal-espessura, 2*espessura, "baixo");
        semiCirculo(((xFinal-xInicial)/2)+xInicial+espessura, yFinal-espessura, 2*espessura, "baixo");
      } else if (quebra[1].equals("interna")) {
        semiCirculo(((xFinal-xInicial)/2)+xInicial-espessura, yFinal, 2*espessura, "cima");
        semiCirculo(((xFinal-xInicial)/2)+xInicial+espessura, yFinal, 2*espessura, "cima");
      }
      rect(((xFinal-xInicial)/2)+xInicial+espessura, yFinal-espessura, (xFinal-((xFinal-xInicial)/2)-xInicial-espessura), espessura);
    } else if (quebra[0].equals("vazio")) {
      rect(xInicial, yInicial, xFinal-xInicial, espessura);

      rect(xInicial, yFinal-espessura, xFinal-xInicial, espessura);
    }

    quebra = posQuebraLeftRight[divisao].split("@");
    if (quebra.length>1) {
      if (quebra[1].equals("externa")){
        fill(coresCamadas[divisao]);
      } 
      else if (quebra[1].equals("interna")) {
       fill(coresCamadas[divisao-2]);
      }
      rect(xInicial, yInicial, espessura, yFinal-yInicial);
      rect(xFinal-espessura,yInicial,espessura,yFinal-yInicial);
     }
     fill(coresCamadas[divisao-1]);
    if (quebra[0].equals("corner")) {
      rect(xInicial, yInicial, espessura, espessura);
      if (quebra[1].equals("externa")) {
        semiCirculo(xInicial+espessura, yInicial+espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, yInicial+3*espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, yFinal-espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, yFinal-3*espessura, 2*espessura, "esquerda");
      } else if (quebra[1].equals("interna")) {
        semiCirculo(xInicial, yInicial+espessura, 2*espessura, "direita");
        semiCirculo(xInicial, yInicial+3*espessura, 2*espessura, "direita");
        semiCirculo(xInicial, yFinal-espessura, 2*espessura, "direita");
        semiCirculo(xInicial, yFinal-3*espessura, 2*espessura, "direita");
      }
      rect(xInicial, yInicial+3*espessura, espessura, (yFinal-yInicial)-6*espessura);
      rect(xInicial, yFinal-espessura, espessura, espessura);

      rect(xFinal-espessura, yInicial, espessura, espessura);
      if (quebra[1].equals("externa")) {
        semiCirculo(xFinal-espessura, yInicial+espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, yInicial+3*espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, yFinal-espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, yFinal-3*espessura, 2*espessura, "direita");
      } else if (quebra[1].equals("interna")) {
        semiCirculo(xFinal, yInicial+espessura, 2*espessura, "esquerda");
        semiCirculo(xFinal, yInicial+3*espessura, 2*espessura, "esquerda");
        semiCirculo(xFinal, yFinal-espessura, 2*espessura, "esquerda");
        semiCirculo(xFinal, yFinal-3*espessura, 2*espessura, "esquerda");
      }

      rect(xFinal-espessura, yInicial+3*espessura, espessura, (yFinal-yInicial)-6*espessura);
      rect(xInicial, yFinal-espessura, espessura, espessura);
    } else if (quebra[0].equals("terco")) {
      rect(xInicial, yInicial, espessura, 2*espessura);
      if (quebra[1].equals("externa")) {
        semiCirculo(xInicial+espessura, yInicial+2*espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, yInicial+4*espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, yFinal-4*espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, yFinal-2*espessura, 2*espessura, "esquerda");
      } else if (quebra[1].equals("interna")) {
        semiCirculo(xInicial, yInicial+2*espessura, 2*espessura, "direita");
        semiCirculo(xInicial, yInicial+4*espessura, 2*espessura, "direita");
        semiCirculo(xInicial, yFinal-4*espessura, 2*espessura, "direita");
        semiCirculo(xInicial, yFinal-2*espessura, 2*espessura, "direita");
      }
      rect(xInicial, yInicial+4*espessura, espessura, (yFinal-yInicial)-8*espessura);
      rect(xInicial, yFinal-2*espessura, espessura, 2*espessura);

      rect(xFinal-espessura, yInicial, espessura, 2*espessura);
      if (quebra[1].equals("externa")) {
        semiCirculo(xFinal-espessura, yInicial+2*espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, yInicial+4*espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, yFinal-4*espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, yFinal-2*espessura, 2*espessura, "direita");
      } else if (quebra[1].equals("interna")) {
        semiCirculo(xFinal, yInicial+2*espessura, 2*espessura, "esquerda");
        semiCirculo(xFinal, yInicial+4*espessura, 2*espessura, "esquerda");
        semiCirculo(xFinal, yFinal-4*espessura, 2*espessura, "esquerda");
        semiCirculo(xFinal, yFinal-2*espessura, 2*espessura, "esquerda");
      }
      rect(xFinal-espessura, yInicial+4*espessura, espessura, (yFinal-yInicial)-8*espessura);
      rect(xFinal-espessura, yFinal-2*espessura, espessura, 2*espessura);
    } else if (quebra[0].equals("meio")) {
      rect(xInicial, yInicial, espessura, ((yFinal-yInicial)/2)-espessura);
      if (quebra[1].equals("externa")) {
        semiCirculo(xInicial+espessura, (yFinal-yInicial)/2+yInicial-espessura, 2*espessura, "esquerda");
        semiCirculo(xInicial+espessura, ((yFinal-yInicial)/2)+yInicial+espessura, 2*espessura, "esquerda");
      } else if (quebra[1].equals("interna")) {
        semiCirculo(xInicial, (yFinal-yInicial)/2+yInicial-espessura, 2*espessura, "direita");
        semiCirculo(xInicial, ((yFinal-yInicial)/2)+yInicial+espessura, 2*espessura, "direita");
      }
      rect(xInicial, ((yFinal-yInicial)/2)+yInicial+espessura, espessura, (xFinal-((yFinal-yInicial)/2)-yInicial-espessura));

      rect(xFinal-espessura, yInicial, espessura, ((yFinal-yInicial)/2)-espessura);
      if (quebra[1].equals("externa")) {
        semiCirculo(xFinal-espessura, (yFinal-yInicial)/2+yInicial-espessura, 2*espessura, "direita");
        semiCirculo(xFinal-espessura, ((yFinal-yInicial)/2)+yInicial+espessura, 2*espessura, "direita");
      } else if (quebra[1].equals("interna")) {
        semiCirculo(xFinal, (yFinal-yInicial)/2+yInicial-espessura, 2*espessura, "esquerda");
        semiCirculo(xFinal, ((yFinal-yInicial)/2)+yInicial+espessura, 2*espessura, "esquerda");
      }
      rect(xFinal-espessura, ((yFinal-yInicial)/2)+yInicial+espessura, espessura, (yFinal-((yFinal-yInicial)/2)-yInicial-espessura));
    } else if (quebra[0].equals("vazio")) {
      rect(xInicial, yInicial, espessura, yFinal-yInicial);

      rect(xFinal-espessura, yInicial, espessura, yFinal-yInicial);
    }
  }
  void criarQuadro() {
    if (divisao>0) {
      criarLados();
      xInicial+=espessura;
      xFinal-=espessura;
      yInicial+=espessura;
      yFinal-=espessura;
      divisao--;
    }
  }
  void resetarDivisao(){
    divisao=divisaoInicial;
  }
}