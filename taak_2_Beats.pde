//chaimae Fkir Sellam 
//gebruikte bron voor 3D beelden: https://processing.org/tutorials/p3d/(3D Shapes).
//gebruikte bron voor 3D rotatie's: https://www.youtube.com/watch?v=4KKTECjP7TY.
//Coördinates of cube
int middleX, middleY, top, bottom, left, right, topCorner, bottomCorner;
float r=0;
int value = 15;
//Variables for myAnimation
int size = 10;
boolean playMyAnimation = true;
boolean start = true;
boolean stop = false;
boolean playBox = true;

void setup() {
  size(1280, 720,P3D); 
  colorMode(HSB, 360, 100, 100, 100);

  setGlobalVariables();
  initializeMinim ();
   
 lights(); 
}

void draw() {
  //White background
  background(0, 0, 100);
  rectMode(CENTER);

  //checks each frame if there is a beat.
  beat.detect(player.mix);
  //draw custom animations
  drawAnimations();
  //draws the cube mask on top
  drawCubeMask();


}

void keyReleased() {
  //toggle Animations ON or OFF
  if (key == 'k') {
    playMyAnimation = !playMyAnimation;  
  }
 
}

void drawAnimations(){
   
 
  //play animation if toggled ON
  if (playMyAnimation == true) {
    myAnimation();
  }
if (start == true) {
    myAnimation();
  }
  if (stop == false) {
    myAnimation();
  }
 
}

void myAnimation() {


  //bij het drukken op de 'u','o','f','r'en'm'toets zal je op de beats en beeld krijgen.
  if (beat.isOnset()) {
    //when a beat is detected, the global size variable is reset to 10.
    size = 10;
    //bij deze toets krijg je een cirkel dat van kleur verandert op de ritme.
  } if (key=='u') {
    noStroke();
    fill(frameCount % 360, 100, 100);
    ellipse(middleX, middleY, size, size);
    size+= 20;}
    //bij deze toets krijg je een vierkant dat op rode achtergrond van kleur verandert op de ritme.
 if (key=='o') {
    background(360,100,50);
    noStroke();
    size+= 1;
    fill(frameCount % 360, 30, 100);
    rect(middleX, middleY, size, size);
    size+= 10;
      //bij deze toets krijg je een 3D beeld te zien dat op de ritme vergroot op grijze achtergrond.    
  } if (key=='f'){
       pushMatrix();
fill(frameCount % 360, 100, 100);
translate(middleX, middleY, size);
rotateY(r);
stroke(255);
strokeWeight(3);
sphere(180);
popMatrix();
size+=1;
 //bij deze toets krijg je een vierkant dat van kleur  verandert op de ritme.
  } if (key=='r'){
    background(360);
     noStroke();
    fill(frameCount % 360, 100, 100);
     rect(middleX, middleY, size, size);
     size+=5;
  //bij deze toets krijg je een 3D beeld te zien dat op de ritme 360°draait.
   }else if (key=='m') {
     background(100);
   pushMatrix();
fill(frameCount%360,100, 100);
translate(middleX, middleY, size);
rotateY(r);
stroke(255);
strokeWeight(3);
sphere(180);
popMatrix();
r =r+0.1;
  }
 
}