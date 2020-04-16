<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 20-3-12
  Time: 下午7:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>数据库知识图谱</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <script src="${APP_PATH}/static/echarts/echarts.js"></script>
    <script src="${APP_PATH}/static/echarts/shine.js"></script>
</head>
<body>
    <div>
        <div id="knowledgeMap" style="width:2000px; height: 2000px; float: left; border: 1px solid #E5E5E5;">

        </div>

    </div>


    <script type="text/javascript">

        var knowledgeChart=echarts.init(document.getElementById("knowledgeMap"),"shine");
        console.log(knowledgeChart);
        knowledgeChart.clear();
        // knowledgeChart.showLoading({text: "图表正在努力加载中..."});

        var data = {
            "name": "数据库原理",
            "children": [
                {
                    "name": "绪论",
                    "children": [
                        {
                            "name": "数据库系统概述",
                            "children": [
                                {
                                    "name": "数据库基本概念",     // value": 721
                                    "children": [
                                        { "name": "数据", "value": 1},
                                        { "name": "数据库", "value": 2},
                                        { "name": "数据库管理系统", "value": 3},
                                        { "name": "数据库系统", "value": 4},
                                    ]
                                },
                                {
                                    "name": "数据管理技术产生和发展",  "value": 5
                                },
                                {
                                    "name": "数据库系统的特点",     // value": 721
                                    "children": [
                                        { "name": "数据结构化", "value": 6},
                                        { "name": "数据的共享性高,冗余度低,且易扩充", "value": 7},
                                        { "name": "数据独立性高(数据,物理,逻辑)", "value": 8},
                                        { "name": "数据由数据库管理系统统一管理", "value": 9},
                                    ]
                                },
                            ]
                        },
                        {
                            "name": "数据模型", // "value": 3322
                            "children": [
                                {
                                    "name": "两类数据模型",
                                    "children": [
                                        {"name": "概念模型(信息模型)", "value": 10},
                                        {
                                            "name":"逻辑模型",
                                             "children":[
                                                 {"name":"层次模型","value": 11},
                                                 {"name":"网状模型","value": 12},
                                                 {"name":"关系模型","value": 13},
                                                 {"name":"面向对象模型","value": 14},
                                             ]
                                        }
                                    ]
                                },
                                {
                                    "name":"概念模型",
                                    "children":[
                                        {"name":"实体","value": 15},
                                        {"name":"属性","value": 16},
                                        {"name":"域","value": 17},
                                        {"name":"码","value": 18},
                                        {"name":"实体型","value": 19},
                                        {"name":"实体集","value": 20},
                                        {
                                            "name": "联系",
                                            "children":[
                                                {"name": "内部联系", "value":21},
                                                {
                                                    "name": "相互联系",
                                                    "children": [
                                                        {"name": "一对一", "value":22},
                                                        {"name": "一对多", "value":23},
                                                        {"name": "多对多", "value":24},
                                                    ]
                                                }
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "name": "数据模型的组成要素", // "value": 3322
                                    "children": [
                                        {"name": "数据结构", "value": 25},
                                        {"name": "数据操作", "value": 26},
                                        {"name": "数据完整性约束", "value": 27},
                                    ]
                                },
                                {
                                    "name": "常用的数据模型", // "value": 3322
                                    "children": [
                                        {"name": "层次模型", "value": 28},
                                        {"name": "网状模型", "value": 29},
                                        {"name": "关系模型", "value": 30},
                                        {"name": "面向对象数据模型", "value": 31},
                                        {"name": "对象关系数据模型", "value": 32},
                                        {"name": "半结构化数据模型", "value": 33},
                                    ]
                                },
                                {
                                    "name": "关系模型",
                                    "children": [
                                        {
                                            "name": "关系模型的数据结构",
                                            "children": [
                                                {"name": "关系-二维表", "value": 34},
                                                {"name": "关系名-表名", "value": 35},
                                                {"name": "关系模式-表头", "value": 36},
                                                {"name": "元组-记录", "value": 37},
                                                {"name": "属性-列", "value": 38},
                                                {"name": "码", "value": 39},
                                                {"name": "分量-一个记录中的一个列值", "value": 40},
                                                {"name": "半规范关系-表中有表", "value": 41},
                                            ]
                                        },
                                        {
                                            "name": "关系模型的数据操作与完整性约束",
                                            "children": [
                                                {
                                                    "name": "数据操作",
                                                    "children": [
                                                        {"name": "查询", "value": 42},
                                                        {"name": "插入", "value": 43},
                                                        {"name": "删除", "value": 44},
                                                        {"name": "更新", "value": 45},
                                                    ]
                                                },
                                                {
                                                    "name": "完整性约束",
                                                    "children": [
                                                        {"name": "实体完整性", "value": 46},
                                                        {"name": "参照完整性", "value": 47},
                                                        {"name": "用户自定义完整性", "value": 48}
                                                    ]
                                                }
                                            ]
                                        },
                                        {
                                            "name": "关系模型的优缺点",
                                            "children": [
                                                {
                                                    "name": "优点",
                                                    "children": [
                                                        {"name": "建立在严格的数学基础上", "value": 49},
                                                        {"name": "关系模型的概念单一", "value": 50},
                                                        {"name": "关系模型的存取路径对用户透明，独立性高，更好的保密性", "value": 51},
                                                    ]
                                                },
                                                {
                                                    "name": "查询效率不如格式化数据模型", "value": 52
                                                }
                                            ]
                                        }
                                    ]
                                }

                            ]
                        },
                        {
                            "name": "数据库系统的结构",
                            "children": [
                                {
                                    "name": "数据库系统模式的概念",
                                    "children": [
                                        {"name": "型", "value": 53},
                                        {"name": "值", "value": 54}
                                    ]
                                },
                                {
                                    "name": "数据库系统的三级模式结构",
                                    "children": [
                                        {"name": "外模式", "value": 55},
                                        {"name": "内模式", "value": 56}
                                    ]
                                },
                                {
                                    "name": "数据库的二级映像功能与数据独立性",
                                    "children": [
                                        {"name": "外模式/模式映像", "value": 57},
                                        {"name": "模式/内模式映像", "value": 58}
                                    ]
                                }
                            ]
                        },
                        {
                            "name": "数据库系统的组成",
                            "children":[
                                {"name": "硬件平台及数据库", "value": 59},
                                {"name": "软件", "value": 60},
                                {"name": "人员", "value": 61},
                            ]
                        }
                    ]
                },
                {
                    "name": "关系数据库",
                    "children": [
                        {
                            "name": "关系数据结构及形式化定义",
                            "children": [
                                {
                                    "name": "关系",
                                    "children": [
                                        {"name":"域", "value": 62},
                                        {
                                            "name": "笛卡尔积",
                                            "children": [
                                                {"name":"元祖", "value": 63},
                                                {"name":"分量", "value": 64},
                                                {"name":"基数", "value": 65}
                                            ]
                                        },
                                        {
                                            "name": "基本概念",
                                            "children": [
                                                {"name":"目或度", "value": 66},
                                                {"name":"元组", "value": 67},
                                                {"name":"单元关系", "value": 68},
                                                {"name":"二元关系", "value": 69},
                                                {"name":"候选码", "value": 70},
                                                {"name":"主码", "value": 71},
                                                {"name":"主属性", "value": 72},
                                                {"name":"非主属性", "value": 73},
                                                {"name":"全码", "value": 74}
                                            ]
                                        },
                                        {
                                            "name": "关系三种类型",
                                            "children": [
                                                {"name":"基本关系表", "value": 75},
                                                {"name":"查询表", "value": 76},
                                                {"name":"视图表", "value": 77}
                                            ]
                                        },
                                        {
                                            "name": "关系的6条性质",
                                            "children": [

                                            ]
                                        }
                                    ]
                                },
                                {
                                    "name": "关系模式", "value": 70
                                },
                                {
                                    "name": "关系数据库", "value": 71
                                },
                                {
                                    "name": "关系模型的存储结构", "value": 72
                                }
                            ]
                        },
                        {
                            "name": "关系操作",
                            "children": [
                                {
                                    "name": "基本的关系操作",
                                    "children": [
                                        {
                                            "name": "查询",
                                            "children": [
                                                {"name": "选择", "value": 67},
                                                {"name": "投影", "value": 68},
                                                {"name": "并", "value": 69},
                                                {"name": "差", "value": 70},
                                                {"name": "笛卡尔积", "value": 71},
                                                {"name": "连接", "value": 72},
                                                {"name": "除", "value": 73},
                                                {"name": "交", "value": 74},
                                            ]
                                        },
                                        {
                                            "name": "插入", "value": 75
                                        },
                                        {
                                            "name": "删除", "value": 76
                                        },
                                        {
                                            "name": "修改", "value": 77
                                        }
                                    ]
                                },
                                {
                                    "name": "关系数据语言的分类", "value": 78
                                }
                            ]
                        },
                        {
                            "name": "关系的完整性",
                            "children": [
                                { "name": "实体完整性", "value": 79},
                                { "name": "参照完整性", "value": 80},
                                { "name": "用户定义完整性", "value": 81}
                            ]
                        },
                        {
                            "name": "关系代数",
                            "children": [
                                {
                                    "name": "传统集合运算",
                                    "children": [
                                        { "name": "并", "value": 81},
                                        { "name": "差", "value": 82},
                                        { "name": "交", "value": 83},
                                        { "name": "笛卡尔积", "value": 84}
                                    ]
                                },
                                {
                                    "name": "专门的关系运算",
                                    "children": [
                                        { "name": "选择", "value": 85},
                                        { "name": "投影", "value": 86},
                                        { "name": "连接", "value": 87},
                                        { "name": "除", "value": 88}
                                    ]
                                },
                            ]
                        }
                    ]
                },
                {
                    "name": "关系数据库标准语言SQL",
                    "children": [
                        {
                            "name": "SQL的概述",
                            "children": [
                                {"name": "SQL的产生", "value": 89},
                                {"name": "SQL的特征", "value": 90},
                                {"name": "SQL的基本概念", "value": 91}
                            ]
                        },
                        {
                            "name": "数据定义",
                            "children": [
                                {
                                    "name": "模式的定义域删除",
                                    "value": 92
                                },
                                {
                                    "name": "基本表的定义,删除与修改",
                                    "children": [
                                        {"name": "定义基本表", "value": 93},
                                        {"name": "数据类型", "value": 94},
                                        {"name": "模式与表", "value": 95},
                                        {"name": "修改基本表", "value": 96},
                                        {"name": "删除基本表", "value": 97},
                                    ]
                                },
                                {"name": "索引的建立,删除与修改", "value": 98},
                                {"name": "数据字典", "value": 99},
                            ]
                        },
                        {
                            "name": "数据查询",
                            "children": [
                                {
                                    "name": "单表查询",
                                    "children": [
                                        {
                                            "name": "选择表中若干列",
                                            "children": [
                                                {"name": "查询指定列", "value": 100},
                                                {"name": "查询全部列", "value": 101},
                                                {"name": "查询经过计算的值", "value": 102},
                                                {"name": "指定别名", "value": 103},
                                            ]
                                        },
                                        {
                                            "name": "选择表中的若干元祖",
                                            "children": [
                                                {"name": "消除取值重复的行", "value": 104},
                                                {
                                                    "name": "查询满足条件的元组",
                                                    "children": [
                                                        {"name": "比较", "value": 105},
                                                        {"name": "确定范围", "value": 106},
                                                        {"name": "确定集合", "value": 107},
                                                        {"name": "字符匹配", "value": 108},
                                                        {"name": "空值", "value": 109},
                                                        {"name": "多重条件", "value": 110},
                                                    ]
                                                }
                                            ]
                                        },
                                        {
                                            "name": "order by字句",
                                            "value": 111
                                        },
                                        {
                                            "name": "聚集函数",
                                            "children": [
                                                {"name": "count(*)", "value": 112},
                                                {"name": "count(<列名>)", "value": 113},
                                                {"name": "sum(<列名>)", "value": 114},
                                                {"name": "avg（<列名>）", "value": 115},
                                                {"name": "max(<列名>)", "value": 116},
                                                {"name": "min(<列名>)", "value": 117}
                                            ]
                                        },
                                        {"name": "group by 字句", "value": 118}
                                    ]
                                },
                                {
                                    "name": "连接查询",
                                    "children":[
                                        {"name": "等值与非等值连接查询", "value":119},
                                        {"name": "自身连接", "value":120},
                                        {"name": "外连接", "value":121},
                                        {"name": "多表连接", "value":122}
                                    ]
                                },
                                {
                                    "name": "嵌套查询",
                                    "children":[
                                        {"name": "带有in谓词的子查询", "value":123},
                                        {"name": "带有比较运算的子查询", "value":124},
                                        {"name": "带有any或all谓词的子查询", "value":125},
                                        {"name": "带有exists谓词的子查询", "value":126}
                                    ]
                                },
                                {
                                    "name": "集合查询",
                                    "children":[
                                        {"name": "并操作union", "value":127},
                                        {"name": "交操作interset", "value":128},
                                        {"name": "差操作", "value":129}
                                    ]
                                },
                                {"name": "基于派生表的查询", "value":130},
                                {"name": "SELECT语句的一般格式", "value":131},
                                {
                                    "name": "视图",
                                    "children":[
                                        {"name": "定义视图", "value":132},
                                        {"name": "查询视图", "value":133},
                                        {"name": "更新视图", "value":134},
                                        {"name": "视图的作用", "value":135}
                                    ]
                                },
                                {"name": "空值的处理","value": 136},
                                {
                                    "name": "集合查询",
                                    "children":[
                                        {"name": "并操作union", "value":137},
                                        {"name": "交操作interset", "value":138},
                                        {"name": "差操作", "value":139}
                                    ]
                                },
                                {
                                    "name": "数据更新",
                                    "children":[
                                        {"name": "插入数据", "value":140},
                                        {"name": "修改数据", "value":141},
                                        {"name": "删除数据", "value":142}
                                    ]
                                },
                            ]
                        }
                    ]
                },
                {
                    "name": "数据库安全性",
                    "children": [
                        {
                            "name": "数据库安全性概述",
                            "children": [
                                {
                                    "name": "数据库的不安全因素",
                                    "children": [
                                        {"name": "非授权用户对数据库的恶意存取和破坏","value":143},
                                        {"name": "数据库中重要的或敏感的数据被泄露","value":144},
                                        {"name": "安全环境的脆弱性","value":145}
                                    ]
                                },
                                {
                                    "name": "安全标准简述",
                                    "children": [
                                        {"name":"验证设计","value":146},
                                        {"name":"安全域","value":147},
                                        {"name":"结构化保护","value":148},
                                        {"name":"标记安全保护","value":149},
                                        {"name":"受控的存取保护","value":150},
                                        {"name":"自主安全保护","value":151},
                                        {"name":"最小保护","value":152}
                                    ]
                                },
                                {
                                    "name":"数据库安全性控制",
                                    "children":[
                                        {
                                            "name":"用户身份鉴别",
                                            "children":[
                                                {"name":"静态口令鉴别","value":153},
                                                {"name":"动态口令鉴别","value":154},
                                                {"name":"生物特征鉴别","value":155},
                                                {"name":"智能卡鉴别","value":156}
                                            ]
                                        },
                                        {
                                            "name":"存取控制",
                                            "children":[
                                                {"name":"定义用户权限","value":157},
                                                {"name":"合法权限检查","value":158}
                                            ]
                                        },
                                        {
                                            "name":"定义授权权限",
                                            "children":[
                                                {"name":"GRANT","value":159},
                                                {"name":"REVOKE","value":160},
                                                {"name":"创建数据库模式权限","value":161}
                                            ]
                                        },
                                        {
                                            "name":"数据库角色",
                                            "children":[
                                                {"name":"角色创建","value":162},
                                                {"name":"角色授权","value":163},
                                                {"name":"将角色授予其他角色或用户","value":164},
                                                {"name":"授权收回","value":165}
                                            ]
                                        }
                                    ]
                                },
                                {"name":"视图机制","value":166},
                                {
                                    "name":"审计",
                                    "children":[
                                        {"name":"审计功能","value":167},
                                        {
                                            "name":"审计事件",
                                            "children":[
                                                {"name":"服务器事件","value":168},
                                                {"name":"系统权限","value":169},
                                                {"name":"语句事件","value":170},
                                                {"name":"模式对象事件","value":171},
                                            ]
                                        },
                                        {
                                            "name":"审计功能",
                                            "children":[
                                                {"name":"提供多种审计盒阅方式","value":172},
                                                {"name":"提供多套审计规则","value":173},
                                                {"name":"提供审计分析和报表功能","value":174},
                                                {"name":"审计日志管理功能","value":175},
                                            ]
                                        },
                                        {"name":"AUTO与INAUTO语句","value":176}
                                    ]
                                },
                                {
                                    "name":"数据加密",
                                    "children":[
                                        {"name":"存储加密","value":177},
                                        {
                                            "name":"传输加密",
                                            "children":[
                                                {"name":"创建可信连接","value":178},
                                                {"name":"确认通信双方的可靠性","value":179},
                                                {"name":"协商加密算法和密钥","value":180},
                                                {"name":"可信数据传输","value":181},
                                                {"name":"关闭可信连接","value":182},
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "name":"其他安全性保护",
                                    "children":[
                                        {"name":"推理控制","value":183},
                                        {"name":"隐藏通道","value":184},
                                        {"name":"数据隐私保护","value":185},
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    "name": "数据库安全性",
                    "children": [
                        {
                            "name":"实体完整性",
                            "children":[
                                {"name":"定义实体完整性","value":186},
                                {"name":"实体完整性检查和违约处理","value":187}
                            ]
                        },
                        {
                            "name":"参照完整性",
                            "children":[
                                {"name":"定义参照完整性","value":188},
                                {"name":"参照完整性检查和违约处理","value":189}
                            ]
                        },
                        {
                            "name":"用户定义完整性",
                            "children":[
                                {"name":"属性上的约束条件","value":190},
                                {"name":"元祖上的约束条件","value":191}
                            ]
                        },
                        {
                            "name":"用户定义完整性约束命名子句",
                            "children":[
                                {"name":"命名子句","value":192},
                                {"name":"修改表中的完整性约束","value":193}
                            ]
                        },
                        {
                            "name":"断言",
                            "children":[
                                {"name":"断言的功能","value":194},
                                {"name":"创建断言的语句格式","value":195},
                                {"name":"创建断言的语句格式","value":196}
                            ]
                        },
                        {
                            "name":"触发器",
                            "children":[
                                {
                                    "name":"定义触发器",
                                    "children":[
                                        {"name":"只有表的拥有者","value":197},
                                        {"name":"触发器名","value":198},
                                        {"name":"表名","value":199},
                                        {"name":"触发事件","value":200},
                                        {"name":"触发器类型","value":201},
                                        {"name":"触发条件","value":202},
                                        {"name":"触发动作","value":203}
                                    ]
                                },
                                {
                                    "name":"激活触发器",
                                    "children":[
                                        {"name":"BEFORE触发器","value":204},
                                        {"name":"激活触发器的SQL语句","value":205},
                                        {"name":"AFTER触发器","value":206}
                                    ]
                                },
                                {"name":"删除触发器","value":207}
                            ]
                        }
                    ]
                }
            ]
        };

        var option = {
            tooltip: {
                trigger: 'item',
                triggerOn: 'mousemove'
            },
            series:[
                {
                    type: 'tree',
                    id: 0,
                    name: 'tree1',
                    data: [data],

                    top: '10%',
                    left: '8%',
                    bottom: '22%',
                    right: '20%',

                    symbolSize: 7,

                    edgeShape: 'polyline',
                    edgeForkPosition: '63%',
                    initialTreeDepth: 3,

                    lineStyle: {
                        width: 2
                    },

                    label: {
                        backgroundColor: '#fff',
                        position: 'left',
                        verticalAlign: 'middle',
                        align: 'right'
                    },

                    leaves: {
                        label: {
                            position: 'right',
                            verticalAlign: 'middle',
                            align: 'left'
                        }
                    },

                    expandAndCollapse: true,
                    animationDuration: 550,
                    animationDurationUpdate: 750
                }
            ]
        };

        knowledgeChart.setOption(option,true);
    </script>
</body>
</html>
