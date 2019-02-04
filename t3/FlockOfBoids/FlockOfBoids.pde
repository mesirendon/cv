/**
 * Flock of Boids
 * by Jean Pierre Charalambos.
 *
 * This example displays the famous artificial life program "Boids", developed by
 * Craig Reynolds in 1986 [1] and then adapted to Processing by Matt Wetmore in
 * 2010 (https://www.openprocessing.org/sketch/6910#), in 'third person' eye mode.
 * The Boid under the mouse will be colored blue. If you click on a boid it will
 * be selected as the scene avatar for the eye to follow it.
 *
 * 1. Reynolds, C. W. Flocks, Herds and Schools: A Distributed Behavioral Model. 87.
 * http://www.cs.toronto.edu/~dt/siggraph97-course/cwr87/
 * 2. Check also this nice presentation about the paper:
 * https://pdfs.semanticscholar.org/73b1/5c60672971c44ef6304a39af19dc963cd0af.pdf
 * 3. Google for more...
 *
 * Press ' ' to switch between the different eye modes.
 * Press 'a' to toggle (start/stop) animation.
 * Press 'p' to print the current frame rate.
 * Press 'm' to change the boid visual mode.
 * Press 'v' to toggle boids' wall skipping.
 * Press 's' to call scene.fitBallInterpolation().
 */

import frames.primitives.*;
import frames.core.*;
import frames.processing.*;

Scene scene;
Interpolator interpolator;
//flock bounding box
static int flockWidth = 1280;
static int flockHeight = 720;
static int flockDepth = 600;
static boolean avoidWalls = true ;
static boolean immediateMode = true;
static boolean vertexVertexMode = true;
static boolean b = false;

float granularity = 0.0125;
int mode = 0;
int controlPoints = 4;
int initBoidNum = 900; // amount of boids to start the program with
ArrayList<Boid> flock;
Frame avatar;
boolean animate = true;
ArrayList<Interpolater> interpolaters = new ArrayList<Interpolater>();

void setup() {

  size(1500, 1000, P3D);
  scene = new Scene(this);
  scene.setBoundingBox(new Vector(0, 0, 0), new Vector(flockWidth, flockHeight, flockDepth));
  scene.setAnchor(scene.center());
  scene.setFieldOfView(PI / 3);
  scene.fitBall();
  // create and fill the list of boids
  flock = new ArrayList();
  for (int i = 0; i < initBoidNum; i++)
    flock.add(new Boid(new Vector(flockWidth / 2, flockHeight / 2, flockDepth / 2)));
  interpolator =  new Interpolator(scene);
  interpolaters.add(new Bezier());
  interpolaters.add(new Hermite());
  interpolaters.add(new NaturalCubic());
}

void draw() {
  background(10, 50, 25);
  ambientLight(128, 128, 128);
  directionalLight(255, 255, 255, 0, 1, -100);
  walls();
  scene.traverse();


  pushStyle();

  if (b) {
    strokeWeight(8);
    switch(mode) {
    case 0:
      stroke(100, 255, 100);
      break;
    case 1:
      stroke(100, 100, 255);
      break;
    case 2:
      stroke(255, 100, 100);
      break;
    }
    ArrayList<Vector> points = new ArrayList<Vector>();
    for (Frame f : interpolator.keyFrames())
      points.add(f.position());
    interpolaters.get(mode).setPoints(points);
    interpolaters.get(mode).drawPath();
  }
  popStyle();
  // uncomment to asynchronously update boid avatar. See mouseClicked()
  // updateAvatar(scene.trackedFrame("mouseClicked"));
}

void walls() {
  pushStyle();
  noFill();
  stroke(255, 255, 0);

  line(0, 0, 0, 0, flockHeight, 0);
  line(0, 0, flockDepth, 0, flockHeight, flockDepth);
  line(0, 0, 0, flockWidth, 0, 0);
  line(0, 0, flockDepth, flockWidth, 0, flockDepth);

  line(flockWidth, 0, 0, flockWidth, flockHeight, 0);
  line(flockWidth, 0, flockDepth, flockWidth, flockHeight, flockDepth);
  line(0, flockHeight, 0, flockWidth, flockHeight, 0);
  line(0, flockHeight, flockDepth, flockWidth, flockHeight, flockDepth);

  line(0, 0, 0, 0, 0, flockDepth);
  line(0, flockHeight, 0, 0, flockHeight, flockDepth);
  line(flockWidth, 0, 0, flockWidth, 0, flockDepth);
  line(flockWidth, flockHeight, 0, flockWidth, flockHeight, flockDepth);
  popStyle();
}

void updateAvatar(Frame frame) {
  if (frame != avatar) {
    avatar = frame;
    if (avatar != null)
      thirdPerson();
    else if (scene.eye().reference() != null)
      resetEye();
  }
}

// Sets current avatar as the eye reference and interpolate the eye to it
void thirdPerson() {
  scene.eye().setReference(avatar);
  scene.interpolateTo(avatar);
}

