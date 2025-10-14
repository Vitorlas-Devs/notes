import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Map<Stock, Double> stockMarket = Collections.synchronizedMap(new HashMap<>());
        ExecutorService executorService = Executors.newFixedThreadPool(101);

        for (Stock stock : Stock.values()) {
            stockMarket.put(stock, 100D);
        }

        executorService.submit(new PrinterThread(stockMarket));

        for (int i = 0; i < 100; ++i) {
            executorService.submit(new Broker(stockMarket));
        }

        executorService.shutdown();
        if (!executorService.awaitTermination(3, TimeUnit.SECONDS)) {
            executorService.shutdownNow();
        }
    }
}