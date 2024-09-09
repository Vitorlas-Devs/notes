package first;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.server.jobtracker.JTConfig;
import org.apache.hadoop.fs.FileSystem;

public class testDriver {

  public static void main(String[] args) throws Exception {
    String uname = System.getProperty("user.name").replaceAll(" ", "_");
		System.setProperty("hadoop.tmp.dir", "c:\\BigData\\tmp-"+uname+"\\hadoop");
		System.setProperty("hadoop.home.dir", "c:\\BigData\\hadoop-3.3.6");
		
		Configuration conf = new Configuration();
		conf.set(JTConfig.JT_STAGING_AREA_ROOT, "c:\\BigData\\tmp-"+uname+"\\staging");
		conf.set(JTConfig.JT_SYSTEM_DIR, "c:\\BigData\\tmp-"+uname+"\\system");
    
    Job job = Job.getInstance(conf, "JobName");
    job.setJarByClass(first.testDriver.class);
    job.setMapperClass(first.testMapper.class);

    job.setReducerClass(first.testReducer.class);

    // TODO: specify output types
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(Text.class);

    // TODO: specify input and output DIRECTORIES (not files)
    FileInputFormat.setInputPaths(job, new Path("input.txt"));
    FileOutputFormat.setOutputPath(job, new Path("testeredmeny"));

    FileSystem fs = FileSystem.get(conf);
    if (fs.exists(new Path("testeredmeny"))) {
      fs.delete(new Path("testeredmeny"), true);
    }

    if (!job.waitForCompletion(true))
      return;
  }

}
