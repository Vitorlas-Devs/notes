import java.util.Map;

public class PrinterThread extends Thread {
    private final Map<Stock, Double> stockMarket;

    public PrinterThread(Map<Stock, Double> stockMarket) {
        this.stockMarket = stockMarket;
        this.setDaemon(true);
    }

    @Override
    public void run() {
        while (true) {
            synchronized (stockMarket) {
                for (var entry : stockMarket.entrySet()) {
                    System.out.println("%s - %f".formatted(entry.getKey(), entry.getValue()));
                }
            }
            System.out.println("-------------------\n");

            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
