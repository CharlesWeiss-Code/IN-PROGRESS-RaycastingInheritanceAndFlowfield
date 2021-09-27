class boundary {
  PVector pos;
  int r;
  PVector a, b, c, d;
  
  boundary(float posx, float posy, int r) {
    pos = new PVector(posx,posy);
    this.r = r;
    a = new PVector(pos.x-r,pos.y-r);
    b = new PVector(pos.x+r,pos.y-r);
    c = new PVector(pos.x+r,pos.y+r);
    d = new PVector(pos.x-r,pos.y+r);
  }
  
  public void show() {
    dLine(a,b);
    dLine(b,c);
    dLine(c,d);
    dLine(d,a);
  }
  
  public void dLine(PVector a, PVector b) {
    line(a.x,a.y,b.x,b.y);
  }
}
