function what(x) { //that func. copy for variable to different var.
  return JSON.parse(JSON.stringify(x));
}

var velx = 0;
var vely = 1;
var fvel = 5;
var squares = [];

var lenx = 0;
var leny = 0;


var snake;
var scoreElem;
var score = 0;

var keyLock = false;



var f = true;
class Yem {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }
  yenile() {
    let x = floor(random(1, leny - 1));
    let y = floor(random(1, lenx - 1));
    let flag = true;
    for (let i = 0; i < snake.slist.length; i++) {
      if (x != snake.slist[i].x &&
        y != snake.slist[i].y) {

        this.x = x;
        this.y = y;
        flag = false;
        break;
      }
    }
    if (flag) {
      noLoop();
      scoreElem.html('You win looser(That not change your looser). Score = ' + score);
    } else {
      if (score % 10 == 0) {
        fvel += 1;
        console.log("fvel arrtırıldı. fvel : " + fvel)
      }
    }

  }

  fill() {
    fill('red');
    square(squares[this.x][this.y].x, squares[this.x][this.y].y, squares[this.x][this.y].size, squares[this.x][this.y].oval);
  }
}
class Konum {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }
}

class SSquare {
  constructor(x, y, size, oval) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.oval = oval;
  }
}

class Snake {
  constructor(list) {
    this.slist = list;
  }
  ilerlet() {
    let temp = what(this.slist);
    this.slist[0].x += velx;
    this.slist[0].y += vely;
    for (let i = 1; i < this.slist.length; i++) {
      this.slist[i].x = temp[i - 1].x;
      this.slist[i].y = temp[i - 1].y;
    }
  }

  fillSnake() { // her snake kutusu kendini boyayacak şekilde değiştir.
    for (let a = 0; a < this.slist.length; a++) {
      let i = this.slist[a].x;
      let j = this.slist[a].y;
      if (a == 0) {
        fill(190);
      } else {
        fill(255)
      }
      square(squares[i][j].x, squares[i][j].y, squares[i][j].size, squares[i][j].oval);
    }
  }

  checkCollision() {
    if (this.slist[0].x >= leny ||
      this.slist[0].x < 0 ||
      this.slist[0].y >= lenx ||
      this.slist[0].y < 0) {

      this.stop();

    } else {
      for (let i = 1; i < this.slist.length; i++) {
        if (this.slist[0].x == this.slist[i].x &&
          this.slist[0].y == this.slist[i].y) {
          this.stop();
          break;
        }
      }
    }
    if (this.slist[0].x == yem.x &&
      this.slist[0].y == yem.y) {
      // add a new block on snake when eat yem.
      this.slist.unshift(new Konum(yem.x + velx, yem.y + vely));
      yem.yenile();
      score++;
      scoreElem.html('Score = ' + score);
    }




  }
  stop() {
    noLoop();
    scoreElem.html('You loose looser. Score = ' + score);
  }

}

function setup() {
  
  


  createCanvas(600, 400); // (800, 600)
  frameRate(fvel);
  let size = 20; // square size
  let space = 3; // space 2 squares

  // ekrandaki tum kareleri olustur
  for (let i = 0; i < height - space; i += size) {
    let temp = [];
    for (let j = 0; j < width - space; j += size) {
      temp.push(new SSquare(j + space, i + space, size - space, size / 4));
    }

    squares.push(temp);
  }
  lenx = squares[0].length;
  leny = squares.length;
  // snake listesini oluştur, konumları
  var slist = [];
  for (let i = 4; i >= 1; i--) {
    slist.push(new Konum(1, i));
  }
  snake = new Snake(slist);

  yem = new Yem(floor(lenx / 2), floor(leny / 2));
  
  if (f) {
    var button = createButton("reset sketch");
    button.mousePressed(resetSketch);
    scoreElem = createDiv('Score = ' + score);
  //scoreElem.html('Score = '+ score);
  scoreElem.position(20, 3);
  scoreElem.id = 'score';
  scoreElem.style('color', 'white');
  }
  f = false;
  scoreElem.html('Score = ' + score);
}



function draw() {
  background(100);
  frameRate(fvel);
  for (let i = 0; i < squares.length; i++) {
    for (let j = 0; j < squares[i].length; j++) {
      fill(0);
      square(squares[i][j].x, squares[i][j].y, squares[i][j].size, squares[i][j].oval);

    }
  }
  snake.fillSnake();
  snake.ilerlet();
  snake.checkCollision();

  yem.fill();

  keyLock = false;
}

function lockKey() {
  keyLock = true;
}

function keyPressed() {
  if (!keyLock) {
    switch (keyCode) {
      case 65: //a
        if (vely != 1) {
          vely = -1;
          velx = 0;
          lockKey();
        }
        break;
      case 68: //d
        if (vely != -1) {
          vely = 1;
          velx = 0;
          lockKey();
        }
        break;
      case 87: //w
        if (velx != 1) {
          vely = 0;
          velx = -1;
          lockKey();
        }
        break;
      case 83: //s
        if (velx != -1) {
          vely = 0;
          velx = 1;
          lockKey();
        }
        break;
    }

  }

}

function resetSketch() {
 velx = 0;
 vely = 1;
 fvel = 5;
 squares = [];

 lenx = 0;
 leny = 0;


 snake;
 scoreElem;
 score = 0;

 keyLock = false;
 setup();
  loop();
  draw();
  
}
