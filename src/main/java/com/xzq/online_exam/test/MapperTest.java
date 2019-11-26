package com.xzq.online_exam.test;



import com.xzq.online_exam.controller.SubjectInfoController;
import com.xzq.online_exam.dao.TeacherInfoMapper;
import com.xzq.online_exam.domain.*;
import com.xzq.online_exam.service.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Map;
import java.util.Set;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    private TeacherInfoService teacherInfoService;

    @Autowired
    private ExamPaperInfoService examPaperInfoService;

    @Autowired
    private StudentInfoService studentInfoService;

    @Autowired
    private SubjectInfoService subjectInfoService;

    @Autowired
    private GradeInfoService gradeInfoService;

    @Autowired
    private CourseInfoService courseInfoService;

    @Autowired
    private ClassInfoService classInfoService;


    @Test
    public void testTeacher(){
        /**TeacherInfo fangzheng = teacherInfoService.getTeacherByAccount("fangzheng");
        System.out.println(fangzheng);**/
        /**
        List<TeacherInfo> allTeacherInfo = teacherInfoService.getALlTeacherInfo();
        for(TeacherInfo teacherInfo:allTeacherInfo){
            System.out.println(teacherInfo);
        }**/

        TeacherInfo teacherInfo= new TeacherInfo();
        teacherInfo.setTeacherId(23);
        teacherInfo.setAdminPower(1);
        teacherInfo.setTeacherAccount("mxz123");
        teacherInfo.setTeacherName("麻小猪");
        teacherInfo.setTeacherPwd("123456");
        teacherInfoService.updateTeacher(teacherInfo);
        /**
        boolean result = teacherInfoService.checkTeacherName("llll");
        System.out.println(result);**/

    }

    @Test
    public void testExamPaperInfo(){
        int total=examPaperInfoService.getExamPaperTotal();
        System.out.println("--------------------------------------");
        System.out.println(total);
    }

    @Test
    public void testStudentInfo(){
        int total=studentInfoService.getStudentTotal();
        System.out.println("--------------------------------------");
        System.out.println(total);
    }

    @Test
    public void testSubjectInfo(){
        /**int total=subjectInfoService.getSubjectTotal();
        System.out.println("--------------------------------------");
        System.out.println(total);**/

        /**
        //获取所有试题的信息
        List<SubjectInfo> allSubjects = subjectInfoService.getAllSubjects();
        for(SubjectInfo subjectInfo:allSubjects){
            System.out.println(subjectInfo);
        }**/
        SubjectInfo subjectWithId = subjectInfoService.getSubjectWithId(9);
        System.out.println(subjectWithId);
    }

    @Test
    public void testGradeInfo(){
        /**List<GradeInfo> allGrades = gradeInfoService.getAllGrades();
        for(GradeInfo gradeInfo:allGrades){
            System.out.println(gradeInfo);
        }**/
        /**GradeInfo gradeInfo= new GradeInfo();
        gradeInfo.setGradeName("麻小瓜");
        gradeInfoService.addGrade(gradeInfo);**/
        /**boolean result = gradeInfoService.checkGradeName("猪头瓜");
        System.out.println(result);**/
        /**GradeInfo gradeInfo= new GradeInfo();
        gradeInfo.setGradeName("麻小瓜");
        gradeInfo.setGradeId(6);
        gradeInfoService.updateGrade(gradeInfo);**/
        //gradeInfoService.deleteGrade(6);
    }

    @Test
    public void testCourseInfo(){
        /**List<CourseInfo> allCoursesWithGradeName = courseInfoService.getAllCoursesWithGradeName(null);
        for(CourseInfo courseInfo:allCoursesWithGradeName){
            System.out.println(courseInfo);
        }**/
        /**List<CourseInfo> allCourseNames = courseInfoService.getAllCourseNames();
        for(CourseInfo courseInfo:allCourseNames){
            System.out.println(courseInfo);
        }**/
        /**
        CourseInfo courseInfo=new CourseInfo();
        courseInfo.setCourseName("小萌龟");
        courseInfo.setDivision(1);
        GradeInfo gradeInfo=new GradeInfo();
        gradeInfo.setGradeId(1);
        courseInfo.setGradeInfo(gradeInfo);
        courseInfoService.addCourse(courseInfo);
         **/
        /**boolean count = courseInfoService.checkGradeName("xiaomenggui");
        System.out.println(count);**/
        /**CourseInfo courseInfo=new CourseInfo();
        courseInfo.setCourseName("麻辣小猪头");
        courseInfo.setDivision(2);
        courseInfo.setCourseId(21);
        GradeInfo gradeInfo=new GradeInfo();
        gradeInfo.setGradeId(3);
        courseInfo.setGradeInfo(gradeInfo);
        System.out.println(courseInfo);
        courseInfoService.updateCourse(courseInfo);**/
        courseInfoService.deleteCourseById(21);
    }

    @Test
    public void testClassInfo(){
        //测试查询所有班级的信息
      /**  List<ClassInfo> allClassesWithTeacherName = classInfoService.getAllClassesWithTeacherName(null);
        for(ClassInfo classInfo:allClassesWithTeacherName){
            System.out.println(classInfo);
        }**/
      /**
        Map<String, Object> studentCountForClass = classInfoService.getStudentCountForClass(1);
        //System.out.println(studentCountForClass);
        Set<String> keys=studentCountForClass.keySet();
        for(String key:keys){
            System.out.println("key值："+key+" value值："+studentCountForClass.get(key));
        }**/
        /**
        boolean result =classInfoService.checkClassName("小萌龟");
        System.out.println(result);**/
        /**
        ClassInfo classInfo=new ClassInfo();
        classInfo.setClassId(25);
        classInfo.setClassName("猪头天");
        GradeInfo gradeInfo= new GradeInfo();
        gradeInfo.setGradeId(2);
        TeacherInfo teacherInfo= new TeacherInfo();
        teacherInfo.setTeacherId(4);
        classInfo.setGradeInfo(gradeInfo);
        classInfo.setTeacherInfo(teacherInfo);
        classInfoService.updateClass(classInfo);**/
        classInfoService.deleteClassById(26);
    }

    @Test
    public void testPaperExamInfo(){
        List<ExamPaperInfo> allExamPapers = examPaperInfoService.getAllExamPapers();
        for(ExamPaperInfo examPaperInfo:allExamPapers){
            System.out.println(examPaperInfo);
        }
    }


}
