class flow {
  int cols;
  int rows;
  int scl;
  int strength;
  float sens;
  PVector[][] vels;
  float[][] angles;
  
  flow(int cols, int rows, int scl, int strength) {
    this.cols = cols;
    this.rows = rows;
    this.scl = scl;
    this.strength = strength;
    vels = new PVector[cols][rows];
    angles = new float[cols][rows];
    sens = .001;
    generate();
  }
  
void generate() {
    float yoff = 0;
    for (int i = 0; i < cols; i++) {
      float xoff = 0;
      for (int j = 0; j < rows; j++) {
        xoff+=sens;
        float a = map(noise(xoff,yoff),0,1,0,2*PI);
        vels[i][j] = PVector.fromAngle(a);
        angles[i][j] = a;
      }
      yoff+=sens;
    }
  }
  
  void showGrid() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        noFill();
        stroke(255, 255, 255, 50);
        push();
        strokeWeight(2);
        rect(i*scl,j*scl,scl,scl);
        pop();
      }
    }
  }
  
  public void showDirs() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        push();
        translate(i*scl ,j*scl );
        stroke(0,255,255);
        vels[i][j].setMag(5);
        fill(0,255,255);
        strokeWeight(1);
        rotate(angles[i][j]);
        line(2,scl/2,scl-2,scl/2);
        pop();
      }
    }
  }
}
