import java.util.concurrent.atomic.AtomicLong;

public class Main {
    static long s2 = 0;
    public static void main(String[] args) {
        AtomicLong s = new AtomicLong();
        var start = System.nanoTime();
        new Thread(() -> {
            for (int i = 0; i < 1_000_000_000; i++) {
                s.addAndGet(i);
            }
        }).start();
        var end = System.nanoTime();
        System.out.println("Sum: " + s + ", Time: " + (end - start));

        Thread[] threads = new Thread[10];
        start = System.nanoTime();
        for (int n = 0; n < 10; n++) {
            long finalN = n;
            threads[n] = new Thread(() -> {
                for (long i = (finalN * 100_000_000); i < ((1 + finalN) * 100_000_000); i++) {
                    s2 += i;
                }
            });
            threads[n].start();
        }
        for (int n = 0; n < 10; n++) {
            try {
                threads[n].join();
            } catch (InterruptedException e) {}
        }
        end = System.nanoTime();
        System.out.println("Sum: " + s2 + ", Time: " + (end - start));


    }
}