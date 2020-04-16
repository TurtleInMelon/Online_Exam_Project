package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.StudentKeyInfo;
import com.xzq.online_exam.domain.TeachingInfo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface StudentKeyInfoService {
    public List<Integer> theThirdKey(Integer studentId);

    public List<StudentKeyInfo>getAllStudentsWithTheThirdKeys(TeachingInfo teachingInfo);

    public List<String>getRecordByKey(Integer keyId);
}
