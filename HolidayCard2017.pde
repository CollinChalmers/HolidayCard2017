
/////// Holiday_Card
import java.util.Iterator;
float xPos = random(0,600);
float yPos =0;
Snow s;
Ground g = new Ground();
Man m = new Man();
Background b = new Background();
Santa h = new Santa();
ArrayList<Snow> flake = new ArrayList<Snow>();
float hPos=0;
int hCount=0;
boolean prez = false;
boolean prez2 = false;
boolean text= false;
// LINE COUNT 432

void setup(){
  
  flake.add(new Snow(random(0,600),0));
  
 size(600,600);

b.drawBackground();

man = loadImage("man.png");
man.resize(200,200);
santa = loadImage("santa2.png");
santa.resize(250,150);
wreath = loadImage("wreath.png");
wreath.resize(75,75);
gift = loadImage("gift.png");
gift.resize(35,35);


 
 
}

void draw(){
  noStroke();
background(0);
 int count=0;
 int hPos = 0;

 fill(234,234,250);
 rect(0,525,600,100);
 // presents
 if(santaX==200){
   prez=true;
    }
    if(prez==true){
     fill(255);
     image(gift,400,presentY);
     
     if(presentY<500){
       presentY+=2;
     }
   }
   if(santaX==-50){
     prez2=true;
   }
     if(prez2==true){
       image(gift,175,presentY2);
  
   if(presentY2<500){
     presentY2+=2;
   }
    
   }
  // santa
  h.run();
 //background
 while(hPos<600){
 b.run(hPos);
 hPos+=225;
 hCount++;

 
 
 }
 //text
 if(text==true){
  fill(152,34,34);
 textSize(50);
 text("Happy Holidays!!",100,590);

 }
 //ground snow
 
 
 g.run();
 
 //man
 m.run();
 
 //snow fall
 fill(255);
 for(Snow x : flake){
   x.drawSnow();
   x.moveSnow();
   x.removeSnow();
  count++;
 }
  
 if(count<1000){
   flake.add(new Snow(random(-200,600),yPos));
   
   
   }
   Iterator<Snow> it = flake.iterator();
   while(it.hasNext()){
    Snow p = (Snow) it.next(); 
    p.run();
    if(p.removeSnow()){
     it.remove(); 
    }
    
   }
   
   
   
}

///////Background
PShape s1;  // The PShape object
 PShape shp;
 PShape shp2;
 PShape shp3;
 PImage wreath;
 float clear=255;
 float fillDir=1;
 float s1X=25;
 float shpX=25;
 float shp2X=105;
 float shp3X=145;
 float rWinX=128;
 float winX=146;
 float doorX=50;
 float chimX=175;
 float wreathX = 45;
public class Background{

  public Background(){
    
    
  }
  
  
  void drawBackground(){
     s1 = createShape();
  s1.beginShape();
  s1.fill(166,170,175);
  
  s1.vertex(-15, 0);
  s1.vertex(215, 0);
  s1.vertex(100, -100);
  s1.endShape(CLOSE);
  
  shp= createShape();
    shp.beginShape();
    shp.fill(127,77,0);
  
    shp.vertex(0,0);
    shp.vertex(0,200);
    shp.vertex(200,200);
    shp.vertex(200,0);
    
    shp.endShape(CLOSE);
    
    shp2 = createShape();
    shp2.beginShape();
    fill(255);
    shp2.vertex(0,0);
    shp2.vertex(0,5);
    shp2.vertex(20,5);
    shp2.vertex(20,25);
    shp2.vertex(25,25);
    shp2.vertex(25,5);
    shp2.vertex(45,5);
    shp2.vertex(45,0);
    shp2.vertex(25,0);
    shp2.vertex(25,-20);
    shp2.vertex(20,-20);
    shp2.vertex(20,0);
    shp2.endShape(CLOSE);
    
    shp3 = createShape();
    shp3.beginShape();
    fill(255);
    shp3.vertex(0,0);
    shp3.vertex(0,5);
    shp3.vertex(35,5);
    shp3.vertex(35,40);
    shp3.vertex(40,40);
    shp3.vertex(40,5);
    shp3.vertex(75,5);
    shp3.vertex(75,0);
    shp3.vertex(40,0);
    shp3.vertex(40,-35);
    shp3.vertex(35,-35);
    shp3.vertex(35,0);
    shp3.endShape(CLOSE);
  }
  
