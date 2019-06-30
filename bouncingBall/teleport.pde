void teleport (){
  float konum=2300-kayma;
        strokeWeight(10);
        stroke(random(25,255));
        circle(konum,750,70);
        strokeWeight(1);
        
        if(loc.x-konum <40  && konum-loc.x <40 && loc.y-750 <40 && 750-loc.y <40){
          loc.x=1800-kayma;
          loc.y=200;
        
    }
}
