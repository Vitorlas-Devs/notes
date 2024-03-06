package famous.sequence;

import static check.CheckThat.*;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.condition.*;
import org.junit.jupiter.api.extension.*;
import org.junit.jupiter.params.*;
import org.junit.jupiter.params.provider.*;
import check.*;

public class FibonacciTest {
  @Test
  public void test1() {
    assertEquals(0, Fibonacci.fib(0));
    assertEquals(1, Fibonacci.fib(1));
    assertEquals(5, Fibonacci.fib(5));
    assertEquals(8, Fibonacci.fib(6));
  }
}
