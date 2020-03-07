package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.domain.TeachingInfo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface TeachingInfoService {
    public List<TeachingInfo> getAllClassesByTeacherId(Integer teacherId);

    public TeachingInfo getTeachingInfoById(Integer teachingId);
}
