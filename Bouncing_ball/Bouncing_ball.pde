float x, y, vx, vy, ax, ay, mx, my;
float r=25;
float mr=20;

void setup() {
  size(500, 500);
  x=100; 
  y=100;
  vx=3; 
  vy=1;
  ax=0; 
  ay=0.1;
}

void draw() {

  background(255);
  fill(255, 0, 0);
  stroke(128, 0, 0);
  ellipse(x, y, r*2, r*2);
  fill(0, 255, 0);

  ellipse(mx, my, mr, mr);

  vx+=ax;
  vy+=ay;
  x+=vx;
  y+=vy;

  if (x >width-r && vx>0) {
    vx = -vx;
  }
    if (x <0+r && vx<0) {
    vx = -vx;
  }
  float bottom = height-r;
  if (y >bottom && vy>0) {
    vy = -vy;
    y=y-2*(y-bottom);
  }
    if (y <0+r && vy<0) {
    vy = -vy;

  }
  if (sqrt( pow( mx -x,2) + pow(my - y, 2))< mr+r) {vx = -vx;vy= -vy;
  line(mx,my,x,y);}
}
void mouseDragged(){
    mx = mouseX;
  my = mouseY;
}
