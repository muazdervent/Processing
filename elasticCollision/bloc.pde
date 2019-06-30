class block{
  
  PVector konum;
  PVector hiz;
  float agirlik;
  float kenarU;
  block(PVector kon,PVector hi,float wei){
    konum=kon;hiz=hi;agirlik=wei;
    konum.y=500-(100);
    kenarU=(100);
  }
  void ciz(){
    fill(0);
    rect(konum.x,konum.y,100,100);
   
  }
  void ilerlet(){
    konum.add(hiz);
  }

}
