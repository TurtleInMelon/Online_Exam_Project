package com.xzq.online_exam.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import com.xzq.online_exam.utils.PPTKeywordUtil;

public class PythonTest {

    public static void main(String[] args) {
//        Process proc;
//        try{
//            proc = Runtime.getRuntime().exec("python /home/xzq/桌面/PPT提取/PPTkeyword.py /home/xzq/桌面/1.pptx 1,2,3");
//            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
//            String line = null;
//            while ((line = in.readLine()) != null){
//                System.out.println(line);
//            }
//            in.close();
//            proc.waitFor();
//        } catch (IOException e){
//            e.printStackTrace();
//        } catch (InterruptedException e){
//            e.printStackTrace();
//        }

        PPTKeywordUtil util = new PPTKeywordUtil();
        String filePath = "/home/xzq/桌面/1.pptx";
        String pageNums = "1,2,3";
        String result = util.getKeyWord(filePath,pageNums);
//        System.out.println(result);
        result = util.SplitString(result);
        System.out.println(result);
    }
}
