package com.xzq.online_exam.test;



import com.xzq.online_exam.dao.TeacherInfoMapper;
import com.xzq.online_exam.domain.*;
import com.xzq.online_exam.service.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import sun.plugin.javascript.navig.LinkArray;

import java.util.List;

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

    @Autowired
    private ExamPlanService examPlanService;

    @Autowired
    private ExamHistoryInfoService examHistoryInfoService;

    @Autowired
    private ExamChooseInfoService examChooseInfoService;


    @Test
    public void testTeacher(){
        TeacherInfo fangzheng = teacherInfoService.getTeacherByAccount("fangzheng");
        System.out.println(fangzheng);
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
    public void testStuInfo(){
        List<StudentInfo> all=studentInfoService.getAllStudents();
        for(StudentInfo studentInfo:all)
            System.out.println(studentInfo);
    }
    @Test
    public void testExamPlan(){
        List<ExamPlanInfo>all=examPlanService.getExamPlan();
        for(ExamPlanInfo e:all)
            System.out.println(e);
    }
    @Test
    public void testgetExamHistory()
    {
        List<ExamHistoryInfo>all=examHistoryInfoService.getExamHistory();
        for(ExamHistoryInfo e:all)
            System.out.println(e);
    }
    @Test
    public void testdeleteOne(){
        studentInfoService.deleteOne(98);
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
        List<ClassInfo> allClassesWithTeacherName = classInfoService.getAllClassesWithTeacherName(null);
        for(ClassInfo classInfo:allClassesWithTeacherName){
            System.out.println(classInfo);
        }
    }
    @Test
    public void test(){
        System.out.println(examHistoryInfoService.JudgeStuExam(11,11));
    }
    @Test
    public void testExam(){
        String name="张君宝";
        String paper="计算机常识";
        List<ExamChooseInfo> all=examChooseInfoService.getAllExamChoose(name,paper);
        Integer i=0;
        for(ExamChooseInfo examChooseInfo:all)
        {
            System.out.println(examChooseInfo);
            i++;
        }
        System.out.println(i);
    }
}
