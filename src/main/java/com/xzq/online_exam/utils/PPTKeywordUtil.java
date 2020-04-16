package com.xzq.online_exam.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class PPTKeywordUtil {

    public String getKeyWord(String filePath,String pageNums){
        String result = "";
        Process proc;
        try{
            String command = "python /home/xzq/桌面/PPT提取/PPTkeyword.py "+filePath + " "+pageNums;
//            "python /home/xzq/桌面/PPT提取/PPTkeyword.py /home/xzq/桌面/1.pptx 1,2,3"
            proc = Runtime.getRuntime().exec(command);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line = null;
            while ((line = in.readLine()) != null){
                result += line;
                result +="\n";
//                System.out.println(line);
            }
            in.close();
            proc.waitFor();
        } catch (IOException e){
            e.printStackTrace();
        } catch (InterruptedException e){
            e.printStackTrace();
        }
        return result;
    }

    public String SplitString(String source){
        String result = "";
        String[] split = source.split("\n");
        for(String each:split){
            String[] split1 = each.split(":");
            String eachPageKeyWords = split1[1];
            String[] eachPageWords = eachPageKeyWords.split(" ");
            for(String e:eachPageWords){
                if("".equals(e)){
                    continue;
                }
                result+=e;
                result+=",";
            }
        }
        result = result.substring(0,result.length()-1);
        return result;
    }
}
