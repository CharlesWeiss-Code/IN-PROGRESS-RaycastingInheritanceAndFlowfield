class node2 extends node {
  PVector pos;
  node2(PVector pos) {
    super(pos);
    this.pos = pos;
  }
  
  @Override public void show() {
    noFill();
    stroke(255,0,0);
    ellipse(pos.x,pos.y,r*2,r*2);
  }
}
