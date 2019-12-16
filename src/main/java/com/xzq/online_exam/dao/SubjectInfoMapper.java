package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.SubjectInfo;
import org.springframework.stereotype.Repository;
import sun.security.x509.SubjectAlternativeNameExtension;

@Repository
public interface SubjectInfoMapper {

    /**
     * 获取学科数量
     * @return
     */
    public int getSubjectTotal();

    public SubjectInfo getSubjectInfoById(Integer id);
}
