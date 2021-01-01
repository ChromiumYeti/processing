//Modified from the Bouncing Bubbles and mouse trail examples from Processing.org

int num = 50;
float mx[] = new float[num];
float my[] = new float[num];
int numBalls = 16;
float spring = 0.05;
//float gravity = 0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

void setup() {
  size(800, 600);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  }
  noStroke();
  mouseX = width/2;
  mouseY = height/2;
}
//int posX = width/2;
//int posY = height/2;
void draw() {
  background(51); 
  //Designate player controlled ball from ball pool
  balls[0] = new Ball(mouseX, mouseY, 50, 0, balls);
  //Fancy tail for PC ball
  int small = frameCount % num;
  mx[small] = mouseX;
  my[small] = mouseY;
  for (int i = 0; i <num; i++) {
    // small+1 is the smallest (the oldest in the array)
    int index = (small+1 + i) % num;
    fill(0, i*i, i*i);
    ellipse(mx[index], my[index], i, i);
  }
  //Collision check, movement and display for all balls
  for (Ball ball : balls) {
    fill(255, 204);
    ball.collide();
    ball.move();
    ball.display();
  }
}
//void keyPressed() {
//  if (key == CODED) {
//    if (keyCode == UP) {
//      posY=posY-10;
//    } else if (keyCode == DOWN) {
//      posY=posY+10;
//    } else if (keyCode == LEFT) {
//      posX=posX-10;
//    } else if (keyCode == RIGHT) {
//      posX=posX+10;
//    } 
//  } else {
//    fill(128);
//  }
//}
class Ball {
  float x, y;
  float diam;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diam = din;
    id = idin;
    others = oin;
  } 

  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diam/2 + diam/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
        fill(255, random(0,128), random(0,128));
      }
    }
  }

  void move() {
    //    vy += gravity;
    x += vx;
    y += vy;
    if (x + diam/2 > width) {
      x = width - diam/2;
      vx *= friction;
    } else if (x - diam/2 < 0) {
      x = diam/2;
      vx *= friction;
    }
    if (y + diam/2 > height) {
      y = height - diam/2;
      vy *= friction;
    } else if (y - diam/2 < 0) {
      y = diam/2;
      vy *= friction;
    }
  }

  void display() {
    ellipse(x, y, diam, diam);
  }
}
