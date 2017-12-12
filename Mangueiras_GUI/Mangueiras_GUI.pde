import controlP5.*;
ControlP5 cp5;
Slider numUI;
RadioButton rbHar, rbColor;
RadioButton rb7v, rb6v, rb5v, rb4v, rb3v, rb2v, rb1v;
RadioButton rb7h, rb6h, rb5h, rb4h, rb3h, rb2h, rb1h;
DropdownList drp7v, drp6v, drp5v, drp4v, drp3v, drp2v, drp1v;
DropdownList drp7h, drp6h, drp5h, drp4h, drp3h, drp2h, drp1h;
Accordion UI;


//Quadro1
String posicaoQuebrasTopDownQ1[] = {"0", "vazio", "vazio", "meio@interna", "vazio", "vazio", " ", " "};
String posicaoQuebrasLeftRightQ1[] = {"0", "vazio", "vazio", "meio@externa", "meio@externa", "meio@externa", " ", " "};
int numeroDivisoesQ1= 5;
color coresHSVQ1[] = new color[8];
String cHarmonyQ1 ="triad";

//Quadro2
String posicaoQuebrasTopDownQ2[] = {"0", "vazio", "meio@externa", "vazio", "meio@interna", "terco@externa", " ", " "};
String posicaoQuebrasLeftRightQ2[] = {"0", "vazio", "vazio", "meio@interna", "vazio", "meio@interna", " ", " "};
int numeroDivisoesQ2= 5;
color coresHSVQ2[] = new color[8];
String cHarmonyQ2 = "triad";

//Quadro3
String posicaoQuebrasTopDownQ3[] = {"0", "vazio", "vazio", "vazio", "meio@externa", "meio@externa", "meio@externa", " "};
String posicaoQuebrasLeftRightQ3[] = {"0", "vazio", "vazio", "vazio", "meio@interna", "vazio", "vazio", " "};
int numeroDivisoesQ3= 6;
color coresHSVQ3[] = new color[8];
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


Mangueira quadroQR;
int contador = 0, tempo = 60;

String existentesTopDown[][] = {posicaoQuebrasTopDownQ1, posicaoQuebrasTopDownQ2, posicaoQuebrasTopDownQ3, posicaoQuebrasTopDownQ4};
String existentesLeftRight[][] = {posicaoQuebrasLeftRightQ1, posicaoQuebrasLeftRightQ2, posicaoQuebrasLeftRightQ3, posicaoQuebrasLeftRightQ4};
String existentesHarmonia[] = {cHarmonyQ1, cHarmonyQ2, cHarmonyQ3, cHarmonyQ4};
color coresExistentesTriad[][] = {coresHSVQ1, coresHSVQ2};
color coresExistentesDiad[][] = {coresHSVQ3, coresHSVQ4};

