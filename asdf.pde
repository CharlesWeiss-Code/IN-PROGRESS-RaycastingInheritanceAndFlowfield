int cols, rows;
int scl = 20;
int nodesCount = 20;
int boundCount = 10;
ArrayList<node> nodes = new ArrayList<node>();
ArrayList<boundary> boundaries = new ArrayList<boundary>();
int sensetivitySize = 100;

flow flow;

void setup() {
  fullScreen();
  cols = width/scl;
  rows = height/scl;
  generateNodes();
  generateBoundaries();
  flow = new flow(cols, rows, scl, 3);
}

void draw() {
  background(51);
  nodeStuff();
  flowStuff();
  boundStuff();
}

public void generateNodes() {
  for (int i = 0; i < nodesCount*3; i++) {
    PVector loc = new PVector(random(width), random(height));
    if (i % 3 == 0) {
      nodes.add(new node(loc));
    } else if (i % 3 == 1) {
      nodes.add(new node1(loc));
    } else if (i % 3 == 2) {
      nodes.add(new node2(loc));
    }
  }
}

public void nodeStuff() {
  for (node n : nodes) {
    n.show();
    n.update();
  }
}

public void flowStuff() {
flow.showDirs();
}

public void generateBoundaries() {
  for (int i = 0; i < boundCount; i++) {
    boundaries.add(new boundary(random(width), random(height), 30));
  }
}

public void boundStuff() {
  for (boundary b : boundaries) {
    b.show();
  }
}

void mousePressed() {
  PVector m = new PVector(mouseX,mouseY);
  nodes.add(new node(m));
}
