package com.xzq.online_exam.utils;



import com.mchange.v2.cfg.PropertiesConfigSource;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SlidePageNumImportUtil {

    private ArrayList<Integer> slideNum = new ArrayList<>();

    public List<Integer> getStudentConfusePageNum(String filePath){
        List<Integer> result = new ArrayList<>();
        //　读取工作本
        try {
            XSSFWorkbook workbook = new XSSFWorkbook(filePath);
            // 读取工作簿
            XSSFSheet sheet = workbook.getSheet("Sheet1");
            //　总行数
            int sunRows = sheet.getLastRowNum() - sheet.getFirstRowNum();

            //第一行
            XSSFRow firstRow = sheet.getRow(0);
            getCellIndexs(firstRow);

            for(int i=0;i<= sunRows; i++){
                XSSFRow row = sheet.getRow(i); //每一行
                String slidePage = row.getCell(1).toString();
                String[] split = slidePage.split(",");
                for(String each:split){
                    result.add(Integer.valueOf(each));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;

    }

    private static void getCellIndexs(XSSFRow firstRow){
        // 总的猎术
        int cellNum = firstRow.getLastCellNum() - firstRow.getFirstCellNum();
        for(int i=0; i<cellNum; i++){
            String cell = firstRow.getCell(i).toString();

        }
    }
}