void gui() {
  cp5 = new ControlP5(this); 

  cp5.setColorForeground(color(0, 0, 40));
  cp5.setColorActive(color(0, 0, 60));

  Group g1 = cp5.addGroup("Numero de camadas")
    .setColorBackground(color(0, 0, 20))
    .setBackgroundColor(color(0, 0, 15));
  //.setBarHeight(15);

  numUI = cp5.addSlider("numeroDivisoesQR")
    .setRange(5, 7)
    .setColorBackground(color(0, 0, 20))
    .setValue(numeroDivisoesQR)
    .setPosition(20, 15)
    .setSize(160, 15)
    .setColorLabel(color(0, 0, 15))
    .setNumberOfTickMarks(3)
    .setSliderMode(Slider.FLEXIBLE)
    .moveTo(g1);

  cp5.getController("numeroDivisoesQR").getValueLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(10);
  cp5.getController("numeroDivisoesQR").setValue(7);

  //.setColorLabel(color(57, 158, 168));
  Group g2 = cp5.addGroup("Harmonia de cores")
    .setColorBackground(color(0, 0, 20))
    .setBackgroundColor(color(0, 0, 15))
    ;

  rbHar = cp5.addRadioButton("harmonia")
    .setColorBackground(color(0, 0, 20))
    .setPosition(20, 30)
    .setItemWidth(42)
    .setItemHeight(42)
    .setItemsPerRow(2)
    .setSpacingColumn(50)
    .addItem("diade", 0)
    .addItem("triade", 1)
    .setColorLabel(color(255))
    .moveTo(g2);

  rbHar.activate(1);


  Group g3 = cp5.addGroup("Modificar Divisoes Verticais")
    .setColorBackground(color(0, 0, 20))
    .setBackgroundColor(color(0, 0, 15))
    .setBackgroundHeight(310);

  rb7v =cp5.addRadioButton("tipoQuebraVertical7")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 265)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaVertical7", 0)
    .addItem("ExternaVertical7", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g3);

  drp7v = cp5.addDropdownList("Camada7V")
    .setPosition(10, 250)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g3);

  rb6v = cp5.addRadioButton("tipoQuebraVertical6")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 225)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaVertical6", 0)
    .addItem("ExternaVertical6", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g3);

  drp6v = cp5.addDropdownList("Camada6V")
    .setPosition(10, 210)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g3);

  rb5v = cp5.addRadioButton("tipoQuebraVertical5")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 185)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaVertical5", 0)
    .addItem("ExternaVertical5", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g3);

  drp5v = cp5.addDropdownList("Camada5V")
    .setPosition(10, 170)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g3);

  rb4v = cp5.addRadioButton("tipoQuebraVertical4")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 145)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaVertical4", 0)
    .addItem("ExternaVertical4", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g3);

  drp4v = cp5.addDropdownList("Camada4V")
    .setPosition(10, 130)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g3);

  rb3v = cp5.addRadioButton("tipoQuebraVertical3")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 105)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaVertical3", 0)
    .addItem("ExternaVertical3", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g3);

  drp3v = cp5.addDropdownList("Camada3V")
    .setPosition(10, 90)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g3);

  rb2v = cp5.addRadioButton("tipoQuebraVertical2")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 65)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaVertical2", 0)
    .addItem("ExternaVertical2", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g3);

  drp2v = cp5.addDropdownList("Camada2V")
    .setPosition(10, 50)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g3);

  rb1v = cp5.addRadioButton("tipoQuebraVertical1")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 25)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaVertical1", 0)
    .addItem("ExternaVertical1", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g3);

  drp1v = cp5.addDropdownList("Camada1V")
    .setPosition(10, 10)
    .setSize(180, 40)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g3);

  Group g4 = cp5.addGroup("Modificar Divisoes Horizontais")
    .setColorBackground(color(0, 0, 20))
    .setBackgroundColor(color(0, 0, 15))
    .setBackgroundHeight(310);

  rb7h = cp5.addRadioButton("tipoQuebraHorizontal7")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 265)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaHorizontal7", 0)
    .addItem("ExternaHorizontal7", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g4);

  drp7h = cp5.addDropdownList("Camada7H")
    .setPosition(10, 250)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g4);

  rb6h = cp5.addRadioButton("tipoQuebraHorizontal6")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 225)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaHorizontal6", 0)
    .addItem("ExternaHorizontal6", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g4);

  drp6h = cp5.addDropdownList("Camada6H")
    .setPosition(10, 210)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g4);

  rb5h = cp5.addRadioButton("tipoQuebraHorizontal5")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 185)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaHorizontal5", 0)
    .addItem("ExternaHorizontal5", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g4);

  drp5h = cp5.addDropdownList("Camada5H")
    .setPosition(10, 170)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g4);

  rb4h = cp5.addRadioButton("tipoQuebraHorizontal4")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 145)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaHorizontal4", 0)
    .addItem("ExternaHorizontal4", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g4);

  drp4h = cp5.addDropdownList("Camada4H")
    .setPosition(10, 130)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g4);


  rb3h = cp5.addRadioButton("tipoQuebraHorizontal3")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 105)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaHorizontal3", 0)
    .addItem("ExternaHorizontal3", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g4);

  drp3h = cp5.addDropdownList("Camada3H")
    .setPosition(10, 90)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g4);

  rb2h = cp5.addRadioButton("tipoQuebraHorizontal2")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 65)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaHorizontal2", 0)
    .addItem("ExternaHorizontal2", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g4);

  drp2h = cp5.addDropdownList("Camada2H")
    .setPosition(10, 50)
    .setSize(180, 200)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g4);

  rb1h = cp5.addRadioButton("tipoQuebrHorizontal1")
    .setColorBackground(color(0, 0, 23))
    .setPosition(10, 25)
    .setItemWidth(15)
    .setItemHeight(15)
    .setItemsPerRow(2)
    .setSpacingColumn(100)
    .addItem("InternaHorizontal1", 0)
    .addItem("ExternaHorizontal1", 1)
    .setColorLabel(color(255))
    .hide()
    .moveTo(g4);

  drp1h = cp5.addDropdownList("Camada1H")
    .setPosition(10, 10)
    .setSize(180, 40)
    .setColorBackground(color(0, 0, 20))
    .setOpen(false)
    .moveTo(g4);

  Group g5 = cp5.addGroup("Paleta de cores")
    .setColorBackground(color(0, 0, 20))
    .setBackgroundColor(color(0, 0, 15))
    ;

  rbColor = cp5.addRadioButton("paleta")
    .setColorBackground(color(0, 0, 20))
    .setPosition(20, 30)
    .setItemWidth(42)
    .setItemHeight(42)
    .setItemsPerRow(2)
    .setSpacingColumn(50)
    .addItem("#1", 0)
    .addItem("#2", 1)
    .setColorLabel(color(255))
    .moveTo(g5);

  rbColor.activate(1);

  UI = cp5.addAccordion("acc")
    .setPosition(600, 5)
    .setWidth(200)
    .setHeight(300)
    .addItem(g1)
    .addItem(g2)
    .addItem(g3)
    .addItem(g4)
    .addItem(g5);

  UI.open(0, 1, 4);
  UI.setCollapseMode(Accordion.MULTI);
  for (int mode = 0; mode<2; mode++) {
    for (int j =7; j>0; j--) {
      ArrayList<String> contem = new ArrayList<String>();
      for (int i=0; i<4; i++) {
        if (mode==0) {
          String s[]= existentesTopDown[i][j].split("@");
          if (!((s[0].equals(" "))||(s[0].equals("0"))||(contem.contains(s[0])))) {
            switch(j) {
            case 1: 
              drp1v.addItem(s[0], contem.size()); 
              break;
            case 2: 
              drp2v.addItem(s[0], contem.size()); 
              break;
            case 3: 
              drp3v.addItem(s[0], contem.size()); 
              break;
            case 4: 
              drp4v.addItem(s[0], contem.size()); 
              break;
            case 5: 
              drp5v.addItem(s[0], contem.size()); 
              break;
            case 6: 
              drp6v.addItem(s[0], contem.size()); 
              break;
            case 7: 
              drp7v.addItem(s[0], contem.size()); 
              break;
            }
            contem.add(s[0]);
          }
        } else if (mode==1) {
          String s[]= existentesLeftRight[i][j].split("@");
          if (!((s[0].equals(" "))||(s[0].equals("0"))||(contem.contains(s[0])))) {
            switch(j) {
            case 1: 
              drp1h.addItem(s[0], contem.size()); 
              break;
            case 2: 
              drp2h.addItem(s[0], contem.size()); 
              break;
            case 3: 
              drp3h.addItem(s[0], contem.size()); 
              break;
            case 4: 
              drp4h.addItem(s[0], contem.size()); 
              break;
            case 5: 
              drp5h.addItem(s[0], contem.size()); 
              break;
            case 6: 
              drp6h.addItem(s[0], contem.size()); 
              break;
            case 7: 
              drp7h.addItem(s[0], contem.size()); 
              break;
            }
            contem.add(s[0]);
          }
        }
      }
    }
  }
}

