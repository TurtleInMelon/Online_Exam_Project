package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.domain.KeyInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KeyInfoService {
    public List<KeyInfo> getKeyByCourseId(Integer courseId);

    public List<KeyInfo> getKeyPriorityBefore(Integer courseId, Integer priority);

    public void addOne(KeyInfo keyInfo);

    public void deleteOne(String keyName);

    public void editOne(KeyInfo keyInfo);

    public List<CourseInfo>getAllKeyDB();

    public List<Integer>getAllPriority(Integer courseId);


    boolean checkKeyWords(String extraKeyWords);


    int getKeyIdByKeyName(String each);

    List<KeyInfo> getKeyWords();

    void updateKeyWordById(KeyInfo keyInfo);

    String geyKeyNameByKeyId(Integer valueOf);

}
