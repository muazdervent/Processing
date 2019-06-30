 class yildiz{
  PVector c1,c2,c3,c4,c5,c6;
  float aciD=5;
  float angle=0;
  boolean cizil=true;
  yildiz(){}
  
  void yildizCiz(PVector p2, float r){
    p2.x=p2.x-kayma;
    if(cizil){
    //translate(p2.x,p2.y);
    c1=new PVector( r*cos(yon*radians(0+angle))+p2.x, r*sin(yon*radians(0+angle))+p2.y );
    c2=new PVector( r*cos(yon*radians(120+angle))+p2.x, r*sin(yon*radians(120+angle)) +p2.y);
    c3=new PVector( r*cos(yon*radians(240+angle))+p2.x, r*sin(yon*radians(240+angle)) +p2.y);
    stroke(#CF40E3);
    fill(#CF40E3);
    beginShape();
    vertex(c1.x,c1.y);vertex(c2.x,c2.y);vertex(c3.x,c3.y);
    endShape(CLOSE);
    
    c4=new PVector( r*cos(yon*radians(60+angle))+p2.x, r*sin(yon*radians(60+angle)) +p2.y);
    c5=new PVector( r*cos(yon*radians(180+angle))+p2.x, r*sin(yon*radians(180+angle))+p2.y );
    c6=new PVector( r*cos(yon*radians(300+angle))+p2.x, r*sin(yon*radians(300+angle)) +p2.y);
    
    
    beginShape();
    vertex(c4.x,c4.y);vertex(c5.x,c5.y);vertex(c6.x,c6.y);
    endShape(CLOSE);
    stroke(0);
    
    }
  }
  void yildizKontrol(PVector p2, float xrr){
    p2.x=p2.x-kayma;
    float xr=xrr/2;/*
    if(loc.x+r/2 >p2.x-xr && loc.x-r/2<p2.x+xr && loc.y+r/2 >p2.y-xr && loc.y-r/2<p2.y+xr && cizil){
       topYildiz++;
       cizil=false;
        
    }*/
    if(loc.x-p2.x <25+xr  && p2.x-loc.x <25+xr && loc.y-p2.y <25+xr && p2.y-loc.y <25+xr && cizil){
        topYildiz++;
       cizil=false;
    }
  
  }
}
