ArrayList Rooms;
public int[][] floorGrid;
public Cell[][] cellGrid;
int startX, startY;
int gridSize;
int margin;
ArrayList<PVector> doors;
int numRooms;
color[] cols;

int xNext, yNext;
int x1, y1;
int currentID;

int xmax, xmin, ymax, ymin;

void setup() {

  size(600, 600);
  stroke(255);
  rectMode(CENTER);

  numRooms = 8000;
  gridSize = 20;
  startX = 10;
  startY = 10;
  margin = 2*gridSize;
  currentID = 1;
  doors = new ArrayList<PVector>();
  cols = new color[numRooms + 10];
  cols[0] = color(255);
  for (int i = 1; i< numRooms; i++) {
    cols[i] = color(int(random(20, 230)), int(random(20, 230)), int(random(20, 230)));
  }

  xmin = 3;
  xmax = 10;
  ymin = 2;
  ymax = 7;

  xNext = 1;
  yNext = 1;

  floorGrid = new int[(width-margin)/gridSize][(height-margin)/gridSize];
  cellGrid = new Cell[floorGrid.length][floorGrid[1].length];
  println(cellGrid.length + ", " + cellGrid[0].length);
  cellGrid[0][0] = new Cell(0, 0, -1); 

  // int div = int((cellGrid[0].length)/3);

  for (int i = 0; i< cellGrid.length; i++) {
    for (int j = 0; j< cellGrid[0].length; j++) {
      // if (i == 0 || j == 0 || i == cellGrid.length-1 || j == cellGrid[0].length-1 || (j)%div == 0) {
      if (i == 0 || j == 0 || i == cellGrid.length-1 || j == cellGrid[0].length-1) {
        cellGrid[i][j] = new Cell(i, j, -1);
      } else {
        cellGrid[i][j] = new Cell(i, j, 0);
      }
    }
  }


  cellGrid[xNext][yNext].changeID(-2);
  xNext = xNext+int(random(2, 6));

  int xstep = int(random(xmin, xmax));
  int ystep = int(random(ymin, ymax));
  println("steps: " + xstep + ", " + ystep);

  x1 = 1;
  y1 = 1;
  boolean markx = true;
  boolean marky = true;
  int tt = 0;
  while (marky) {
    markx = true;
    while (markx) {
      xstep = int(random(3, 7));
      ystep = int(random(2, 5));
      for (int xx = x1; xx< x1+xstep; xx++) {
        for (int yy = y1; yy< y1+ystep; yy++) {
          if (xx >0 && xx< cellGrid.length && yy > 0 && yy<cellGrid[0].length) {
            if (cellGrid[xx][yy].ID == 0) {
              cellGrid[xx][yy].changeID(currentID);
            }
          } else {
            markx = false;
          }
        }
      }

      for (int i = 1; i< cellGrid.length-1; i++) {
        for (int j = 1; j< cellGrid[0].length-1; j++) {
          if (cellGrid[i][j].ID == currentID) {
            if (cellGrid[i-1][j].ID == 0) cellGrid[i-1][j].changeID(-1);
            if (cellGrid[i+1][j].ID == 0) cellGrid[i+1][j].changeID(-1);
            if (cellGrid[i-1][j+1].ID == 0) cellGrid[i-1][j+1].changeID(-1);
            if (cellGrid[i-1][j-1].ID == 0) cellGrid[i-1][j-1].changeID(-1);
            if (cellGrid[i+1][j+1].ID == 0) cellGrid[i+1][j+1].changeID(-1);
            if (cellGrid[i+1][j-1].ID == 0) cellGrid[i+1][j-1].changeID(-1);
            if (cellGrid[i][j+1].ID == 0) cellGrid[i][j+1].changeID(-1);
            if (cellGrid[i][j-1].ID == 0) cellGrid[i][j-1].changeID(-1);
          }
        }
      }
      currentID++;
      //  cellGrid[x1][y1].changeID(-3);
      x1 += xstep +int(random(1, 3));
      // y1 += int(random(-2,2));
    }

    x1 = int(random(1, 5));
    y1 += int(random(ystep, ystep + 3));

    if ( y1 > cellGrid[0].length) marky = false;

    tt++;
  }

  for (int i = 1; i< cellGrid.length-1; i++) {
    for (int j = 1; j< cellGrid[0].length-1; j++) {
      if (cellGrid[i][j].ID == 0) cellGrid[i][j].changeID(-1);
    }
  }

  println("SZ" + doors.size());
}



void draw() {
  background(0);

  for (int i = gridSize; i<= width-gridSize; i+= gridSize) {
    for (int j = gridSize; j <= height-gridSize; j+= gridSize) {
      line(i, gridSize, i, height-gridSize);
      line(gridSize, j, width-gridSize, j);
    }
  }

  for (int i = 0; i< cellGrid.length; i++) {
    for (int j = 0; j< cellGrid[0].length; j++) {
      cellGrid[i][j].display();
    }
  }
}


class Room {
  int xloc, yloc, xSize, ySize;
  public Room(int xloc, int yloc, int xSize, int ySize) {
    this.xloc = xloc;
    this.yloc = yloc;
    this.xSize = xSize;
    this.ySize = ySize;
  }
}

class Cell {
  float xpos, ypos;
  int x, y;
  int ID;
  color f;
  boolean isDoor;
  public Cell(int x, int y, int ID) {
    this.x = x;
    this.y = y;
    this.ID = ID;
    colorChange(ID);
    isDoor = false;

    xpos = 1.5* gridSize + x*gridSize;
    ypos = 1.5* gridSize + y*gridSize;
  }

  void colorChange(int IDin) {
    color retCol = 255;
    if (IDin == -1) {
      f = color(155, 155, 155);
    } else if (IDin == -3) {
      f = color(#6F1B5D);
    } else if (IDin == -2) {
      f = color(255, 0, 0);
    } else {
      f = cols[IDin];
    }
  }



  void display() {
    if (ID != 0 && ID != -1) {
      fill(f);
      stroke(f);
      rect(xpos, ypos, gridSize, gridSize);

      if (isDoor) {
        stroke(255);
        fill(0);
        // text("D", xpos, ypos);
      } else {
        fill(0);
        //   text(ID, xpos, ypos);
      }
    } else {
      fill(f);
      stroke(0);
      rect(xpos, ypos, gridSize, gridSize);
    }
  }

  void changeID(int newID) {
    this.ID = newID;
    colorChange(newID);
  }
}
