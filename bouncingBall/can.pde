class can{
  boolean cizil=true;
  
  void canCiz(PVector konum ){
    if(cizil){
      konum.x=konum.x-kayma;
    noFill();
    circle(konum.x,konum.y,50);
    }  
  }
  void canKontrol(PVector konum){
    konum.x-=kayma;
    if(loc.x-konum.x <50  && konum.x-loc.x <50 && loc.y-konum.y <50 && konum.y-loc.y <50 && cizil){
        cizil=false;
        can++;
    }
  
  }

}
