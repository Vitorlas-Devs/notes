package first;

import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class testReducer extends Reducer<Text, Text, Text, Text> {
  private Text empty = new Text(".........OK");

  public void reduce(Text _key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
    for (Text val : values) {
      context.write(val, empty);
    }
  }

}
