import frames.timing.*;
import frames.primitives.*;
import frames.core.*;
import frames.processing.*;

// 1. Frames' objects
Scene scene;
Frame frame;
Vector v1, v2, v3;
// timing
TimingTask spinningTask;
boolean yDirection;
// scaling is a power of 2
int n = 4;

// 2. Hints
boolean triangleHint = true;
boolean gridHint = true;
boolean debug = true;

// 3. Use FX2D, JAVA2D, P2D or P3D
String renderer = P3D;

float[] colR = {1, 0, 0};
float[] colG = {0, 1, 0};
float[] colB = {0, 0, 1};

void setup() {
  //use 2^n to change the dimensions
  size(1024, 1024, renderer);
  scene = new Scene(this);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(width/2);
  scene.fitBallInterpolation();

  // not really needed here but create a spinning task
  // just to illustrate some frames.timing features. For
  // example, to see how 3D spinning from the horizon
  // (no bias from above nor from below) induces movement
  // on the frame instance (the one used to represent
  // onscreen pixels): upwards or backwards (or to the left
  // vs to the right)?
  // Press ' ' to play it
  // Press 'y' to change the spinning axes defined in the
  // world system.
  spinningTask = new TimingTask() {
    @Override
      public void execute() {
      scene.eye().orbit(scene.is2D() ? new Vector(0, 0, 1) :
        yDirection ? new Vector(0, 1, 0) : new Vector(1, 0, 0), PI / 100);
    }
  };
  scene.registerTask(spinningTask);

  frame = new Frame();
  frame.setScaling(width/pow(2, n));

  // init the triangle that's gonna be rasterized
  randomizeTriangle();
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  if (gridHint)
    scene.drawGrid(scene.radius(), (int)pow(2, n));
  if (triangleHint)
    drawTriangleHint();
  pushMatrix();
  pushStyle();
  scene.applyTransformation(frame);
  triangleRaster();
  popStyle();
  popMatrix();
}

// Implement this function to rasterize the triangle.
// Coordinates are given in the frame system which has a dimension of 2^n
void triangleRaster() {
  // frame.location converts points from world to frame
  // here we convert v1 to illustrate the idea
  HashMap<String, int[]> box = new HashMap<String, int[]>();
  int[] top = new int[2];
  top[0] = (int)(Math.min(Math.min((float)v1.x(), (float)v2.x()), (float)v3.x()));
  top[1] = (int)(Math.min(Math.min((float)v1.y(), (float)v2.y()), (float)v3.y()));
  box.put("top", top);
  int[] right = new int[2];
  right[0] = (int)(Math.max(Math.max((float)v1.x(), (float)v2.x()), (float)v3.x()));
  right[1] = (int)(Math.max(Math.max((float)v1.y(), (float)v2.y()), (float)v3.y()));
  box.put("right", right);

  for (float y = box.get("top")[1]; y <= box.get("right")[1]; y = y + pow(2, n)) {
    for (float x = box.get("top")[0]; x <= box.get("right")[0]; x = x + pow(2, n)) {
      float alpha = f_ab(x, y, v2, v3) / f_ab(v1.x(), v1.y(), v2, v3);
      float beta = f_ab(x, y, v3, v1) / f_ab(v2.x(), v2.y(), v3, v1);
      float gamma = f_ab(x, y, v1, v2) / f_ab(v3.x(), v3.y(), v1, v2);

      if (alpha >= 0 &&  alpha <= 1 && beta >= 0 &&  beta <= 1 && gamma >= 0 &&  gamma <= 1) {
        Vector p = new Vector(x, y);
        float r = (alpha * colR[0]) + (beta * colG[0]) + (gamma * colB[0]); 
        float g = (alpha * colR[1]) + (beta * colG[1]) + (gamma * colB[1]);
        float b = (alpha * colR[2]) + (beta * colG[2]) + (gamma * colB[2]);
        float[] rgb = {r*255, g*255, b*255};
        pushStyle();
        noStroke();
        rectMode(CENTER);
        fill(rgb[0], rgb[1], rgb[2]);
        rect(frame.location(p).x(), frame.location(p).y(), 0.5, 0.5);
        popStyle();
      }
    }
  }

  if (debug) {
    pushStyle();
    stroke(255, 0, 0);
    point(round(frame.location(v1).x()), round(frame.location(v1).y()));
    stroke(0, 255, 0);
    point(round(frame.location(v2).x()), round(frame.location(v2).y()));
    stroke(0, 0, 255);
    point(round(frame.location(v3).x()), round(frame.location(v3).y()));
    popStyle();
  }
}

float f_ab(float x, float y, Vector pa, Vector pb) {
  return (pa.y() - pb.y()) * x + (pb.x() - pa.x()) * y + pa.x()*pb.y() - pb.x()*pa.y();
}

void randomizeTriangle() {
  int low = -width/2;
  int high = width/2;
  v1 = new Vector(random(low, high), random(low, high));
  v2 = new Vector(random(low, high), random(low, high));
  v3 = new Vector(random(low, high), random(low, high));
}

void drawTriangleHint() {
  pushStyle();
  noFill();
  strokeWeight(2);
  stroke(255, 0, 0);
  triangle(v1.x(), v1.y(), v2.x(), v2.y(), v3.x(), v3.y());
  strokeWeight(5);
  stroke(0, 255, 255);
  point(v1.x(), v1.y());
  point(v2.x(), v2.y());
  point(v3.x(), v3.y());
  popStyle();
}

void keyPressed() {
  if (key == 'g')
    gridHint = !gridHint;
  if (key == 't')
    triangleHint = !triangleHint;
  if (key == 'd')
    debug = !debug;
  if (key == '+') {
    n = n < 7 ? n+1 : 2;
    frame.setScaling(width/pow( 2, n));
  }
  if (key == '-') {
    n = n >2 ? n-1 : 7;
    frame.setScaling(width/pow( 2, n));
  }
  if (key == 'r')
    randomizeTriangle();
  if (key == ' ')
    if (spinningTask.isActive())
      spinningTask.stop();
    else
      spinningTask.run(20);
  if (key == 'y')
    yDirection = !yDirection;
}
