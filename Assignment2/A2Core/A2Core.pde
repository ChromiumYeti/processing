float x, y, vx, vy, ax, ay, bounce;
float r=20;
float rectW = 80;
float rectH = 20;


void setup() {
  frameRate(15);
  size(500, 500);
  x=50; 
  y=50;
  vx=3; 
  vy=3;
  ax=0; 
  ay=0;
  bounce=0;
}

void draw() {
  background(200);
  frameRate(60);
  fill(0);
  //debug output
  text("x:"+x, 20, 20);
  text("y:"+y, 20, 40);
  text("vx:"+vx, 20, 60);
  text("vy:"+vy, 20, 80);

  fill(255, 0, 0);
  stroke(128, 0, 0);
  //ellipseMode(CENTER);
  rectMode(CENTER);
  ellipse(x, y, r*2, r*2);

  vx+=ax;
  vy+=ay;
  x+=vx;
  y+=vy;

  if ((x >width-r && vx>0) || (x <0+r && vx<0)) { //if ball hits sides
    vx = -vx;
  }
  float bottom = height-r;
  if ((y >bottom && vy>0) || (y <0+r && vy<0)) { //if ball hits roof and floor
    vy = -vy;
        y=y-2*(y-bottom);
  }
  if (x >mouseX-rectW/2-r && x <mouseX+rectW/2+r && y >mouseY-rectH-r && y <mouseY+rectH+r && vx !=0 && vy !=0) {
    /*vx = -vx;*/
    vy = -vy-bounce; //if ball hits bat
  }
  line(mouseX-rectW/2, 0, mouseX-rectW/2, width);
  line(mouseX+rectW/2, 0, mouseX+rectW/2, width);
  line(0, mouseY-rectH/2, height, mouseY-rectH/2);
  line(0, mouseY+rectH/2, height, mouseY+rectH/2);
  line(x+r-vx, 0, x+r-vx, width);
  line(x-r-vx, 0, x-r-vx, width);
  line(0, y+r-vy, height, y+r-vy);
  line(0, y-r-vy, height, y-r-vy);

  //if (sqrt( pow( mouseX -x,2) + pow(mouseY - y, 2)< rectH-r) ){vx = -vx;vy= -vy;}

  fill(0, 255, 0);

  rect(mouseX, mouseY, rectW, rectH);
}
