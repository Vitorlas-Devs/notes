import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

public class Broker implements Runnable {
    private static final int ITERATION = 10_000;
    private final Map<Stock, Double> stockMarket;
    private final ThreadLocalRandom rng = ThreadLocalRandom.current();

    public Broker(Map<Stock, Double> stockMarket) {
        this.stockMarket = stockMarket;
    }

    @Override
    public void run() {
        for (int i = 0; i < ITERATION; ++i) {
            int stockIdx = rng.nextInt(Stock.values().length);
            Stock stock = Stock.values()[stockIdx];
            double stockValue = stockMarket.get(stock);
            double onePercentOfStockValue = stockValue * 0.01;

            if (rng.nextBoolean()) {
                stockMarket.replace(stock, stockValue + onePercentOfStockValue);
            }
            else {
                stockMarket.replace(stock, stockValue - onePercentOfStockValue);
            }
        }
    }
}
