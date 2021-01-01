void setup() {
   size(800, 600);
   background(128);
   stroke(0);
   fill(255);

   for (int i=1; i<100; i++){
      for (int j=1; j<100; j++){
         float startX = i * random(0, 200);
         float startY = j * random(0, 200);
         triangle(startX, startY, startX + random(10,50), startY + random(10,60), startX + random(10,70), startY + random(10,80));
      }
   }
}
