class Spline{
  private float a;
  private float b;
  private float c;
  private float d;
  
  public Spline(float a, float b, float c, float d) {
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
  }
  
  public float solveAt(float t) {
    return this.a + this.b * t + c * pow(t, 2) + d * pow(t, 3);
  }
}