// Resets the eye
void resetEye() {
  // same as: scene.eye().setReference(null);
  scene.eye().resetReference();
  scene.lookAt(scene.center());
  scene.fitBallInterpolation();
}

// picks up a boid avatar, may be null
void mouseClicked() {
  // two options to update the boid avatar:
  // 1. Synchronously
  updateAvatar(scene.track("mouseClicked", mouseX, mouseY));
  // which is the same as these two lines:
  // scene.track("mouseClicked", mouseX, mouseY);
  // updateAvatar(scene.trackedFrame("mouseClicked"));
  // 2. Asynchronously
  // which requires updateAvatar(scene.trackedFrame("mouseClicked")) to be called within draw()
  // scene.cast("mouseClicked", mouseX, mouseY);
}

// 'first-person' interaction
void mouseDragged() {
  if (scene.eye().reference() == null)
    if (mouseButton == LEFT)
      // same as: scene.spin(scene.eye());
      scene.spin();
    else if (mouseButton == RIGHT)
      // same as: scene.translate(scene.eye());
      scene.translate();
    else
      // same as: scene.zoom(mouseX - pmouseX, scene.eye());
      scene.zoom(mouseX - pmouseX);
}

// highlighting and 'third-person' interaction
void mouseMoved(MouseEvent event) {
  // 1. highlighting
  scene.cast("mouseMoved", mouseX, mouseY);
  // 2. third-person interaction
  if (scene.eye().reference() != null)
    // press shift to move the mouse without looking around
    if (!event.isShiftDown())
      scene.lookAround();
}

void mouseWheel(MouseEvent event) {
  // same as: scene.scale(event.getCount() * 20, scene.eye());
  scene.scale(event.getCount() * 20);
}

void keyPressed() {
  switch (key) {
  case 'b':
    if (!b)
      for (int i = 0; i <= controlPoints; i++) {
        int index = int(random(0, initBoidNum));
        interpolator.addKeyFrame(flock.get(index).frame);
      } else interpolator.clear();
    b=!b;
    break;
  case 'a':
    animate = !animate;
    break;
  case 's':
    if (scene.eye().reference() == null)
      scene.fitBallInterpolation();
    break;
  case 't':
    scene.shiftTimers();
    break;
  case 'p':
    println("Frame rate: " + frameRate);
    break;
  case 'v':
    avoidWalls = !avoidWalls;
    break;

  case 'c':
    mode = (mode+1 < interpolaters.size()) ? mode+1 : 0;
    println(interpolaters.get(mode).name());
    break;

  case 'r':
    if (controlPoints == 4) controlPoints = 8;
    else controlPoints = 4;
    println("Control points: " + controlPoints);
    break;

  case 'f':
    vertexVertexMode = !vertexVertexMode;
    if (vertexVertexMode) println("Vertex Vertex mode");
    else println("Face Vertex mode");
    break;

  case 'm':
    immediateMode = !immediateMode;
    if (immediateMode) println("Immediate rendering mode");
    else println("Retained rendering mode");
    break;

  case '+':
    granularity *= 0.5;
    println("Granularity: " + granularity);
    break;
  case '-':
    granularity *= 2;
    println("Granularity: " + granularity);
    /*
    if (interpolator.keyFrames().isEmpty()) {
     println(" ¡No hay puntos para eliminar! ");
     break;
     } else {
     //interpolator.purge();
     println(interpolator.keyFrames());
     println(interpolator.keyFrame(0) + " pos: 0");
     interpolator.removeKeyFrame(0);
     println(interpolator.keyFrames());
     }
     */
    break;
  case ' ':
    if (scene.eye().reference() != null)
      resetEye();
    else if (avatar != null)
      thirdPerson();
    break;
  }
}

void vertexVertexDraw(float sc) {
  beginShape(TRIANGLE_STRIP);
  vertex(0, 3*sc, 0);
  vertex(0, 1*sc, 0);
  vertex(8*sc, 0, 0);

  vertex(0, 0, -1*sc);
  vertex(0, -1*sc, 0);
  vertex(8*sc, 0, 0);
  vertex(0, -3*sc, 0);
  endShape();
}

void faceVertexDraw(float sc) {
  beginShape(TRIANGLE);
  int[][] faceList = {
    {0, 1, 2}, 
    {1, 2, 3}, 
    {1, 3, 4}, 
    {1, 4, 5}
  };

  float[][] vertexList = {
    {0, 3*sc, 0}, 
    {8*sc, 0, 0}, 
    {0, 1*sc, 0}, 
    {0, 0, -1*sc}, 
    {0, -1*sc, 0}, 
    {0, -3*sc, 0}
  };


  for (int i = 0; i < faceList.length; i++) {
    for (int j = 0; j < faceList[i].length; j++) {
      int v = faceList[i][j];
      vertex(vertexList[v][0], vertexList[v][1], vertexList[v][2]);
    }
  }
  endShape();
}

void line(Vector a, Vector b) {
  line(a.x(), a.y(), a.z(), b.x(), b.y(), b.z());
}
