package com.xzq.online_exam.charts;

import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.*;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Line;
import com.xzq.online_exam.domain.ClassInfo;
import org.springframework.stereotype.Repository;

import java.util.Map;
import java.util.Set;


public class StudentCount {

    /**
     * 班级对应学生人数折线图
     * @param data
     * @return
     */
    public static String createBarJson(Map<String, Object> data) {
        Set<String> set = data.keySet();

        GsonOption option = new GsonOption();

        option.title().text("班级学生数量统计").x(X.center).y(Y.top).borderWidth(1).textStyle().color("#438EB9");
        option.toolbox().show(true).feature(Tool.mark, Tool.restore, new MagicType(Magic.bar, Magic.line), Tool.saveAsImage).x(X.right).y(Y.top);
        //数据默认触发， 鼠标移入显示竖线  trigger(Trigger.axis)
        option.tooltip().formatter("{b} {c}人").trigger(Trigger.axis);

        option.legend().data("班级总人数").x(X.center).y(Y.bottom).borderWidth(1);

        Line line = new Line("班级总人数");

        //值轴
        ValueAxis valueAxis = new ValueAxis();
        valueAxis.axisLabel().formatter("{value}人").textStyle().color("#438EB9");
        //valueAxis.min(0);
        option.yAxis(valueAxis);

        //类目轴
        CategoryAxis categoryAxis = new CategoryAxis();
        //interval(0)：设置横轴信息全部显示
        //rotate(-30)：设置 -30 度角倾斜显示
        categoryAxis.axisLabel().interval(0).rotate(-30).textStyle().color("#438EB9");

        for (String className : set) {
            categoryAxis.data(className);
            ClassInfo classInfo = (ClassInfo)data.get(className);
            line.data(classInfo.getClassId());
        }

        option.xAxis(categoryAxis);
        line.smooth(true);
        option.series(line);
        option.grid().x(100);
        //System.out.println(option.toString());
        return option.toString();
    }
}
