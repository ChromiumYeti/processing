noFill();
curve(5, 26, 5, 26, 73, 24, 73, 61);
curve(5, 26, 73, 24, 73, 61, 15, 65);
fill(255);
ellipseMode(CENTER);
int steps = 6;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = curvePoint(5, 5, 73, 73, t);
  float y = curvePoint(26, 26, 24, 61, t);
  ellipse(x, y, 5, 5);
  x = curvePoint(5, 73, 73, 15, t);
  y = curvePoint(26, 24, 61, 65, t);
  ellipse(x, y, 5, 5);
}
