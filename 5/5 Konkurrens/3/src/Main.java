import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        ArrayList<Integer> numbers = new ArrayList<>();

        Thread oddThread = new Thread(() -> {
            for (int i = 1; i <= 1_000_000; i += 2) {
                synchronized (numbers) {
                    numbers.add(i);
                }
            }
        });

        Thread evenThread = new Thread(() -> {
            for (int i = 2; i <= 1_000_000; i += 2) {
                synchronized (numbers) {
                    numbers.add(i);
                }
            }
        });

        oddThread.start();
        evenThread.start();

        oddThread.join();
        evenThread.join();

        System.out.println("N: " + numbers.size());
    }
}