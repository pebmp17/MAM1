//Quadro1
String posicaoQuebrasTopDownQ1[] = {"0", "vazio", "vazio", "meio@interna", "vazio", "vazio", " ", " "};
String posicaoQuebrasLeftRightQ1[] = {"0", "vazio", "vazio", "meio@externa", "meio@externa", "meio@externa", " ", " "};
int numeroDivisoesQ1= 5;
color coresHSVQ1[] = new color[6];
String cHarmonyQ1 ="triad";

//Quadro2
String posicaoQuebrasTopDownQ2[] = {"0", "vazio", "meio@externa", "vazio", "meio@interna", "terco@externa", " ", " "};
String posicaoQuebrasLeftRightQ2[] = {"0", "vazio", "vazio", "meio@interna", "vazio", "meio@interna", " ", " "};
int numeroDivisoesQ2= 5;
color coresHSVQ2[] = new color[6];
String cHarmonyQ2 = "triad";


//Quadro3
String posicaoQuebrasTopDownQ3[] = {"0", "vazio", "vazio", "vazio", "meio@externa", "meio@externa", "meio@externa", " "};
String posicaoQuebrasLeftRightQ3[] = {"0", "vazio", "vazio", "vazio", "meio@interna", "vazio", "vazio", " "};
int numeroDivisoesQ3= 6;
color coresHSVQ3[] = new color[7];
String cHarmonyQ3 = "diad";


//Quadro4
String posicaoQuebrasTopDownQ4[] = {"0", "vazio", "vazio", "vazio", "meio@externa", "meio@externa", "meio@externa", "corner@externa"};
String posicaoQuebrasLeftRightQ4[] = {"0", "vazio", "meio@interna", "vazio", "vazio", "meio@externa", "meio@externa", "vazio"};
int numeroDivisoesQ4= 7;
color coresHSVQ4[] = new color[8];
String cHarmonyQ4 = "diad";

//QuadroRandom
String[] quadroAleatorioTopDown;
String[] quadroAleatorioLeftRight;
int numeroDivisoesQR;
color coresHSVQR[] = new color[numeroDivisoesQR];
String cHarmonyQR;

Mangueira quadroQ1, quadroQ2, quadroQ3, quadroQ4, quadroQR;
int contador = 0, tempo = 60;

String existentesTopDown[][] = {posicaoQuebrasTopDownQ1,posicaoQuebrasTopDownQ2,posicaoQuebrasTopDownQ3,posicaoQuebrasTopDownQ4};
String existentesLeftRight[][] = {posicaoQuebrasLeftRightQ1,posicaoQuebrasLeftRightQ2,posicaoQuebrasLeftRightQ3,posicaoQuebrasLeftRightQ4};
String existentesHarmonia[] = {cHarmonyQ1,cHarmonyQ2,cHarmonyQ3,cHarmonyQ4};
color coresExistentesTriad[][] = {coresHSVQ1, coresHSVQ2};
color coresExistentesDiad[][] = {coresHSVQ3, coresHSVQ4};

