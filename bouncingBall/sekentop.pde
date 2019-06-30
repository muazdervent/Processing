float yon=1;
float degdimi=0;
float r=50;
float cember=0;
float sayac=0;
float sayac1=1;
float done=0;
int can=3;
int topYildiz=0;
float kayma=0;
boolean yandi=false;

void settings(){
size(1400,920);
}
void setup(){
  
  background(255);
  //frameRate(150);
}
yildiz y1= new yildiz();
yildiz y2= new yildiz();
yildiz y3= new yildiz();
yildiz y4= new yildiz();
yildiz y5= new yildiz();
yildiz y6= new yildiz();
yildiz y7= new yildiz();

can can1= new can();
can can2=new can();
cant c1 = new cant();
daire d1=new daire();
PVector loc  = new PVector(325,780);
PVector vel  = new PVector(0.3,0);
PVector grav = new PVector(0,0.2);
PVector rain=new PVector(258,0);PVector rain1= new PVector(560,-450);


//basamaklar
PVector b1 = new PVector(0,750);
float b1x=2;
PVector b2=new PVector(500,650);
float b2x=3;
PVector b3= new PVector(40,520);
float b3x=3.8;
PVector b4= new PVector(600,420);
float b4x=3.5;

PVector b5= new PVector(200,850);



//bolum 3 elemanları

