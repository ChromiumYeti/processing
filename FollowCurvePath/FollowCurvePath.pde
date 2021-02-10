// http://forum.processing.org/topic/help-making-a-circle-follow-a-curve-path
// (with help from http://forum.processing.org/topic/newbie-mouse-click-to-change-curve-coordinates )
int i;
boolean goRight = true;
color colRed = color (244, 1, 1 );
//
int bottomY=height+310;
int subst=233;
int subst2=1933;
//
int steps = 226;
//
void setup()
{
  size (400, 500);
  
}
//
void draw ()
{ 
  background(211);
  //
   stroke(0);
  strokeWeight(10);
  noFill();
  beginShape();
  curveVertex(200, bottomY+subst2);
  curveVertex(70, 200+subst);
  curveVertex(width-70, 200+subst);
  curveVertex(width-200, bottomY+subst2);
  endShape(CLOSE);
  fill( colRed );
  stroke( colRed );
  ellipseMode(CENTER);
  float t = i / float(steps);
  float x = curvePoint(200, 70, width-70, width-200, t);
  float y = curvePoint(bottomY+subst2, 200+subst, 200+subst, bottomY+subst2, t);
  ellipse(x, y, 5, 5);
  //
  if (goRight)
    i++;
  else
    i--;
  //
  if (i>steps)
  {
    goRight=false;
  }
  if (i<0)
  {
    goRight=true;
  }
}
