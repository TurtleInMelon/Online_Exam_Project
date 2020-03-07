package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.domain.TeachingInfo;

import java.util.List;

public interface TeachingInfoMapper {
    public List<TeachingInfo> getAllClassesByTeacherId(Integer tId);

    public TeachingInfo getTeachingInfoById(Integer teachingId);
}
