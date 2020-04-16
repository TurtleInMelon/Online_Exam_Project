package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.domain.KeyInfo;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.INTERNAL;

import java.util.List;

public interface KeyInfoMapper {
    public List<KeyInfo> getKeyByCourseId(Integer courseId);

    public List<KeyInfo> getKeyPriorityBefore(@Param("courseId") Integer courseId, @Param("priority") Integer priority);

    public void addOne(KeyInfo keyInfo);

    public void deleteOne(String keyName);

    public void editOne(KeyInfo keyInfo);

    public List<CourseInfo>getAllKeyDB();

    public List<Integer>getAllPriority(Integer courseId);

    int checkKeyWords(String keyName);

    int getKeyIdByKeyName(String each);

    List<KeyInfo> getKeyWords();

    void updateKeyWordById(KeyInfo keyId);

    String geyKeyNameByKeyId(Integer keyId);
}
