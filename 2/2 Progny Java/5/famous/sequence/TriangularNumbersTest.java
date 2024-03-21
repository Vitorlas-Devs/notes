package famous.sequence;
import famous.sequence.TriangularNumbers;

public class TriangularNumbersTest {
  @ParameterizedTest
  @CsvSource(textBlock="""
    0
    1
    10
    -1
    -69
  """)
  public void test1(int expeced, int n) {
    assertEquals(expeced, TriangularNumbers.getTriangularNumber(n));
  }
}
