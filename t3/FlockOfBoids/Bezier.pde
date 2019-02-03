class Bezier implements Interpolater {
  protected List<Vector> points;

  @Override
    public String name() {
    return "Bezier";
  }

  @Override
    public void setPoints(List<Vector> points) {
    this.points = points;
  }

  @Override
    public void drawPath() {
    Vector x = this.points.get(0);
    Vector y = null;
    for (float i = granularity; i <= 1; i += granularity) {
      y = bezier(i);
      line(x, y);
      x = y;
    }
  }

  private Vector bezier(final float t) {
    int n = this.points.size();
    Vector bez = new Vector(0, 0, 0);
    for (int i = 0; i < n; i++) {
      bez.add(Vector.multiply(this.points.get(i), bersteinPolynomial(n-1, i, t)));
    }
    return bez;
  }

  private float bersteinPolynomial(final int n, final int i, final float t) {
    return binomial(n, i) * pow(t, i) * pow(1 - t, n - i);
  }

  private int binomial(final int n, final int k) {
    int num = 1, den = 1;
    for (int i = n; i > k; i--)                   
      num *= i;                                    
    for (int i = 1; i <= (n - k); i++ )             
      den *= i;
    return num/den;
  }
}
