package com.xzq.online_exam.controller;

import com.xzq.online_exam.utils.Msg;
import com.xzq.online_exam.utils.PPTKeywordUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
public class pptUploadController {


    /**
     * 上传ＰＰＴ文件
     * @param request
     * @param PPT
     * @return
     */
    @RequestMapping(value = "/dispatcherUploadPPT",method = RequestMethod.POST)
    public String dispatcherUploadPPT(HttpServletRequest request,
                                   @RequestParam("inputPPTFile") MultipartFile PPT,
                                   @RequestParam(value = "PPTPageNums") String pageNums){
        String savePath="";
        try {
//            System.out.println(PPT);
            String fileName=PPT.getOriginalFilename();
            String rootPath=request.getSession().getServletContext().getRealPath("/")+"upload/";
            File dir=new File(rootPath);
            if(!dir.isDirectory()){
                dir.mkdir();
            }
//            System.out.println(rootPath+fileName);
            try {
                File upload=new File(rootPath+fileName);
                PPT.transferTo(upload);
            } catch (Exception e) {
                e.printStackTrace();
            }
            savePath=rootPath+"/"+fileName;
        } catch (Exception e) {
            e.printStackTrace();
        }
        if("".equals(pageNums) || pageNums==null){
            System.out.println("页数为空");
        }
//        System.out.println(pageNums);
        PPTKeywordUtil util = new PPTKeywordUtil();
        String keyWord = util.getKeyWord(savePath, pageNums);
        String keyWordsWithNoPageInfo = util.SplitString(keyWord);
        System.out.println(keyWord);
        request.setAttribute("keyWords", keyWord);
        request.setAttribute("keyWordsWithNoPageInfo", keyWordsWithNoPageInfo);
        return "admin/keyWordInput";
    }

}
