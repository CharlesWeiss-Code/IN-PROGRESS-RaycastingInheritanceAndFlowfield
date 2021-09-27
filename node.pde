class node {
  PVector pos;
  PVector vel;
  int r = 10;
  ArrayList<boundary> close = new ArrayList<boundary>();
  int sensetivitySize = 100;

  public node(PVector pos) {
    this.pos = pos;
  }

  public void show() {
    push();
    noFill();
    strokeWeight(4);
    stroke(255);
    ellipse(pos.x, pos.y, r*2, r*2);
    pop();
  }

  public void update() {
    if (pos.y > height - scl) {
      pos.y = scl;
    } else if (pos.y < scl) {
      pos.y = height - scl;
    }
    if (pos.x > width- scl) {
      pos.x = scl;
    } else if (pos.x < scl) {
      pos.x = width-scl;
    }
    vel = flow.vels[int(pos.x/scl)][int(pos.y/scl)];
    if (isCloseToBound(this)) {
      if (close.size() > 0) {
        applyVel(close, this);
      }
    } else {
      pos.add(flow.vels[int(pos.x/scl)][int(pos.y/scl)]);
    }
  }

  public boolean isCloseToBound(node n) {
    boolean yes = false;
    for (boundary b : boundaries) {
      if (PVector.dist(n.pos, b.pos) < sensetivitySize) {
        line(n.pos.x, n.pos.y, b.pos.x, b.pos.y);
        close.add(b);
        yes = true;
      }
    }
    return yes;
  }
}

public void applyVel(ArrayList<boundary> closeBounds, node n) {
  float record = 999999999;
  boundary closest = null;

  for (int i = 0; i < closeBounds.size(); i++) {
    boundary current = closeBounds.get(i);

    if (PVector.dist(n.pos, closeBounds.get(i).pos) < record) {
      closest = current;
      record = PVector.dist(n.pos, closeBounds.get(i).pos);
    }
  }
  // avoid is in slope form instead of an angle.
  float avoid = -1/(closest.pos.y/n.pos.y)/(closest.pos.x/n.pos.x); // use angles instead of slope
  float currentVel = flow.angles[int(n.pos.x/scl)][int(n.pos.y/scl)]; 

  float distToClosest = PVector.dist(n.pos, closest.pos);
  float lerpAmmount = map(distToClosest, 0, sensetivitySize, 0, 1);
  float a = lerp(avoid, currentVel, lerpAmmount); 
  float mapMouse = map(mouseX, 0, width, 0, 10);
  PVector force = PVector.fromAngle(a).setMag(mapMouse);
  n.vel.add(force);
  n.vel.setMag(3);
  n.pos.add(n.vel);
}
