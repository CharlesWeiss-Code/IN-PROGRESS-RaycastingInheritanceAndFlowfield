class node1 extends node {
  PVector pos; 
  int r = 10;
  
  node1(PVector pos) {
    super(pos);
    this.pos = pos;
  }
  
 @Override
 public void show() {
   noFill();
   stroke(0,0,255);
   ellipse(pos.x,pos.y,r*2,r*2);
  }
}
