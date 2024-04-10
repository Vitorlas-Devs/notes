package worker.schedule;

import java.util.*;
import java.util.Map.Entry;

public class WorkerSchedule {
  private HashMap<Integer, HashSet<String>> weekToWorkers;

  public WorkerSchedule() {
    weekToWorkers = new HashMap<>();
  }

  public void add(int week, HashSet<String> name) {
    if (weekToWorkers.containsKey(week)) {

    }
  }

  public HashSet<Integer> getWorkWeeks(String name) {
    HashSet<Integer> result = new HashSet<>();

    for (Map.Entry<Integer, HashSet<String>> entry : weekToWorkers.entrySet()) {
      if (entry.getValue().contains(name)) {
        result.add(entry.getKey());
      }
    }

    return result;
  }
}