void inicializarCores() {
  coresHSVQ1[0] = color(0.91, 64.39, 80.39); 
  coresHSVQ1[1] = color(205.47, 49.53, 83.92); 
  coresHSVQ1[2] = color(57.14, 9.46, 87.06); 
  coresHSVQ1[3] = color(116.32, 72.61, 61.57); 
  coresHSVQ1[4] = color(150, 4.26, 18.43); 
  coresHSVQ1[5] = color(46.5, 19.32, 81.18);
  coresHSVQ1[6] = coresHSVQ1[round(random(0, 4))];
  coresHSVQ1[7] = coresHSVQ1[round(random(0, 5))];
  coresHSVQ2[0] = color(187.89, 42.7, 34.9); 
  coresHSVQ2[1] = color(44.65, 18.78, 89.8); 
  coresHSVQ2[2] = color(97.38, 35.06, 68.24); 
  coresHSVQ2[3] = color(40.43, 20.26, 89.02); 
  coresHSVQ2[4] = color(8.63, 62.33, 87.45); 
  coresHSVQ2[5] = color(46.5, 19.32, 81.18);
  coresHSVQ2[6] = coresHSVQ2[round(random(0, 4))];
  coresHSVQ2[7] = coresHSVQ2[round(random(0, 5))];
  coresHSVQ3[0] = color(40, 8.04, 87.84); 
  coresHSVQ3[1] = color(0, 0, 11.76); 
  coresHSVQ3[2] = color(63.57, 60.43, 54.51); 
  coresHSVQ3[3] = color(3.38, 86.49, 72.55); 
  coresHSVQ3[4] = color(138.75, 23.53, 26.67); 
  coresHSVQ3[5] = color(0, 0, 11.76); 
  coresHSVQ3[6] = color(46.5, 19.32, 81.18);
  coresHSVQ3[7] = coresHSVQ1[round(random(0, 6))];
  coresHSVQ4[0] = color(193.66, 99.02, 40); 
  coresHSVQ4[1] = color(224.48, 92.8, 49.02); 
  coresHSVQ4[2] = color(4.19, 91.01, 74.12); 
  coresHSVQ4[3] = color(180.86, 86.42, 63.53); 
  coresHSVQ4[4] = color(208.55, 80.58, 80.78); 
  coresHSVQ4[5] = color(2.33, 81.08, 87.06); 
  coresHSVQ4[6] = color(190, 85.71, 57.65); 
  coresHSVQ4[7] = color(46.5, 19.32, 81.18);
  cHarmonyQR = gerarHarmonia(existentesHarmonia);
  coresHSVQR = gerarCores(numeroDivisoesQR+1, cHarmonyQR, coresExistentesDiad, coresExistentesTriad);
}

