float x1=50, y1=50, x2=100, y2=50, x3=200, y3=50, x4=250, y4=250, x5=200, y5=250, x6=100, y6=250;
  float t = 0.0;
float rS =10;
  float x, y, xTangent, yTangent, angle;


void setup() {
  size(600, 600) ;
}
void drawArrow() {
  stroke(0) ;
 
  fill(255);
  strokeWeight(1);
  scale(0.5);
  line(-50, 0, 0, 0 ) ;
  beginShape();
  vertex(-30, 0);
  vertex(-40, -10);
  vertex(0, 0);
  vertex(-40, 10);
  endShape(CLOSE);
}
void draw() {
  background(255);

  //curve path construct
  stroke(128);
  strokeWeight(10);
  noFill();
  beginShape();
  curveVertex(x1, y1);//Control pt
  curveVertex(x2, y2);//P1
  curveVertex(x3, y3);//P2
  curveVertex(x4, y4);//P3
  curveVertex(x5, y5);//P4
  curveVertex(x6, y6);//P5
  curveVertex(x1, y1);//P0
  curveVertex(x2, y2);//P1
  curveVertex(x3, y3);//Control pt
  endShape(CLOSE);

  //vertex connecting paths in red
  strokeWeight(1);
  stroke(255, 0, 0);
  beginShape();
  vertex(x1, y1);
  vertex(x2, y2);
  vertex(x3, y3);
  vertex(x4, y4);
  vertex(x5, y5);
  vertex(x6, y6);
  endShape(CLOSE);

  //control point rects for mouseDragged function
  rectMode(CENTER);
  rect(x1, y1, rS, rS);
  rect(x2, y2, rS, rS);
  rect(x3, y3, rS, rS);
  rect(x4, y4, rS, rS);
  rect(x5, y5, rS, rS);
  rect(x6, y6, rS, rS);
  fill(255, 0, 0);
  text("P0", x1+rS, y1-rS);
  text("P1", x2+rS, y2-rS);
  text("P2", x3+rS, y3-rS);
  text("P3", x4+rS, y4-rS);
  text("P4", x5+rS, y5-rS);
  text("P5", x6+rS, y6-rS);


 



       t += 0.01 ;
  if (t>=1.0) {
    t=0.0;
  }
  //movement from P0-P1
  x = curvePoint(x6, x1, x2, x3, t);
  y = curvePoint(y6, y1, y2, y3, t);
  pushMatrix();
  translate(x, y) ;
  xTangent = curveTangent(x6, x1, x2, x3, t);
  yTangent = curveTangent(y6, y1, y2, y3, t);
  angle = atan2( yTangent, xTangent ) ;
  rotate(angle);
    drawArrow();
  popMatrix();

  //movement from P1-P2
  x = curvePoint(x1, x2, x3, x4, t);
  y = curvePoint(y1, y2, y3, y4, t);
  pushMatrix();
  translate(x, y);
  xTangent = curveTangent(x1, x2, x3, x4, t);
  yTangent = curveTangent(y1, y2, y3, y4, t);
  angle = atan2( yTangent, xTangent ) ;
  rotate(angle);
    drawArrow();
  popMatrix();

  //movement from P2-P3
  x = curvePoint(x2, x3, x4, x5, t);
  y = curvePoint(y2, y3, y4, y5, t);
  pushMatrix();
  translate(x, y) ;
  xTangent = curveTangent(x2, x3, x4, x5, t);
  yTangent = curveTangent(y2, y3, y4, y5, t);
  angle = atan2( yTangent, xTangent ) ;
  rotate(angle);
    drawArrow();
  popMatrix();

  //movement from P3-P4
  x = curvePoint(x3, x4, x5, x6, t);
  y = curvePoint(y3, y4, y5, y6, t);
  pushMatrix();
  translate(x, y) ;
  xTangent = curveTangent(x3, x4, x5, x6, t);
  yTangent = curveTangent(y3, y4, y5, y6, t);
  angle = atan2( yTangent, xTangent ) ;
  rotate(angle);
     drawArrow();
  popMatrix();

  //movement from P4-P5
  x = curvePoint(x4, x5, x6, x1, t);
  y = curvePoint(y4, y5, y6, y1, t);
  pushMatrix();
  translate(x, y) ;
  xTangent = curveTangent(x4, x5, x6, x1, t);
  yTangent = curveTangent(y4, y5, y6, y1, t);
  angle = atan2( yTangent, xTangent ) ;
  rotate(angle);
    drawArrow();
  popMatrix();

  //movement from P5-P0
  x = curvePoint(x5, x6, x1, x2, t);
  y = curvePoint(y5, y6, y1, y2, t);
  pushMatrix();
  translate(x, y) ;
  xTangent = curveTangent(x5, x6, x1, x2, t);
  yTangent = curveTangent(y5, y6, y1, y2, t);
  angle = atan2( yTangent, xTangent ) ;
  rotate(angle);
    drawArrow();
  popMatrix();
  fill(0);

//green laser pointer in middle of window
  float angle2 = atan2(mouseY-300, mouseX-300);
  stroke(0);
  fill(255,0,0);
  ellipseMode(CENTER);
  rectMode(CENTER);
      pushMatrix();
  translate(300,300);
  rotate(angle2);
  ellipse(0,0,30,30);
  rect(15,0,40,5);
  stroke(0,255,0);
line(500,0,40,0);
  popMatrix();
   // line(mouseX,mouseY, 300, 300);
  
   //intersection code for laser pointer
  //float a = -(y4-y3);
  //float b = x4-x3;
  //float c = (x3*y4)-(y3*x4);
  //float s =  -(a*x1 + b*y1 + c) / (a*(x2-x1)+b*(y2-y1));
  //float xi = (1-s)*x1 + s*x2;
  //float yi = (1-s)*y1 + s*y2;
  //fill(0, 128, 0);
  //if (xi > x1 && xi <x2 && yi > y1 && yi <y2) { 
  //  //if (xi > x3 && xi <x4 && yi > y3 && yi <y4) {
  //  ellipse( xi, yi, 10, 10 );
  //}
  
  
}

void mouseDragged() {
  if (mouseX<x1+rS/2 && mouseX>x1-rS/2 && mouseY<y1+rS/2 && mouseY>y1-rS/2) {
    x1 = mouseX ;
    y1 = mouseY ;
  }
 else if (mouseX<x2+rS/2 && mouseX>x2-rS/2 && mouseY<y2+rS/2 && mouseY>y2-rS/2) {
    x2 = mouseX ;
    y2 = mouseY ;
  }
  else if (mouseX<x3+rS/2 && mouseX>x3-rS/2 && mouseY<y3+rS/2 && mouseY>y3-rS/2) {
    x3 = mouseX ;
    y3 = mouseY ;
  }
  else if (mouseX<x4+rS/2 && mouseX>x4-rS/2 && mouseY<y4+rS/2 && mouseY>y4-rS/2) {
    x4 = mouseX ;
    y4 = mouseY ;
  }
  else if (mouseX<x5+rS/2 && mouseX>x5-rS/2 && mouseY<y5+rS/2 && mouseY>y5-rS/2) {
    x5 = mouseX ;
    y5 = mouseY ;
  }
  else if (mouseX<x6+rS/2 && mouseX>x6-rS/2 && mouseY<y6+rS/2 && mouseY>y6-rS/2) {
    x6 = mouseX ;
    y6 = mouseY ;
  }
}
