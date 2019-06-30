void finish (){
  float konum=2300-kayma;
        
        fill(0);
        circle(konum,250,70);
        
        if(loc.x-konum <40  && konum-loc.x <40 && loc.y-250 <40 && 250-loc.y <40 && topYildiz==7){
          done++;
        
        }
        
        if(loc.x-konum <40  && konum-loc.x <40 && loc.y-250 <40 && 250-loc.y <40 && topYildiz!=7){
        String a="Tum Yildizlari topla!!!!!";
        textSize(25);
        if(sayac1<1500){    
            fill(#052C9D);
            text(a,konum-300,400);
            noFill();
            sayac1++;
        }
        }
}
