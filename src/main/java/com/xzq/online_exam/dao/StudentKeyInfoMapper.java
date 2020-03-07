package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.StudentKeyInfo;
import com.xzq.online_exam.domain.TeachingInfo;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface StudentKeyInfoMapper {
    public List<Integer> theThirdKey(Integer studentId);

    public List<StudentKeyInfo>getAllStudentsWithTheThirdKeys(TeachingInfo teachingInfo);

    public List<String>getRecordByKey(Integer keyId);
}
