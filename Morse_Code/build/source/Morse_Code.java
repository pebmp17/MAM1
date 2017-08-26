import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Morse_Code extends PApplet {

morseTrans[] morseDict = new morseTrans[26];
char letter;



public void setup() {
  morseDict[0] = new morseTrans('A', "dot-dash-end");
  morseDict[1] = new morseTrans('B', "dash-dot-dot-dot-end");
  morseDict[2] = new morseTrans('C', "dash-dot-dash-dot-end");
  morseDict[3] = new morseTrans('D', "dash-dot-dot-end");
  morseDict[4] = new morseTrans('E', "dot-end");
  morseDict[5] = new morseTrans('F', "dot-dot-dash-dot-end");
  morseDict[6] = new morseTrans('G', "dash-dash-dot-end");
  morseDict[7] = new morseTrans('H', "dot-dot-dot-dot-end");
  morseDict[8] = new morseTrans('I',"dot-dot-end");
  morseDict[9] = new morseTrans('J',"dot-dash-dash-dash-end");
  morseDict[10] = new morseTrans('K', "dash-dot-dash-end");
  morseDict[11] = new morseTrans('L', "dot-dash-dot-dot-end");
  morseDict[12] = new morseTrans('M', "dash-dash-end");
  morseDict[13] = new morseTrans('N', "dash-dot-end");
  morseDict[14] = new morseTrans('O', "dash-dash-dash-end");
  morseDict[15] = new morseTrans('P', "dot-dash-dash-dot-end");
  morseDict[16] = new morseTrans('Q', "dash-dash-dot-dash-end");
  morseDict[17] = new morseTrans('R', "dot-dash-dot-end");
  morseDict[18] = new morseTrans('S',"dot-dot-dot-end");
  morseDict[19] = new morseTrans('T',"dash-end");
  morseDict[20] = new morseTrans('U', "dot-dot-dash-end");
  morseDict[21] = new morseTrans('V', "dot-dot-dot-dash-end");
  morseDict[22] = new morseTrans('W', "dot-dash-dash-end");
  morseDict[23] = new morseTrans('X', "dash-dot-dot-dash-end");
  morseDict[24] = new morseTrans('Y', "dash-dot-dash-dash-end");
  morseDict[25] = new morseTrans('Z', "dash-dash-dot-dot-end");

  noLoop();
  
}

public void draw() {

  background(0);
  textSize(14);
  text("Digite uma letra para ver sua tradu\u00e7\u00e3o em c\u00f3digo morse", 20, 50);
  textSize(36);
  text(letter, 50, 120);
  fill(255);
  noStroke();
  rectMode(CENTER);
  morseDisplay(letter,160,250,340,430,250);
}

public void keyTyped() {
  if (key >= 'A' && key <= 'z')
    letter = Character.toUpperCase(key);
   redraw();
}

public void morseDisplay (char c,int x1, int x2, int x3, int x4, int y){
  String[] morse;
  //try{
    for (morseTrans o: morseDict){
      if (c == o.alfabeto){
        morse = o.morse.split("-");
        if (morse[0].equals("dot")) ellipse(x1,y,70,70);
        else if (morse[0].equals("dash")) rect(x1,y,50,20);

        if (morse[1].equals("dot")) ellipse (x2,y,70,70);
        else if(morse[1].equals("dash")) rect (x2,y,70,20);
        else break;

        if(morse[2].equals("dot")) ellipse(x3,y,70,70);
        else if(morse[2].equals("dash")) rect(x3,y,70,20);
        else break;

        if(morse[3].equals("dot")) ellipse(x4,y,70,70);
        else if (morse[3].equals("dash")) rect (x4,y,70,20);
        else break;
     }
  }
}

class morseTrans {
  char alfabeto;
  String morse;
  morseTrans(char alfabeto, String morse){
    this.alfabeto = alfabeto;
    this.morse = morse;
  }
}
  public void settings() {  size(640, 360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Morse_Code" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
