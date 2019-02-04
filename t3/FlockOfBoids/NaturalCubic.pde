import org.jblas.Solve;
import org.jblas.FloatMatrix;

class NaturalCubic implements Interpolater {
  protected List<Vector> points;

  public String name() {
    return "Cubic Natural Spline";
  }
  public void setPoints(List<Vector> points) {
    this.points = points;
  }
  public void drawPath() {
    int n = this.points.size();
    ArrayList<FloatMatrix> solutions = getSolutionMatrix();
    Vector previousPoint = this.points.get(0);

    for (int i = 0; i < n - 1; i++) {
      Spline px = getY(this.points.get(i).x(), this.points.get(i + 1).x(), solutions.get(0).get(i), solutions.get(0).get(i + 1));
      Spline py = getY(this.points.get(i).y(), this.points.get(i + 1).y(), solutions.get(1).get(i), solutions.get(1).get(i + 1));
      Spline pz = getY(this.points.get(i).z(), this.points.get(i + 1).z(), solutions.get(2).get(i), solutions.get(2).get(i + 1));

      Vector currentPoint = this.points.get(i + 1);

      for (float t = 0; t <= 1; t += granularity) {
        Vector p = new Vector();
        p.add(px.solveAt(t), py.solveAt(t), pz.solveAt(t));
        line(previousPoint, p);
        previousPoint = p;
      }
      line(previousPoint, currentPoint);
    }
  }

  private Spline getY(float y, float next_y, float Di, float next_Di) {
    float a = y;
    float b = Di;
    float c = 3 * (next_y - y) - 2 * Di - next_Di;
    float d = 2 * (y - next_y) + Di + next_Di;
    return new Spline(a, b, c, d);
  }

  private ArrayList<FloatMatrix> getSolutionMatrix() {
    int n = this.points.size();

    float[] bx = new float[n];
    float[] by = new float[n];
    float[] bz = new float[n];

    bx[0] = 3 * (this.points.get(1).x() - this.points.get(0).x());
    by[0] = 3 * (this.points.get(1).y() - this.points.get(0).y());
    bz[0] = 3 * (this.points.get(1).z() - this.points.get(0).z());

    bx[n - 1] = 3 * (this.points.get(n - 1).x() - this.points.get(n - 2).x());
    by[n - 1] = 3 * (this.points.get(n - 1).y() - this.points.get(n - 2).y());
    bz[n - 1] = 3 * (this.points.get(n - 1).z() - this.points.get(n - 2).z());

    for (int i = 1; i < n - 2; i++) {
      bx[i] = 3 * (this.points.get(i + 1).x() - this.points.get(i - 1).x());
      by[i] = 3 * (this.points.get(i + 1).y() - this.points.get(i - 1).y());
      bz[i] = 3 * (this.points.get(i + 1).z() - this.points.get(i - 1).z());
    }

    float[][] m = generateTridiagonalBase();

    ArrayList<FloatMatrix> D = new ArrayList<FloatMatrix>();
    FloatMatrix M = new FloatMatrix(m);
    FloatMatrix Bx = new FloatMatrix(bx);
    FloatMatrix By = new FloatMatrix(by);
    FloatMatrix Bz = new FloatMatrix(bz);

    D.add(0, Solve.solve(M, Bx));
    D.add(1, Solve.solve(M, By));
    D.add(2, Solve.solve(M, Bz));

    return D;
  }

  private float[][] generateTridiagonalBase() {
    int n = this.points.size();
    float[][] m = new float[n][n];
    for (int col = 0; col < n; col++)
      for (int row = 0; row < n; row++)
        m[col][row] = 0;

    for (int row = 0; row < n; row++) {
      if (row == 0) {
        m[row][row] = 2;
        m[row + 1][row] = 1;
      } else if (row == n - 1) {
        m[row - 1][row] = 1;
        m[row][row] = 2;
      } else {
        m[row - 1][row] = 1;
        m[row][row] = 4;
        m[row + 1][row] = 1;
      }
    }
    return m;
  }
}
