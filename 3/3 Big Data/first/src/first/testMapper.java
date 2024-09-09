package first;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class testMapper extends Mapper<LongWritable, Text, Text, Text> {

  public void map(LongWritable ikey, Text ivalue, Context context) throws IOException, InterruptedException {
    Text key = new Text("key");
    Text value = new Text("value");

    context.write(key, value);
  }

}
