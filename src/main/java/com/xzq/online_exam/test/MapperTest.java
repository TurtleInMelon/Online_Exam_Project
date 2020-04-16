package com.xzq.online_exam.test;



import com.xzq.online_exam.domain.*;
import com.xzq.online_exam.service.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    private StudentExamInfoService studentExamInfoService;

    @Autowired
    private ExamSubjectMiddleInfoService examSubjectMiddleInfoService;

    @Autowired
    private ExamPlanService examPlanService;

    @Autowired
    private ExamHistoryInfoService examHistoryInfoService;

    @Autowired
    private ExamChooseInfoService examChooseInfoService;

    @Autowired
    private StudentRecordService studentRecordService;

    @Autowired
    private ESMInfoService esmInfoService;

    @Autowired
    private StudentKeyInfoService studentKeyInfoService;

    @Autowired
    private KeyInfoService keyInfoService;

    @Autowired
    private TeachingInfoService teachingInfoService;


    @Test
    public void s(){
        TeachingInfo teachingInfo =new TeachingInfo();
        teachingInfo.setClassInfo(new ClassInfo(1));
        teachingInfo.setCourseInfo(new CourseInfo(1));
        teachingInfo.setTeacherInfo(new TeacherInfo(1));
        List<StudentKeyInfo> all=studentKeyInfoService.getAllStudentsWithTheThirdKeys(teachingInfo);
        for(StudentKeyInfo c:all)
            System.out.println(c);
    }

    @Test
    public void testKeyInfo(){

//        List<KeyInfo>all=keyInfoService.getKeyByCourseId(1);
//        for(KeyInfo c:all)
//            System.out.println(c);
//        boolean result = keyInfoService.checkKeyWords("lalala");
//        System.out.println(result);

//        int keyId = keyInfoService.getKeyIdByKeyName("谢尼玛");
//        System.out.println(keyId);
        List<KeyInfo> keyWords = keyInfoService.getKeyWords();
        for(KeyInfo keyInfo:keyWords){
            System.out.println(keyInfo);
        }
    }

    @Test
    public void bd(){
        System.out.println(studentKeyInfoService.theThirdKey(1));
    }

    @Test
    public void a(){
        List<SubjectInfo> exam=new ArrayList<SubjectInfo>();
        List<Integer> keys=studentKeyInfoService.theThirdKey(1);
        for(Integer k:keys){
            List<SubjectInfo>sub=subjectInfoService.getSubjectByKey(k);
            for(SubjectInfo s:sub)
                exam.add(s);
        }
        System.out.println(exam);
	}
	@Test
    public void testKey(){
//        List<SubjectInfo> exam=new ArrayList<SubjectInfo>();
//        List<Integer> keys=studentKeyInfoService.theThirdKey(1);
//        for(Integer k:keys){
//            List<SubjectInfo>sub=subjectInfoService.getSubjectByKey(k);
//            for(SubjectInfo s:sub)
//                exam.add(s);
//        }
//        System.out.println(exam);
//        KeyInfo keyInfo = new KeyInfo();
//        keyInfo.setKeyId(7);
//        keyInfo.setPriority(3);
//        keyInfo.setKeyName("张猪头");
//        CourseInfo courseInfo = new CourseInfo();
//        courseInfo.setCourseId(1);
//        keyInfo.setCourseInfo(courseInfo);
//        keyInfoService.updateKeyWordById(keyInfo);
        String keyName = keyInfoService.geyKeyNameByKeyId(1);
        System.out.println(keyName);
    }
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
//        int total=examPaperInfoService.getExamPaperTotal();
//        System.out.println("--------------------------------------");
//        System.out.println(total);
        int examPaperId = examPaperInfoService.getExamPaperIdByExamPaperName("张尼玛");
        System.out.println(examPaperId);
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

//        SubjectInfo subjectInfo=new SubjectInfo();
//        subjectInfo.setSubjectId(9);
//        subjectInfo.setSubjectName("你是小瓜吗");
//        subjectInfo.setOptionA("是");
//        subjectInfo.setOptionB("不是");
//        subjectInfo.setOptionC("不是");
//        subjectInfo.setOptionD("不是");
//        subjectInfo.setRightResult("A");
//        subjectInfo.setSubjectType(1);
//        subjectInfo.setSubjectEasy(2);
//        subjectInfo.setCourse(new CourseInfo(3));
//        subjectInfo.setGrade(new GradeInfo(2));
//        KeyInfo keyInfo = new KeyInfo();
//        keyInfo.setKeyId(2);
//        subjectInfo.setKeyInfo(keyInfo);
//        subjectInfoService.updateSubject(subjectInfo);
        List<SubjectInfo> subjects = subjectInfoService.getSubjectsByKeyId(3);
        for(SubjectInfo each :subjects){
            System.out.println(each);
        }
//        boolean re = subjectInfoService.checkKeyId(3);
//        System.out.println(re);
        //subjectInfoService.deleteSubjectById(3);

//        List<SubjectInfo>all=subjectInfoService.getSubjectByKey(1);
//        for(SubjectInfo s:all){
//            System.out.println(s);
//        }
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
//        courseInfoService.deleteCourseById(21);
        String courseNameById = courseInfoService.getCourseNameById(1);
        System.out.println(courseNameById);
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

    @Test
    public void testExamHistory(){
        /**
        List<ExamHistoryInfo> examHistory = examHistoryInfoService.getExamHistory();
        for(ExamHistoryInfo each:examHistory){
            System.out.println(each);
        }**/

    }

    @Test
    public void t(){
        ExamChooseInfo examChooseInfo=examChooseInfoService.getExamChoose(1,8,6544);
        System.out.println(examChooseInfo);
    }

    @Test
    public void TestPython(){
    }

    @Test
    public void testExamPlan1() throws ParseException {
        ExamPlanInfo examPlanInfo = new ExamPlanInfo();
        ClassInfo classInfo = new ClassInfo();
        classInfo.setClassId(1);
        examPlanInfo.setClassInfo(classInfo);
        CourseInfo courseInfo = new CourseInfo();
        courseInfo.setCourseId(1);
        examPlanInfo.setCourseInfo(courseInfo);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date beginTime = format.parse("2020-04-15 08:38");
//            System.out.println(beginTime.toString());
        examPlanInfo.setBeginTime(beginTime);
        ExamPaperInfo examPaperInfo = new ExamPaperInfo();
        examPaperInfo.setExamPaperName("小瓜瓜");
        examPlanInfo.setExamPaperInfo(examPaperInfo);
        examPlanService.addOne(examPlanInfo);
    }

    }