void draw(){
    background(255);
    if(done == 2){
      fill(#59686C);
      stroke(#59686C);
      rect(640-kayma,20,300,880);
      
      
      stroke(0);
    }
  
    textSize(20);
    String a1="Health: "+can;
    fill(0);
    text(a1,1250,50);
    noFill();
    
    
    d1.daireCiz(loc,r);
    loc.add(vel);
    vel.add(grav);
  
  
    if(done == 0 || done ==1){
        basamakCiz(b1,200,10);bDeyiyor(b1,200,10);
        basamakCiz(b2,150,10);bDeyiyor(b2,150,10);
        basamakCiz(b3,100,10);bDeyiyor(b3,100,10);
        basamakCiz(b4,140,10);bDeyiyor(b4,140,10);
        basamakCiz(b5,250,10);bDeyiyor(b5,250,10);
        
        xs();//tepedeki bitiş topu
        if(b1.x>width){
            b1.x=-200;
        }
        b1.x+=b1x;
        if(b2.x>width){
            b2.x=-150;
        }
        b2.x+=b2x;
        if(b3.x>width){
            b3.x=-100;
        }
        b3.x+=b3x;
        if(b4.x>width){
            b4.x=-140;
        }
        b4.x+=b4x;
        textSize(25);
        String a="Get in black hole with ball!";
  
        if(sayac<1000){
            fill(0);
            text(a,450,780);
            noFill();
            sayac++;
        }

        if(loc.y<110  && loc.x>650 && loc.x<750){
            done++;
            loc.x=330;loc.y=795;
            sayac=0;
            can=3;
        }
        if(loc.y+r/2 >height){//yere değmesi
            loc.x=325;loc.y=780;
            vel.x=0;vel.y=0;
            if (done == 1)can--;
        }
        if(loc.x+r/2>width){//sağ kenardan sekme
            vel.x*=-0.6;
            loc.x=width-r/2;
            yon*=-1;
            //c1.aciD*=0.5;
        } 
        if (loc.x-r/2<0){//sol kenardan sekme
            vel.x*=-0.6;
            loc.x=0+r/2;
            yon*=-1;
            //c1.aciD*=0.9;
        }
        
        println("loc.x :"+loc.x +" loc.y: "+loc.y);
        println("vel.x :"+vel.x +" vel.y: "+vel.y);
        println("mouseX:"+mouseX +" mouseY: "+mouseY);
   
    }

    //level 2-------------------------------------
    if(done == 1){
        textSize(25);
        String b="Dont touch bullets!";
        String a="LEVEL 2!";
        if(sayac1<1000){
            fill(0);
            text(a,630,200);
            text(b,550,300);
            noFill();
            sayac1++;
       }
  
      fill(0);
      strokeWeight(10);
      beginShape();
        vertex(rain.x,rain.y);
        vertex(rain.x,rain.y+20);
      endShape();
      beginShape();
        vertex(rain1.x,rain1.y);
        vertex(rain1.x,rain1.y+20);
      endShape();
      strokeWeight(2);
      rain.y+=10;rain1.y+=10;
      noFill();
      if((rain.x>loc.x-r/2 && rain.x < loc.x+r/2 && rain.y >loc.y-r/2 && rain.y-20<loc.y+r/2 )||(rain1.x>loc.x-r/2 && rain1.x < loc.x+r/2 && rain1.y >loc.y-r/2 && rain1.y-20<loc.y+r/2 )){
        if(can>=0){  
        loc.x=330;loc.y=800;
          vel.x=0; vel.y=0;can--;
        }else{done=0;loc.x=330;loc.y=800;
              vel.x=0; vel.y=0;can=3;}
      }
      if(rain.y>height){
          rain.x=random(800);
          rain.y=-20;
      }
      if(rain1.y>height){
          rain1.x=random(800);
          rain1.y=-20;
      }

   }
    //level 2 sonu-------------------------
    //level 3 *******************************************************************************************************************************************
     if(done ==2){
        println("mouseX:"+mouseX +" mouseY: "+mouseY+"topYıldız= "+topYildiz);
        println("loc.x:"+loc.x +" loc.y: "+loc.y);
        
        basamakCiz(new PVector(0,0),20,height);        bDeyiyor(new PVector(0,0),20,height);
        basamakCiz(new PVector(0,height-20),2400,20);  bDeyiyor(new PVector(0,height-20),2400,20);
        basamakCiz(new PVector(0,0),2400,20);         bDeyiyor(new PVector(0,0),2400,20);
        basamakCiz(new PVector(2380,0),20,height);         bDeyiyor(new PVector(2380,0),20,height);
        basamakCiz(new PVector(350,165),20,height-165);bDeyiyor(new PVector(350,165),20,height-165);
        basamakCiz(new PVector(180,700),170,20);       bDeyiyor(new PVector(180,700),170,20);
        basamakCiz(new PVector(17,490),170,20);        bDeyiyor(new PVector(17,490),170,20);
        c1.cantCiz(new PVector(80,570),45);            c1.cantKontrol(new PVector(80,570),45);
        y1.yildizCiz(new PVector(80,650),25);          y1.yildizKontrol(new PVector(80,650),25);
        basamakCiz(new PVector(200,220),150,20);       bDeyiyor(new PVector(200,220),150,20);
        c1.cantCiz(new PVector(360,55),20);            c1.cantKontrol(new PVector(360,55),20);
        y2.yildizCiz(new PVector(85,70),25);           y2.yildizKontrol(new PVector(85,70),25);
        basamakCiz(new PVector(620,20),20,height-200); bDeyiyor(new PVector(620,20),20,height-200);
        c1.cantCiz(new PVector(420,250),20);           c1.cantKontrol(new PVector(420,250),20);
        c1.cantCiz(new PVector(580,440),20);           c1.cantKontrol(new PVector(580,440),20);
        basamakCiz(new PVector(580,320),50,20);        bDeyiyor(new PVector(580,320),50,20);
        basamakCiz(new PVector(555,550),70,20);        bDeyiyor(new PVector(555,550),70,20);
        y3.yildizCiz(new PVector(470,250),15);         y3.yildizKontrol(new PVector(470,250),15);
        basamakCiz(new PVector(940,165),20,height-165);bDeyiyor(new PVector(940,165),20,height-165);
        basamakCiz(new PVector(785,805),60,20);bDeyiyor(new PVector(785,805),60,20);
        basamakCiz(new PVector(640,670),100,20);bDeyiyor(new PVector(640,670),100,20);
        c1.cantCiz(new PVector(800,580),20);           c1.cantKontrol(new PVector(800,580),20);
        y5.yildizCiz(new PVector(835,490),15);         y5.yildizKontrol(new PVector(835,490),15);
        basamakCiz(new PVector(850,510),100,20);bDeyiyor(new PVector(850,510),100,20);
        basamakCiz(new PVector(710,365),80,20);bDeyiyor(new PVector(710,365),80,20);
        basamakCiz(new PVector(1160,340),280,20);bDeyiyor(new PVector(1160,340),280,20);
        y6.yildizCiz(new PVector(1300,310),15);         y6.yildizKontrol(new PVector(1300,310),15);
        c1.cantCiz(new PVector(1190,310),20);           c1.cantKontrol(new PVector(1190,310),20);
        c1.cantCiz(new PVector(1300,175),40);           c1.cantKontrol(new PVector(1300,175),40);
        c1.cantCiz(new PVector(1410,310),20);           c1.cantKontrol(new PVector(1410,310),20);
        c1.cantCiz(new PVector(1400,880),20);           c1.cantKontrol(new PVector(1440,880),20);
        
        if(loc.x>1050 && kayma<1000){kayma+=2*vel.x;loc.x-=vel.x; }
        if(loc.x<350 && kayma>0){kayma+=2*vel.x;loc.x-=vel.x; }
        basamakCiz(new PVector(1550,650),110,20);       bDeyiyor(new PVector(1550,650),110,20);
        basamakCiz(new PVector(1690,100),20,250);       bDeyiyor(new PVector(1690,100),20,250);
        basamakCiz(new PVector(1690,350),250,20);       bDeyiyor(new PVector(1690,350),250,20);
        c1.cantCiz(new PVector(1800,100),20);           c1.cantKontrol(new PVector(1800,100),20);
        c1.cantCiz(new PVector(1900,100),20);           c1.cantKontrol(new PVector(1900,100),20);
        c1.cantCiz(new PVector(1900,200),20);           c1.cantKontrol(new PVector(1900,200),20);
        c1.cantCiz(new PVector(1900,300),20);           c1.cantKontrol(new PVector(1900,300),20);
        c1.cantCiz(new PVector(430,650),55);            c1.cantKontrol(new PVector(430,650),55);      
        y4.yildizCiz(new PVector(555,610),15);          y4.yildizKontrol(new PVector(555,610),15);
        can1.canCiz(new PVector(600,825));              can1.canKontrol(new PVector(600,825));
        can2.canCiz(new PVector (1400,800));            can2.canKontrol(new PVector(1400,800));
        y7.yildizCiz(new PVector(1800,300),45);         y7.yildizKontrol(new PVector(1800,300),45);
        basamakCiz(new PVector(2100,650),300,20);       bDeyiyor(new PVector(2100,650),300,20);
        teleport();
        fill(random(15,255));
        stroke(0);
        circle(1800-kayma,200,50);
        noFill();
        finish();
  

       textSize(25);
        String b="Collect all stars and go exit!";
        String a="LEVEL 3!";
        if(sayac1<3000){    
            fill(#052C9D);
            text(a,630,200);
            text(b,610,300);
            noFill();
            sayac1++;
        }
        if(loc.x>640 && loc.x<940){
          vel.y+=0.2;
        }
        if(yandi){
          kayma-=4;
          vel.x=0; vel.y=0;
          
          if(kayma<0){kayma=0;yandi=false;loc.x=70;loc.y=720;
          can--;}
        }
      }
      //level 3 sonu ------------------------
    if(done == 3){
        background(255);
        fill(0);
        textSize(25);
        String b= "Congratulations!!!";
        text(b,100,100);
    
    }
  
  
}
class daire{
  void daireCiz(PVector d,float r){
    //translate(d.x,d.y);
    fill(#08D7FA);
    circle(d.x,d.y,r);
    noFill();
  }
}

void keyPressed() {
  //int keyIndex = -1;
  if ((key == 'w' || key == 'W') && degdimi==1 && !yandi ) {
     vel.y+=-3.4;
     degdimi=0;
  }
  if ((key == 'a' || key == 'A') && !yandi) {
     vel.x=-3.0;
  }if ((key == 'd' || key == 'D') && !yandi) {
     vel.x=3.0;
  }if ((key == 's' || key == 'S') && !yandi) {
     vel.y=3.0;
  }
  
}
 
  void xs(){
    PVector konum = new PVector(700,80);
    fill(0);
    circle(konum.x,konum.y,30);
    noFill();
  }