void setup() {
  size(800, 600);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  frameRate(60);  
  background(46.5, 19.32, 70);

  gui();

  inicializarCores();

  quadroAleatorioTopDown = gerarQuadroAleatorio(numeroDivisoesQR, "TopDown");
  quadroAleatorioLeftRight = gerarQuadroAleatorio(numeroDivisoesQR, "LeftRight");
  quadroQR = new Mangueira (0, 0, (width-200), height, numeroDivisoesQR, quadroAleatorioTopDown, quadroAleatorioLeftRight, coresHSVQR, cHarmonyQR);

  cHarmonyQR = gerarHarmonia(existentesHarmonia);
  coresHSVQR = gerarCores(numeroDivisoesQR+1, cHarmonyQR, coresExistentesTriad, coresExistentesDiad);
}

int numAnterior= numeroDivisoesQR;

void draw() {
  fill(0, 0, 9);
  rect(600, 0, 200, 800);
  if ((numAnterior != numeroDivisoesQR)) {
    updateQuadro();
  }
  //println(rb7v.getValue());
  numAnterior=numeroDivisoesQR;
  quadroQR.criarQuadro();
}

void updateQuadro() {
  quadroQR = new Mangueira (0, 0, (width-200), height, numeroDivisoesQR, quadroAleatorioTopDown, quadroAleatorioLeftRight, coresHSVQR, cHarmonyQR);
}

void harmonia(int a) {
  if (a==0) {
    cHarmonyQR = "diad";
    updateQuadro();
  } else if (a==1) {
    cHarmonyQR ="triad";
    updateQuadro();
  }
}

