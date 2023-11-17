package org.example;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class R1 extends Reducer<Text, IntWritable, Text, IntWritable>
{



    public void reduce(Text key, Iterable<IntWritable> values, Context context)	throws IOException, InterruptedException
    {
        int sum = 0;
        if(key.equals("ODD"))
        {
            for (IntWritable value : values)
            {
                sum += value.get();
            }
        }
        else
        {
            for (IntWritable value : values)
            {
                sum += value.get();
            }

        }
        context.write(key,new IntWritable(sum));;
    }
}