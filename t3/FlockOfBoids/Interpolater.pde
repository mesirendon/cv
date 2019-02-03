import java.util.List;

interface Interpolater {
  public String name();
  public void setPoints(List<Vector> points);
  public void drawPath();
}
