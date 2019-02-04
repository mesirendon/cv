class Hermite implements Interpolater {
  protected List<Vector> points;

  @Override
    public String name() {
    return "Hermite";
  }

  @Override
    public void setPoints(List<Vector> points) {
    this.points = points;
  }

  @Override
    public void drawPath() {
    for (int i = 1; i <= this.points.size() - 3; i++) {
      Vector p0 = this.points.get(i);
      Vector p1 = this.points.get(i + 1);
      Vector m0 = m(i);
      Vector m1 = m(i + 1);

      Vector previousPoint = p0;

      for (float t = 0; t < 1; t += granularity) {
        Vector H00 = Vector.multiply(p0, h00(t));
        Vector H10 = Vector.multiply(m0, h10(t));
        Vector H01 = Vector.multiply(p1, h01(t));
        Vector H11 = Vector.multiply(m1, h11(t));

        Vector H0010 = Vector.add(H00, H10);
        Vector H0111 = Vector.add(H01, H11);

        Vector p = Vector.add(H0010, H0111);
        line(previousPoint, p);
        previousPoint = p;
      }
      line(previousPoint, p1);
    }
  }

  private Vector m(int k) {
    return Vector.multiply(Vector.subtract(this.points.get(k - 1), this.points.get(k + 1)), 0.5);
  }

  private float h00(float t) {
    return (1 + 2 * t) * pow((1 - t), 2);
  }

  private float h10(float t) {
    return t * pow((1 - t), 2);
  }

  private float h01(float t) {
    return pow(t, 2) * (3 - 2 * t);
  }

  private float h11(float t) {
    return pow(t, 2) * (t - 1);
  }
}
