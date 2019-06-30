void bDeyiyor(PVector b1,float a,float b){
  /// basamağa deymesi
  b1.x=b1.x-kayma;
  if(loc.x + r/2 >= b1.x && loc.x - r/4 < b1.x + a && loc.y+r/2 >= b1.y-8 && loc.y+r/2 < b1.y+3*b/4 ){//basamağa değmesi
    loc.y=b1.y-r/2-10;
    vel.y*=-0.85;
    degdimi=1;
    
  }//basamağa alttan değmesi
  if(loc.x + r/2 >= b1.x && loc.x - r/4 < b1.x + a && loc.y-r/2 <= b1.y+b+8 && loc.y-r/2 > b1.y+b){//basamağa alttan  değmesi
    loc.y=b1.y+r/2+12+b;
    vel.y*=-1;
  }
    if(loc.y + r/2 >=b1.y  && loc.y - r/2+3 < b1.y+b && loc.x+r/2 >b1.x-8 && loc.x +r/2 <= b1.x){//çubuğun sol yüzüne değmesi
      if(vel.x>0){vel.x=0;loc.x=b1.x-r/2-5;}//vel.x*=-1;
    println("çubuğa sol yüzünden değme");
    }// && loc.x+r/2 <b1.x +2 
  
  if(loc.y + r/2 >=b1.y  && loc.y - r/2+3 <= b1.y+b && loc.x-r/2 <=b1.x + a+7 && loc.x-r/2 >b1.x+2 ){//çubuğun sağ yüzüne değmesi
    if(vel.x<0){vel.x=0;loc.x=b1.x+a+r/2+5;}//vel.x*=-1;
    println("çubuğa sağ yüzünden değme");
  } 
}

  void basamakCiz(PVector b,float x,float y){
    b.x=b.x-kayma;  
    fill(0);
      rect(b.x,b.y,x,y);
      noFill();
  }