  void run(float x){
    
    
    fill(104,17,17);
    rect(chimX+x,250,35,100);
    shape(s1, s1X+x, 350);
  shape(shp,shpX+x,350);
  clear=clear+fillDir;
  if(clear<125|| clear>255){
  
  fillDir=-fillDir;
  }
  
  fill(255,188,0);
  ellipse(rWinX+x,322,45,45);
  fill(255,188,0,clear);
  shape(shp2,shp2X+x,318);
  rect(winX+x,400,75,75);
  shape(shp3, shp3X+x,435);
  fill(0,43,0);
  rect(doorX+x,440,60,110);
  image(wreath, wreathX+x,362);
 
  }
  
  
  
}
//////Ground
boolean canGrow=true;
public class Ground{
  float groundX = 300;
float groundW = 600;
float groundH = 0;

 public Ground(){
   
 }
 
 
 void drawGround(){
   fill(255);
 ellipse(groundX,610,groundW,groundH);
 }
  
  void moveGround(){
    if(groundH>225){
  canGrow=false; 
  text=true;
 }
 if(canGrow==true){
 groundH+=.25;
 groundW+=.25;
 
 }  
 
 
 //if(mousePressed==true){
   if(manMove==true){
 groundX++;
 groundW--;
 groundH++;
 
 if(manX >600){
   groundX=300;
   groundW=600;
   groundH=0;
   manX=-270;
   clumpX=-70;
   canGrow=true;
   text=false;
   manMove=false;
   
 }
 }
  }
  
  void run(){
   drawGround();
   moveGround();
  }
  
  
}


//////Man
PImage  man; 
float manX = -270;
float clumpX= -70;
boolean manMove = false;
public class Man{

  public Man(){
    
    
  }
  
   void drawMan(){
     
     
     image(man, manX,400);
     ellipse(clumpX,550,100,150);
   
   }
   
   void moveMan(){
     /*if(mousePressed==true){
       manX+=1.45;
       clumpX+=1.45;
     }
       */
       if(canGrow==false){
          manX+=1.45;
       clumpX+=1.45;
       manMove=true;
       }
       
     }
   
   
   void run(){
    drawMan();
    moveMan();
   }
  
  
}
///////Santa
PImage santa;
PImage gift;
float santaX= 800;
float presentY = 150;
float presentY2=150;

public class Santa{
  
  public Santa(){
    
  }
  
  void drawSanta(){
    image(santa,santaX,50);
    
    
  }
  
  void moveSanta(){
    
    santaX-=2;
    if(santaX <-500){
      prez=false;
      prez2=false;
      santaX=800;
      presentY=150;
      presentY2=150;
    }
    
    
  }
  
  void run(){
    drawSanta();
    moveSanta();
    
  }
  
  
  
}

//////Snow
public class Snow{
 PVector accel, pos, velo;
 boolean isDead;
 float s =random(1,10);
  public Snow(float x, float y){
    if(s>5){
    pos = new PVector(x,y);
     accel = new PVector(.001,.01);
      velo = new PVector(.5,1);
    }
    else {
    pos = new PVector(x,y);
     accel = new PVector(.0001,.001);
      velo = new PVector(.4,.9);
    }
      
  }   
  
   
  void setPos(PVector p){
    
    pos =p;
    
  }
   void setAccel(PVector a){
    accel = a;
    
  }
   void setVelo(PVector v){
    velo = v;
    
  }
  
  public PVector getPos(){
    return pos;
  }
 public float getYPos(){
   return pos.y;
 }
   public PVector getAccel(){
    return accel;
  }
   public PVector getVelo(){
    return velo;
  }

  void drawSnow(){
    
    ellipse(getPos().x, getPos().y, s,s);
   
  }
  void moveSnow(){
  velo.add(accel);
    pos.add(velo);  
  }
  
  void run(){
    drawSnow();
    moveSnow();
    
  }
  public boolean removeSnow(){
    if(getYPos()>600){
     return true;
   }
   else return false;
 
 }
    
  }
  
