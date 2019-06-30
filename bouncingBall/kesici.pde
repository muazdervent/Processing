class cant{
  PVector c1,c2,c3,c4,c5,c6;
  float aciD=5;
  float angle=0;
  cant(){}
  PVector p2=new PVector();
  
  void cantCiz(PVector p3, float r){
    //translate(p2.x,p2.y);
    p2.y=p3.y;
    p2.x=p3.x-kayma;
    c1=new PVector( r*cos(yon*radians(0+angle))+p2.x, r*sin(yon*radians(0+angle))+p2.y );
    c2=new PVector( r*cos(yon*radians(120+angle))+p2.x, r*sin(yon*radians(120+angle)) +p2.y);
    c3=new PVector( r*cos(yon*radians(240+angle))+p2.x, r*sin(yon*radians(240+angle)) +p2.y);
    fill(0);
    beginShape();
    vertex(c1.x,c1.y);vertex(c2.x,c2.y);vertex(c3.x,c3.y);
    endShape(CLOSE);
    
    c4=new PVector( r*cos(yon*radians(60+angle))+p2.x, r*sin(yon*radians(60+angle)) +p2.y);
    c5=new PVector( r*cos(yon*radians(180+angle))+p2.x, r*sin(yon*radians(180+angle))+p2.y );
    c6=new PVector( r*cos(yon*radians(300+angle))+p2.x, r*sin(yon*radians(300+angle)) +p2.y);
    fill(0);
    beginShape();
    vertex(c4.x,c4.y);vertex(c5.x,c5.y);vertex(c6.x,c6.y);
    endShape(CLOSE);
    angle+=1;
    if(angle>=360)angle=0;
  }
  void cantKontrol(PVector p2, float xrr){
    float xr=xrr/2;
    p2.x=p2.x-kayma;
    //if(loc.x+r/2 >p2.x-xr && loc.x-r/2<p2.x+xr && loc.y+r/2 >p2.y-xr && loc.y-r/2<p2.y+xr){
     if((loc.x-p2.x <25+xr  && p2.x-loc.x <25+xr && loc.y-p2.y <25+xr && p2.y-loc.y <25+xr)){
      if(can>0){ yandi=true;
        loc.x=0;loc.y=3300;
          
        }else{done=0;loc.x=330;loc.y=800;
              vel.x=0; vel.y=0;can=3;kayma=0;y1.cizil=true;y2.cizil=true;y3.cizil=true;y4.cizil=true;y5.cizil=true;y6.cizil=true;y7.cizil=true;topYildiz=0;}
    }
  
  }
}