void paleta(int a) {
  if (a==0) {
    if (cHarmonyQR.equals("diad")) {
      coresHSVQR = coresHSVQ3;
      updateQuadro();
    } else if (cHarmonyQR.equals("triad")) {
      coresHSVQR = coresHSVQ1;
      updateQuadro();
    }
  } else if (a==1) {
    if (cHarmonyQR.equals("diad")) {
      coresHSVQR = coresHSVQ4;
      updateQuadro();
    } else if (cHarmonyQR.equals("triad")) {
      coresHSVQR = coresHSVQ2;
      updateQuadro();
    }
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(drp1v)) {
    switch((int)theEvent.getValue()) {
    case 0:
      quadroAleatorioTopDown[1] = "vazio";
      updateQuadro();
      break;
    }
  } else if (theEvent.isFrom(drp2v)) {
    switch((int)theEvent.getValue()) {
    case 0:
      quadroAleatorioTopDown[2] = "vazio";
      updateQuadro();
      rb2v.hide();
      break;
    case 1:
      rb2v.show();
      break;
    }
  } else if (theEvent.isFrom(drp3v)) {
    switch((int)theEvent.getValue()) {
    case 0:
      rb3v.show();
      break;
    case 1:
      quadroAleatorioTopDown[3] = "vazio";
      updateQuadro();
      rb3v.hide();
      break;
    }
  } else if (theEvent.isFrom(drp4v)) {
    switch((int)theEvent.getValue()) {
    case 0:
      quadroAleatorioTopDown[4] = "vazio";
      updateQuadro();
      rb4v.hide();
      break;
    case 1:
      quadroAleatorioTopDown[4] = "meio";
      rb4v.show();
      break;
    }
  } else if (theEvent.isFrom(drp5v)) {
    switch((int)theEvent.getValue()) {
    case 0:
      quadroAleatorioTopDown[5] = "vazio";
      updateQuadro();
      rb5v.hide();
      break;
    case 1:
      rb5v.show();
      break;
    case 2:
      rb5v.show();
      break;
    }
  } else if (theEvent.isFrom(drp6v)) {
    switch((int)theEvent.getValue()) {
    case 0:
      rb6v.show();
      break;
    }
  } else if (theEvent.isFrom(drp7v)) {
    switch((int)theEvent.getValue()) {
    case 0:
      rb7v.show();
      break;
    }
  } else if (theEvent.isFrom(drp1h)) {
    switch((int)theEvent.getValue()) {
    case 0:
      quadroAleatorioLeftRight[1] = "vazio";
      updateQuadro();
      break;
    }
  } else if (theEvent.isFrom(drp2h)) {
    switch((int)theEvent.getValue()) {
    case 0:
      quadroAleatorioLeftRight[2] = "vazio";
      updateQuadro();
      rb2h.hide();
      break;
    case 1:
      rb2h.show();
      break;
    }
  } else if (theEvent.isFrom(drp3h)) {
    switch((int)theEvent.getValue()) {
    case 0:
      rb3h.show();
      break;
    case 1:
      quadroAleatorioLeftRight[3] = "vazio";
      updateQuadro();
      rb3h.hide();
      break;
    }
  } else if (theEvent.isFrom(drp4h)) {
    switch((int)theEvent.getValue()) {
    case 0:
      rb4h.show();
      break;
    case 1:
      quadroAleatorioLeftRight[4] = "vazio";
      updateQuadro();
      rb4h.hide();
      break;
    }
  } else if (theEvent.isFrom(drp5h)) {
    switch((int)theEvent.getValue()) {
    case 0:
      rb5h.show();
      break;
    case 1:
      quadroAleatorioLeftRight[5] = "vazio"; 
      rb5h.hide();
      updateQuadro();
      break;
    }
  } else if (theEvent.isFrom(drp6h)) {
    switch((int)theEvent.getValue()) {
    case 0:
      quadroAleatorioLeftRight[6] = "vazio";
      updateQuadro();
      rb6h.hide();
      break;
    case 1:
      rb6h.show();
      break;
    }
  } else if (theEvent.isFrom(drp7h)) {
    switch((int)theEvent.getValue()) {
    case 0:
      quadroAleatorioLeftRight[7] = "vazio";
      updateQuadro();
      break;
    }
  } else if (theEvent.isFrom(rb7v)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp7v.getValue()==0.0) {
        quadroAleatorioTopDown[7]= "corner@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp7v.getValue()==0.0) {
        quadroAleatorioTopDown[7]= "corner@externa";
        updateQuadro();
      }
      break;
    }
  } else if (theEvent.isFrom(rb6v)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp6v.getValue()==0.0) {
        quadroAleatorioTopDown[6]= "meio@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp6v.getValue()==0.0) {
        quadroAleatorioTopDown[6]= "meio@externa";
        updateQuadro();
      }
      break;
    }
  } else if (theEvent.isFrom(rb5v)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp5v.getValue()==1.0) {
        quadroAleatorioTopDown[5]= "terco@interna";
        updateQuadro();
      } else if (drp5v.getValue()==2.0) {
        quadroAleatorioTopDown[5]= "meio@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp5v.getValue()==1.0) {
        quadroAleatorioTopDown[5]= "terco@externa";
        updateQuadro();
      } else if (drp5v.getValue()==2.0) {
        quadroAleatorioTopDown[5]= "meio@externa";
        updateQuadro();
      }
      break;
    }
    println(quadroAleatorioTopDown[4]);
  } else if (theEvent.isFrom(rb4v)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp4v.getValue()==1.0) {
        quadroAleatorioTopDown[4]= "meio@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp4v.getValue()==1.0) {
        quadroAleatorioTopDown[4]= "meio@externa";
        updateQuadro();
      }
      break;
    }
  } else if (theEvent.isFrom(rb3v)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp3v.getValue()==0.0) {
        quadroAleatorioTopDown[3]= "meio@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp3v.getValue()==0.0) {
        quadroAleatorioTopDown[3]= "meio@externa";
        updateQuadro();
      }
      break;
    }
  } else if (theEvent.isFrom(rb2v)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp2v.getValue()==1.0) {
        quadroAleatorioTopDown[2]= "meio@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp2v.getValue()==1.0) {
        quadroAleatorioTopDown[2]= "meio@externa";
        updateQuadro();
      }
      break;
    }
  } else if (theEvent.isFrom(rb6h)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp6h.getValue()==1.0) {
        quadroAleatorioLeftRight[6]= "meio@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp6h.getValue()==1.0) {
        quadroAleatorioLeftRight[6]= "meio@externa";
        updateQuadro();
      }
      break;
    }
  } else if (theEvent.isFrom(rb5h)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp5h.getValue()==0.0) {
        quadroAleatorioLeftRight[5]= "meio@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp5h.getValue()==0.0) {
        quadroAleatorioLeftRight[5]= "meio@externa";
        updateQuadro();
      }
      break;
    }
  } else if (theEvent.isFrom(rb4h)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp4h.getValue()==0.0) {
        quadroAleatorioLeftRight[4]= "meio@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp4h.getValue()==0.0) {
        quadroAleatorioLeftRight[4]= "meio@externa";
        updateQuadro();
      }
      break;
    }
  }
  else if (theEvent.isFrom(rb3h)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp3h.getValue()==0.0) {
        quadroAleatorioLeftRight[3]= "meio@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp3h.getValue()==0.0) {
        quadroAleatorioLeftRight[3]= "meio@externa";
        updateQuadro();
      }
      break;
    }
  }
  if (theEvent.isFrom(rb2h)) {
    switch((int)theEvent.getValue()) {
    case 0 :
      if (drp2h.getValue()==1.0) {
        quadroAleatorioLeftRight[2]= "meio@interna";
        updateQuadro();
      }
      break;
    case 1:
      if (drp2h.getValue()==1.0) {
        quadroAleatorioLeftRight[2]= "meio@externa";
        updateQuadro();
      }
      break;
    }
  }
}