void setup() {
  size(600, 600);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  frameRate(60);  
  background(207, 198, 167);
  coresHSVQ1[0] = color(0.91, 64.39, 80.39); 
  coresHSVQ1[1] = color(205.47, 49.53, 83.92); 
  coresHSVQ1[2] = color(57.14, 9.46, 87.06); 
  coresHSVQ1[3] = color(116.32, 72.61, 61.57); 
  coresHSVQ1[4] = color(150, 4.26, 18.43); 
  coresHSVQ1[5] = color(46.5, 19.32, 81.18);
  coresHSVQ2[0] = color(187.89, 42.7, 34.9); 
  coresHSVQ2[1] = color(44.65, 18.78, 89.8); 
  coresHSVQ2[2] = color(97.38, 35.06, 68.24); 
  coresHSVQ2[3] = color(40.43, 20.26, 89.02); 
  coresHSVQ2[4] = color(8.63, 62.33, 87.45); 
  coresHSVQ2[5] = color(46.5, 19.32, 81.18);
  coresHSVQ3[0] = color(40, 8.04, 87.84); 
  coresHSVQ3[1] = color(0, 0, 11.76); 
  coresHSVQ3[2] = color(63.57, 60.43, 54.51); 
  coresHSVQ3[3] = color(3.38, 86.49, 72.55); 
  coresHSVQ3[4] = color(138.75, 23.53, 26.67); 
  coresHSVQ3[5] = color(0, 0, 11.76); 
  coresHSVQ3[6] = color(46.5, 19.32, 81.18);
  coresHSVQ4[0] = color(193.66, 99.02, 40); 
  coresHSVQ4[1] = color(224.48, 92.8, 49.02); 
  coresHSVQ4[2] = color(4.19, 91.01, 74.12); 
  coresHSVQ4[3] = color(180.86, 86.42, 63.53); 
  coresHSVQ4[4] = color(208.55, 80.58, 80.78); 
  coresHSVQ4[5] = color(2.33, 81.08, 87.06); 
  coresHSVQ4[6] = color(190, 85.71, 57.65); 
  coresHSVQ4[7] = color(46.5, 19.32, 81.18);
  numeroDivisoesQR = round(random(5, 7));
  cHarmonyQR = gerarHarmonia(existentesHarmonia);
  coresHSVQR = gerarCores(numeroDivisoesQR+1, cHarmonyQR, coresExistentesDiad, coresExistentesTriad);
  quadroAleatorioTopDown = gerarQuadroAleatorio(numeroDivisoesQR, "TopDown");
  quadroAleatorioLeftRight = gerarQuadroAleatorio(numeroDivisoesQR, "LeftRight");
  quadroQ1 = new Mangueira (0, 0, width, height, numeroDivisoesQ1, posicaoQuebrasTopDownQ1, posicaoQuebrasLeftRightQ1, coresHSVQ1, cHarmonyQ1);
  quadroQ2 = new Mangueira (0, 0, width, height, numeroDivisoesQ2, posicaoQuebrasTopDownQ2, posicaoQuebrasLeftRightQ2, coresHSVQ2, cHarmonyQ2);
  quadroQ3 = new Mangueira (0, 0, width, height, numeroDivisoesQ3, posicaoQuebrasTopDownQ3, posicaoQuebrasLeftRightQ3, coresHSVQ3, cHarmonyQ3);
  quadroQ4 = new Mangueira (0, 0, width, height, numeroDivisoesQ4, posicaoQuebrasTopDownQ4, posicaoQuebrasLeftRightQ4, coresHSVQ4, cHarmonyQ4);
  quadroQR = new Mangueira (0, 0, width, height, numeroDivisoesQR, quadroAleatorioTopDown, quadroAleatorioLeftRight, coresHSVQR, cHarmonyQR);
}

