package com.xzq.online_exam.test;



import com.xzq.online_exam.dao.TeacherInfoMapper;
import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.domain.GradeInfo;
import com.xzq.online_exam.domain.TeacherInfo;
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

        List<TeacherInfo> allTeacherInfo = teacherInfoService.getALlTeacherInfo();
        for(TeacherInfo teacherInfo:allTeacherInfo){
            System.out.println(teacherInfo);
        }
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
        int total=subjectInfoService.getSubjectTotal();
        System.out.println("--------------------------------------");
        System.out.println(total);
    }

    @Test
    public void testGradeInfo(){
        List<GradeInfo> allGrades = gradeInfoService.getAllGrades();
        for(GradeInfo gradeInfo:allGrades){
            System.out.println(gradeInfo);
        }
    }

    @Test
    public void testCourseInfo(){
        List<CourseInfo> allCoursesWithGradeName = courseInfoService.getAllCoursesWithGradeName(null);
        for(CourseInfo courseInfo:allCoursesWithGradeName){
            System.out.println(courseInfo);
        }
    }

    @Test
    public void testClassInfo(){
        //测试查询所有班级的信息
      /**  List<ClassInfo> allClassesWithTeacherName = classInfoService.getAllClassesWithTeacherName(null);
        for(ClassInfo classInfo:allClassesWithTeacherName){
            System.out.println(classInfo);
        }**/
        Map<String, Object> studentCountForClass = classInfoService.getStudentCountForClass(1);
        //System.out.println(studentCountForClass);
        Set<String> keys=studentCountForClass.keySet();
        for(String key:keys){
            System.out.println("key值："+key+" value值："+studentCountForClass.get(key));
        }

    }

}
