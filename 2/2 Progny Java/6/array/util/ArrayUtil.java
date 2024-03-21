package array.util;

public class ArrayUtil {
  public int max(int[] t) {
    if (t.length == 0)
      return 0;

    int max = Integer.MIN_VALUE;

    for (int i = 1; i < t.length; i++) {
      if (max < t[i])
        max = t[i];
    }

    return max;
  }

  public int max2(int[] t) {
    if (t.length == 0)
      return 0;

    int max = Integer.MIN_VALUE;

    for (int i = 1; i < t.length; i++)
      max = max < t[i] ? t[i] : max;

    return max;
  }

  public int max3(int[] t) {
    if (t.length == 0)
      return 0;

    int max = Integer.MIN_VALUE;

    for (int i = 1; i < t.length; i++)
      max = Math.max(max, t[i]);

    return max;
  }

  public int max4(int[] t) {
    if (t.length == 0)
      return 0;

    int max = Integer.MIN_VALUE;

    for (int i : t) {
      if (max < t[i])
        max = t[i];
    }

    return max;
  }
}
