ArrayList<block> blocks = new ArrayList<block>();
int collision=0;
float vi;
float vii;
float block0hiz=0;
float block0kutle=5;

float block1hiz=0;
float block1kutle=5;


boolean durum=false;
void setup(){
  frameRate(60);
  size(1300,800);
  background(255);
  blocks.add(new block(new PVector(450,450),new PVector(block0hiz,0),block0kutle));//sağdaki
  blocks.add(new block(new PVector(230,450),new PVector  (block1hiz,0)    ,block1kutle));//soldaki
  

}

void draw(){
  background(255);
  fill(0);
  rect(100,100,20,400);
  rect(100,500,1000,20);
  
  blocks.get(0).ciz();
  blocks.get(1).ciz();
  
  if(durum){
    
    blocks.get(0).ilerlet();
    blocks.get(1).ilerlet();
  if(blocks.get(1).konum.x+blocks.get(1).hiz.x <=120){blocks.get(1).konum.x=121;collision++;blocks.get(1).hiz.x*=-1;} 
  
    float x=blocks.get(1).konum.x;
    if(x<=120){blocks.get(1).hiz.x*=-1;collision++;blocks.get(1).konum.x=120;}
  
  
  // x=blocks.get(1).konum.x;
  float u=blocks.get(1).kenarU;
  if(x+u>=blocks.get(0).konum.x){
     vi=(blocks.get(1).agirlik-blocks.get(0).agirlik)/(blocks.get(1).agirlik+blocks.get(0).agirlik)*blocks.get(1).hiz.x+
    2*blocks.get(0).agirlik/(blocks.get(1).agirlik+blocks.get(0).agirlik)*blocks.get(0).hiz.x;
     vii=blocks.get(1).hiz.x+vi-blocks.get(0).hiz.x;
    //if(blocks.get(1).hiz.x+vi<120){blocks.get(1).konum.x=120;vi=-1;}
    
    blocks.get(1).hiz.x=vi;
    blocks.get(0).hiz.x=vii;
    collision++;
    blocks.get(1).konum.x=blocks.get(0).konum.x-100;
    blocks.get(0).konum.x=blocks.get(1).konum.x+100;
    //println(x+" + "+blocks.get(0).konum.x);
    println(blocks.get(1).hiz.x);
    //delay(5000);
  }
  
  }
  fill(0);
    textSize(20);
    text("Va="+blocks.get(1).hiz.x,blocks.get(1).konum.x,blocks.get(1).konum.y-35);
    text("Ma="+blocks.get(1).agirlik,blocks.get(1).konum.x,blocks.get(1).konum.y-15);
    text("Vb="+blocks.get(0).hiz.x,blocks.get(0).konum.x,blocks.get(0).konum.y-35);
    text("Mb="+blocks.get(0).agirlik,blocks.get(0).konum.x,blocks.get(0).konum.y-15);
  println(collision+" + "+frameRate);
  //kütle  -----v
  rect(1000,200,50,50);
  rect(1070,200,50,50);
  triangle(1000,190,1025,140,1050,190);//sol üst
  triangle(1000,260,1025,310,1050,260);//sol alt
  triangle(1070,190,1095,140,1120,190);//sağ üst
  triangle(1070,260,1095,310,1120,260);//sağ alt
  //hız ----v
  rect(1000,600,50,50);
  rect(1070,600,50,50);
  triangle(1000,590,1025,540,1050,590);//sol üst
  triangle(1000,660,1025,710,1050,660);//sol alt
  triangle(1070,590,1095,540,1120,590);//sağ üst
  triangle(1070,660,1095,710,1120,660);//sağ alt
  
  
  rect(600,200,100,50);
  rect(480,200,100,50);
  fill(255);
  text("Start/Stop",600,230);
  text("Restart",495,230);
  text("Ma",1010,225);
  text("Mb",1080,225);
  text("Va",1010,625);
  text("Vb",1080,625);
  
  fill(0);
  textSize(25);
  text("Elastic Collision",250,100);
  
}

void mousePressed(){
  if(mouseX>600 && mouseX<700 && mouseY>200 && mouseY<250){durum = !durum;}
  if(mouseX>480 && mouseX<580 && mouseY>200 && mouseY<250){durum = false; blocks.get(0).konum=new PVector(450,400); blocks.get(1).konum=new PVector(230,400);}
  
  if(mouseX>1000 && mouseX<1050 && mouseY >140 && mouseY<190){blocks.get(1).agirlik+=5;}
  if(mouseX>1000 && mouseX<1050 && mouseY >260 && mouseY<310){if(blocks.get(1).agirlik-5>0)blocks.get(1).agirlik-=5;}
  
  if(mouseX>1070 && mouseX<1120 && mouseY >140 && mouseY<190){blocks.get(0).agirlik+=5;}
  if(mouseX>1070 && mouseX<1120 && mouseY >260 && mouseY<310){if(blocks.get(0).agirlik-5>0)blocks.get(0).agirlik-=5;}
  
  
  if(mouseX>1000 && mouseX<1050 && mouseY >540 && mouseY<590){blocks.get(1).hiz.x+=1;}
  if(mouseX>1000 && mouseX<1050 && mouseY >660 && mouseY<710){blocks.get(1).hiz.x-=1;}
  
  if(mouseX>1070 && mouseX<1120 && mouseY >540 && mouseY<590){blocks.get(0).hiz.x+=1;}
  if(mouseX>1070 && mouseX<1120 && mouseY >660 && mouseY<710){blocks.get(0).hiz.x-=1;}

}
