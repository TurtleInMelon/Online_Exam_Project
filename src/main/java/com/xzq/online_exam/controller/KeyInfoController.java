package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.google.gson.Gson;
import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.domain.KeyInfo;
import com.xzq.online_exam.service.KeyInfoService;
import com.xzq.online_exam.utils.Msg;
import jnr.ffi.annotations.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class KeyInfoController {
    @Autowired
    private KeyInfoService keyInfoService;

    @RequestMapping("/showKeyDB")
    public String show(Model model){
        List<CourseInfo> keyDB=keyInfoService.getAllKeyDB();
        model.addAttribute("keyDB",keyDB);
        return "/admin/keyDB";
    }

    @RequestMapping("/detailKeyDB/{courseId}")
    public String showDetail(HttpServletRequest request, Model model, @PathVariable("courseId") String courseId){
        List<KeyInfo> keyInfos=keyInfoService.getKeyByCourseId(Integer.valueOf(courseId));
        model.addAttribute("keyInfos",new Gson().toJson(keyInfos));
        return "/admin/keyDetails";
    }

    @RequestMapping("/refreshDB/{courseId}")
    @ResponseBody
    public Msg refresh(HttpServletRequest request, @PathVariable("courseId") String courseId){
        List<KeyInfo> keyInfos=keyInfoService.getKeyByCourseId(Integer.valueOf(courseId));
        return Msg.success().add("reKeyInfos",keyInfos);
    }

    @RequestMapping("/addOneKey")
    @ResponseBody
    public Msg addOne(HttpServletRequest request){
        KeyInfo keyInfo=new KeyInfo();
        keyInfo.setPriority(Integer.valueOf(request.getParameter("priority")));
        keyInfo.setKeyName(request.getParameter("keyName"));
        keyInfo.setCourseInfo(new CourseInfo(Integer.valueOf(request.getParameter("courseId"))));
        keyInfoService.addOne(keyInfo);
        return Msg.success();
    }

    @RequestMapping("/deleteBatch")
    @ResponseBody
    public Msg deleteKeyNames(HttpServletRequest request){
        String keyNames = request.getParameter("keyNames");
        String[] totalKeyNames = keyNames.split(",");
        for(String each:totalKeyNames){
            keyInfoService.deleteOne(each);
        }
        return Msg.success();
    }

    @RequestMapping("/deleteOneKey")
    @ResponseBody
    public Msg deleteOne(HttpServletRequest request){
        keyInfoService.deleteOne(request.getParameter("keyName"));
        return Msg.success();
    }

    @RequestMapping("/getAllPriority")
    @ResponseBody
    public Msg getAllPro(HttpServletRequest request){
        List<Integer> all=keyInfoService.getAllPriority(Integer.valueOf(request.getParameter("courseId")));
        return Msg.success().add("priorities",all);
    }

    /**
     * 输入ＰＰＴ页数，系统进行ＰＰＴ关键字的提取
     * @param pageNums
     * @return
     */
    @RequestMapping(value = "/PPTExtractKeyWords", method = RequestMethod.GET)
    @ResponseBody
    public Msg PPTExtractKeyWords(@RequestParam(value = "pageNums", defaultValue = "") String pageNums){
        System.out.println(pageNums);
        if("".equals(pageNums) || pageNums==null){
            System.out.println("页数为空");
        }

        return null;
    }

    /**
     * 获取所有的关键字
     * @param courseId
     * @return
     */
    @RequestMapping(value = "/getAllKeyWords", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllKeyWords(@RequestParam(value = "courseId") String courseId){
        System.out.println(courseId);
        List<KeyInfo> keyWords = keyInfoService.getKeyByCourseId(Integer.valueOf(courseId));
        return Msg.success().add("keyWordsList", keyWords);
    }

    /**
     * 获取关键字
     * @param courseId
     * @return
     */
    @RequestMapping(value = "/getKeyWords", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllKeyWords(){
        List<KeyInfo> keyWords = keyInfoService.getKeyWords();
        return Msg.success().add("keyWordsList", keyWords);
    }

    /**
     * 校验输入的额外关键字是否存在
     * @param extraKeyWords
     * @return
     */
    @RequestMapping(value = "/checkKeyWords", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkClass(@RequestParam("extraKeyWords")String extraKeyWords,@RequestParam("courseId") String courseId){
        //System.out.println(className);
        String[] KeyWords = extraKeyWords.split(",");
        for(String eachWord: KeyWords){
            //不存在，直接加入
            if(keyInfoService.checkKeyWords(eachWord)){
                KeyInfo keyInfo = new KeyInfo();
                keyInfo.setKeyName(eachWord);
                CourseInfo courseInfo =  new CourseInfo();
                courseInfo.setCourseId(Integer.valueOf(courseId));
                keyInfo.setCourseInfo(courseInfo);
                keyInfoService.addOne(keyInfo);

            }
            else{
                continue;
            }
        }
        return Msg.success();
    }

    @RequestMapping(value = "/geyKeyNameByKeyId", method = RequestMethod.POST)
    @ResponseBody
    public Msg geyKeyNameByKeyId(@RequestParam("keyId") String keyId){
        String keyName = keyInfoService.geyKeyNameByKeyId(Integer.valueOf(keyId));
        return Msg.success().add("keyName",keyName);
    }


    @RequestMapping(value = "/getKeyIdByKeyName", method = RequestMethod.POST)
    @ResponseBody
    public Msg getKeyIdByKeyName(@RequestParam("keyWords") String keyWords){
        String[] eachWords = keyWords.split(",");
        List<Integer> keyIds = new ArrayList<>();
        for(String each:eachWords){
            if(keyInfoService.checkKeyWords(each)){
                continue;
            }
            int keyId = keyInfoService.getKeyIdByKeyName(each);
            keyIds.add(keyId);
        }
        if(keyIds.isEmpty()){
            return Msg.fail().add("error_Msg","暂无上述知识点，请重新输入！！");
        }
        return Msg.success().add("keyIds",keyIds);
    }

    /**
     * 更新班级
     * @param classInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateKeyWordById",method = RequestMethod.GET)
    public Msg updateKeyWordById(@RequestParam("keyId") String keyId,
                                 @RequestParam("keyName") String keyName,
                                 @RequestParam("courseId") String courseId,
                                 @RequestParam("priority") String priority){
        KeyInfo keyInfo = new KeyInfo();
        keyInfo.setKeyId(Integer.valueOf(keyId));
        keyInfo.setCourseInfo(new CourseInfo(Integer.valueOf(courseId)));
        keyInfo.setKeyName(keyName);
        keyInfo.setPriority(Integer.valueOf(priority));
        System.out.println(keyInfo);
        keyInfoService.updateKeyWordById(keyInfo);

        return Msg.success();
    }

}
