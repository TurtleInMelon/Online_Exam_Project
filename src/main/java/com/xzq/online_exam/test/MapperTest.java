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
import sun.plugin.javascript.navig.LinkArray;

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

    @Autowired
    private StudentExamInfoService studentExamInfoService;

    @Autowired
    private ExamSubjectMiddleInfoService examSubjectMiddleInfoService;
    private ExamPlanService examPlanService;

    @Autowired
    private ExamHistoryInfoService examHistoryInfoService;

    @Autowired
    private ExamChooseInfoService examChooseInfoService;


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
        /**int total=studentInfoService.getStudentTotal();
        System.out.println("--------------------------------------");
        System.out.println(total);**/
        List<StudentInfo> students = studentInfoService.getStudentsByClassId(19);
        for(StudentInfo studentInfo:students){
            System.out.println(studentInfo);
        }
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
        /**int total=subjectInfoService.getSubjectTotal();
        System.out.println("--------------------------------------");
        System.out.println(total);**/

        /**
        //获取所有试题的信息
        List<SubjectInfo> allSubjects = subjectInfoService.getAllSubjects();
        for(SubjectInfo subjectInfo:allSubjects){
            System.out.println(subjectInfo);
        }**/
        //SubjectInfo subjectWithId = subjectInfoService.getSubjectWithId(9);
        //System.out.println(subjectWithId);
        /**
        List<SubjectInfo> subjectInfos = subjectInfoService.chooseSubjects(0, 1, 0);
        for(SubjectInfo subjectInfo:subjectInfos){
            System.out.println(subjectInfo);
        }**/
        /**
        SubjectInfo subjectInfo=new SubjectInfo();
        subjectInfo.setSubjectId(6549);
        subjectInfo.setSubjectName("你是小瓜吗");
        subjectInfo.setOptionA("是");
        subjectInfo.setOptionB("不是");
        subjectInfo.setOptionC("不是");
        subjectInfo.setOptionD("不是");
        subjectInfo.setRightResult("A");
        subjectInfo.setSubjectType(1);
        subjectInfo.setSubjectEasy(2);
        subjectInfo.setCourse(new CourseInfo(3));
        subjectInfo.setGrade(new GradeInfo(2));
        subjectInfoService.updateSubject(subjectInfo);**/
        subjectInfoService.deleteSubjectById(3);
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

        ClassInfo classInfo = classInfoService.getClassByTeacherId(2);
        System.out.println(classInfo);
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
        //classInfoService.deleteClassById(26);
    }

    @Test
    public void testPaperExamInfo(){
        /**
        List<ExamPaperInfo> allExamPapers = examPaperInfoService.getAllExamPapers();
        for(ExamPaperInfo examPaperInfo:allExamPapers){
            System.out.println(examPaperInfo);
        }**/
        boolean result = examPaperInfoService.checkExamPaperName("vfdg");
        System.out.println(result);
    }

    @Test
    public void testStudentExamInfo(){
        /**
        List<StudentExamInfo> allStudentAvgScoreCount = studentExamInfoService.getAllStudentAvgScoreCount(19);
        for(StudentExamInfo studentExamInfo:allStudentAvgScoreCount){
            System.out.println(studentExamInfo);
        }**/
        /**
        List<StudentExamInfo> studentExamInfo = studentExamInfoService.getStudentExamInfoById(1);
        for(StudentExamInfo each:studentExamInfo){
            System.out.println(each);
        }**/

    }

    @Test
    public void testExamSubjectMiddleInfo(){
        /**List<ExamSubjectMiddleInfo> allESMByExamPaper = examSubjectMiddleInfoService.getAllESMByExamPaperId(2);
        for(ExamSubjectMiddleInfo each:allESMByExamPaper){
            System.out.println(each);
        }**/
        //examSubjectMiddleInfoService.removeSubjectByExamPaperIdAndSubjectId(2,5902);
        //examSubjectMiddleInfoService.addESMByOne(1,4);
        Boolean result=examSubjectMiddleInfoService.checkSubject(1,999);
        System.out.println(result);
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