void draw() {
  if ((contador>=0)&&(contador<tempo))
    quadroQ1.criarQuadro();
  else if ((contador>=tempo)&&(contador<tempo*2))
    quadroQ2.criarQuadro();
  else if ((contador>=tempo*2)&&(contador<tempo*3))
    quadroQ3.criarQuadro();
  else if ((contador>=tempo*3)&&(contador<tempo*4)) {
    quadroQ4.criarQuadro();
  } else if ((contador>=tempo*4)&&(contador<tempo*8)) {
    quadroQR.criarQuadro();
  } else if (contador>=tempo*8) {
    contador = 0;
    quadroQ1 = new Mangueira (0, 0, width, height, numeroDivisoesQ1, posicaoQuebrasTopDownQ1, posicaoQuebrasLeftRightQ1, coresHSVQ1, cHarmonyQ1);
    quadroQ2 = new Mangueira (0, 0, width, height, numeroDivisoesQ2, posicaoQuebrasTopDownQ2, posicaoQuebrasLeftRightQ2, coresHSVQ2, cHarmonyQ2);
    quadroQ3 = new Mangueira (0, 0, width, height, numeroDivisoesQ3, posicaoQuebrasTopDownQ3, posicaoQuebrasLeftRightQ3, coresHSVQ3, cHarmonyQ3);
    quadroQ4 = new Mangueira (0, 0, width, height, numeroDivisoesQ4, posicaoQuebrasTopDownQ4, posicaoQuebrasLeftRightQ4, coresHSVQ4, cHarmonyQ4);
    numeroDivisoesQR = round(random(5, 7));
    cHarmonyQR = gerarHarmonia(existentesHarmonia);
    coresHSVQR = gerarCores(numeroDivisoesQR+1, cHarmonyQR, coresExistentesTriad, coresExistentesDiad);
    quadroAleatorioTopDown = gerarQuadroAleatorio(numeroDivisoesQR, "TopDown");
    quadroAleatorioLeftRight = gerarQuadroAleatorio(numeroDivisoesQR, "LeftRight");
    quadroQR = new Mangueira (0, 0, width, height, numeroDivisoesQR, quadroAleatorioTopDown, quadroAleatorioLeftRight, coresHSVQR, cHarmonyQR);
    
  }
  if (contador == tempo*5) {
      saveFrame();
    }
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

String gerarHarmonia(String[] harmoniaExistentes) {
  String harmoniaGerada;
  int x = round(random(0, harmoniaExistentes.length-1));
  harmoniaGerada = harmoniaExistentes[x];
  return harmoniaGerada;
}

color[] gerarCores(int tamanho, String colorHarmony, color[][] coresExistentesDiad, color[][] coresExistentesTriad) {
  color[] coresGeradas = new color[8];
  int i = 0, x, quadroEscolhido = 99;
  if (colorHarmony.equals("diad")) {
    quadroEscolhido = round(random(0, coresExistentesDiad.length-1));
  } else if (colorHarmony.equals("triad"));
  {
    quadroEscolhido = round(random(0, coresExistentesTriad.length-1));
  }
  while (i<tamanho) {
    if (colorHarmony.equals("diad")) {
      x = round(random(0, coresExistentesDiad[quadroEscolhido].length-2));
      coresGeradas[i] = coresExistentesDiad[quadroEscolhido][x];
    } else if (colorHarmony.equals("triad")) {
      x = round(random(0, coresExistentesTriad[quadroEscolhido].length-2));
      coresGeradas[i] = coresExistentesTriad[quadroEscolhido][x];
    }
    if (i!=0) {
      if (coresGeradas[i] != coresGeradas[i-1]) {
        i++;
      }
    } else
      i++;
  }
  coresGeradas[tamanho-1] = color(46.5, 19.32, 81.18);
  return coresGeradas;
}

String[] gerarQuadroAleatorio(int limite, String modo) {
  String[] quadroAleatorio = new String[8];
  int x, i = 0;
  while (i<=limite) {
    if (modo.equals("LeftRight")) {
      x = int(random(0, existentesLeftRight.length));
      quadroAleatorio[i] = existentesLeftRight[x][i];
    } else if (modo.equals("TopDown")) {
      x = int(random(0, existentesTopDown.length));
      quadroAleatorio[i] = existentesTopDown[x][i];
    }
    if (!quadroAleatorio[i].equals(" ")) {
      if (i!=0) {
        if (!(((quadroAleatorio[i-1].contains("externa"))&&(quadroAleatorio[i].contains("interna")))||((quadroAleatorio[i-1].contains("interna"))&&(quadroAleatorio[i].contains("externa"))))) {
          i++;
        }
      } else {
        i++;
      }
    }
  }
  return quadroAleatorio;
}

class Mangueira {
  int divisao;
  float xInicial, xFinal, yInicial, yFinal, espessura;
  String[] posQuebraTopDown, posQuebraLeftRight;
  color[] coresCamadas;
  String colorHarmony;

  Mangueira (float xInicial, float yInicial, float xFinal, float yFinal, int divisao, String[] posQuebraTopDown, String[] posQuebraLeftRight, color[] coresCamadas, String colorHarmony) {
    this.xInicial = xInicial;
    this.yInicial = yInicial;
    this.xFinal = xFinal;
    this. yFinal = yFinal;
    this.divisao = divisao;
    this.posQuebraTopDown = posQuebraTopDown;
    this.posQuebraLeftRight = posQuebraLeftRight;
    if (divisao == 5) {
      this.espessura = 58;
    } else if (divisao == 6) {
      this.espessura = 50;
    } else if (divisao == 7) {
      this.espessura = 41;
    }
    this.coresCamadas= coresCamadas;
    this.colorHarmony = colorHarmony;
  }

  void criarLados() {
    String[] quebra = posQuebraTopDown[divisao].split("@");
    if (quebra.length>1) {
      if (quebra[1].equals("externa")) {
        fill(coresCamadas[divisao]);
      } else if (quebra[1].equals("interna")) {
        fill(coresCamadas[divisao-2]);
      }
      rect(xInicial, yInicial, xFinal-xInicial, espessura);
      rect(xInicial, yFinal-espessura, xFinal-xInicial, espessura);
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
      if (quebra[1].equals("externa")) {
        fill(coresCamadas[divisao]);
      } else if (quebra[1].equals("interna")) {
        fill(coresCamadas[divisao-2]);
      }
      rect(xInicial, yInicial, espessura, yFinal-yInicial);
      rect(xFinal-espessura, yInicial, espessura, yFinal-yInicial);
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
      rect(width/2-espessura, height/2-espessura, 2*espessura, 2*espessura); //gambiarra
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
}