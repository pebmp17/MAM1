

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
      rect((width-200)/2-espessura, height/2-espessura, 2*espessura, 2*espessura); //gambiarra
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