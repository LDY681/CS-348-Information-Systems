package org.myorg;
import java.io.IOException;
import java.util.*;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.conf.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;
import org.apache.hadoop.util.*;

public class Select {

  public static class Map 
    extends MapReduceBase implements Mapper<LongWritable, Text, Text, Text> 
  {

    private Text outKey = new Text();
    private Text outValue = new Text();

    public void map(LongWritable inKey, Text inValue, 
      OutputCollector<Text, Text> output, Reporter reporter) throws IOException 
    {
      String str = inValue.toString();
      if(str.equals("aaa")){
        outKey.set(str);
        outValue.set("val");
        output.collect(outKey, outValue);
      }
    }
  }

  public static void main(String[] args) throws Exception {

    JobConf conf = new JobConf(Select.class);
    conf.setJobName("Users");

    FileInputFormat.setInputPaths(conf, new Path(args[0]));
    FileOutputFormat.setOutputPath(conf, new Path(args[1]));

    conf.setInputFormat(TextInputFormat.class);
    conf.setOutputFormat(TextOutputFormat.class);

    conf.setOutputKeyClass(Text.class);
    conf.setOutputValueClass(Text.class);

    conf.setMapperClass(Map.class);
    conf.setNumReduceTasks(0);

    JobClient.runJob(conf);
  }
}
