<%@ Page Language="C#" ClassName="PageClass" %>

<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="YesHJ.Class" %>
<%@ Import Namespace="YesHJ" %>
<%@ Register TagPrefix="Class" TagName="HeaderBar" Src="~/classzt/controls/headerBar.ascx" %>
<%@ Register TagPrefix="Class" TagName="Footer" Src="~/classzt/controls/footer_new.ascx" %>
<script runat="server">

</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="上海理工大学，综合英语教室" />
    <meta name="Description" content="上海理工大学综合英语教室" />
    <title>上海理工大学综合英语教室 - 沪江网校</title>
    <link rel="stylesheet" type="text/css" href="http://class.hujiang.com/app/css/base.css" />
    <link rel="stylesheet" type="text/css" href="http://class.hujiang.com/app/css/app.css" />
    <link rel="stylesheet" type="text/css" href="/classzt/css/head.css" />
    <link rel="stylesheet" type="text/css" href="/classzt/css/footer.css" />

    <!--专题的样式表-->
    <link rel="stylesheet" type="text/css" href="/classzt/shanghailigong/css/style.css" />
    <script type="text/javascript" src="http://class.hujiang.com/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
    <!--[if IE 6]>
    <script type="text/javascript" src="js/EvPNG.js"></script>
        <script language="javascript" type="text/javascript">
        EvPNG.fix(".");
    </script>
    <![endif]-->
    <script>
//拖拽层
function Drag()
{
    //初始化
    this.initialize.apply(this, arguments)
}
Drag.prototype = {
    //初始化
    initialize : function (drag, options)
    {
        this.drag = this.$(drag);
        this._x = this._y = 0;
        this._moveDrag = this.bind(this, this.moveDrag);
        this._stopDrag = this.bind(this, this.stopDrag);
        
        this.setOptions(options);
        
        this.handle = this.$(this.options.handle);
        this.maxContainer = this.$(this.options.maxContainer);
        
        this.maxTop = Math.max(this.maxContainer.clientHeight, this.maxContainer.scrollHeight) - this.drag.offsetHeight;
        this.maxLeft = Math.max(this.maxContainer.clientWidth, this.maxContainer.scrollWidth) - this.drag.offsetWidth;
        
        this.limit = this.options.limit;
        this.lockX = this.options.lockX;
        this.lockY = this.options.lockY;
        this.lock = this.options.lock;
        
        this.onStart = this.options.onStart;
        this.onMove = this.options.onMove;
        this.onStop = this.options.onStop;
        
        this.handle.style.cursor = "move";
        
        this.changeLayout();
        
        this.addHandler(this.handle, "mousedown", this.bind(this, this.startDrag))
    },
    changeLayout : function ()
    {
        this.drag.style.top = this.drag.offsetTop + "px";
        this.drag.style.left = this.drag.offsetLeft + "px";
        this.drag.style.position = "absolute";
        this.drag.style.margin = "0"
    },
    startDrag : function (event)
    {       
        var event = event || window.event;
        
        this._x = event.clientX - this.drag.offsetLeft;
        this._y = event.clientY - this.drag.offsetTop;
        
        this.addHandler(document, "mousemove", this._moveDrag);
        this.addHandler(document, "mouseup", this._stopDrag);
        
        event.preventDefault && event.preventDefault();
        this.handle.setCapture && this.handle.setCapture();
        
        this.onStart()
    },
    moveDrag : function (event)
    {
        var event = event || window.event;
        
        var iTop = event.clientY - this._y;
        var iLeft = event.clientX - this._x;
        
        if (this.lock) return;
        
        this.limit && (iTop < 0 && (iTop = 0), iLeft < 0 && (iLeft = 0), iTop > this.maxTop && (iTop = this.maxTop), iLeft > this.maxLeft && (iLeft = this.maxLeft));
        
        this.lockY || (this.drag.style.top = iTop + "px");
        this.lockX || (this.drag.style.left = iLeft + "px");
        
        event.preventDefault && event.preventDefault();
        
        this.onMove()
    },
    stopDrag : function ()
    {
        this.removeHandler(document, "mousemove", this._moveDrag);
        this.removeHandler(document, "mouseup", this._stopDrag);
        
        this.handle.releaseCapture && this.handle.releaseCapture();
        
        this.onStop()
    },
    //参数设置
    setOptions : function (options)
    {
        this.options =
        {
            handle:         this.drag, //事件对象
            limit:          true, //锁定范围
            lock:           false, //锁定位置
            lockX:          false, //锁定水平位置
            lockY:          false, //锁定垂直位置
            maxContainer:   document.documentElement || document.body, //指定限制容器
            onStart:        function () {}, //开始时回调函数
            onMove:         function () {}, //拖拽时回调函数
            onStop:         function () {}  //停止时回调函数
        };
        for (var p in options) this.options[p] = options[p]
    },
    //获取id
    $ : function (id)
    {
        return typeof id === "string" ? document.getElementById(id) : id
    },
    //添加绑定事件
    addHandler : function (oElement, sEventType, fnHandler)
    {
        return oElement.addEventListener ? oElement.addEventListener(sEventType, fnHandler, false) : oElement.attachEvent("on" + sEventType, fnHandler)
    },
    //删除绑定事件
    removeHandler : function (oElement, sEventType, fnHandler)
    {
        return oElement.removeEventListener ? oElement.removeEventListener(sEventType, fnHandler, false) : oElement.detachEvent("on" + sEventType, fnHandler)
    },
    //绑定事件到对象
    bind : function (object, fnHandler)
    {
        return function ()
        {
            return fnHandler.apply(object, arguments)   
        }
    }
};


$(document).on("click","#closeLayer",function(){
    $("#flashlayer").hide();
    $("#layer_cont").html("");
});
$(document).on("click","#openLayer",function(){
    if($("#layer_cont").html() ==""){
        $("#layer_cont").html('<iframe width="100%" scrolling="no" height="100%" frameborder="0" src="http://union.bokecc.com/flash/single/DA133C6A3C82A26F_A1097D9D1C0480B19C33DC5901307461_true_3456E50C88E7C184_1/player.swf"></iframe>');
        $("#flashlayer").css({top:($(window).height() - 600)/2 + 36 + $(document).scrollTop(),left:($(window).width() - 800)/2}).show();
    }
});


    $(function(){
        //flash
        var oDrag = new Drag($("#flashlayer")[0], {handle:$("#layer_title")[0], limit:false});

        //轮播课程
        $("#course_list").bxSlider({
                auto: true,
                pause: 3000,
                autoHover: true,
                prevSelector: $("#prev"),
                nextSelector: $("#next"),
                prevText: "",
                nextText: "" 
        });

    });
    </script>
</head>
<body>
    <class:HeaderBar ID="headerBar" runat="server" />
    <!-- header Start -->
    <div id="header">
    </div>
    <!-- header End -->

    <!-- wrapper Start -->
    <div id="wrapper">

<div id="banner">
    <div id="banner_cont">
        <div class="university_logo"></div>
        <div class="title_block">
            <a class="enter_class" href="http://class.hujiang.com/136952/" target="_blank" title="进入班级"></a>
            <br />
            <a href="http://class.hujiang.com/136952/topic" target="_blank">讨论区 Study Forum</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="ctim://sendmsg/?&roomid=284304">语音教室 Voice Classroom</a><!-- <span>语音教室 Voice Classroom</span> -->
        </div>
    </div>
</div>
<div id="pageCont">
    <div id="wangxiao" class="block">
        <div class="block_title">我们的网校</div>
        <div class="block_cont">
            <img class="wangxiao_desc" src="/classzt/shanghailigong/images/description.png" />
            <div class="wangxiao_video">
                <img src="/classzt/shanghailigong/images/video.png" />
                <a id="openLayer" href="javascript:void(0)"></a>
            </div>
        </div>
    </div>
    <div id="study_tool" class="block">
        <div class="block_title">学习工具</div>
        <div class="block_cont">
            <ul class="study_tools">
                <li>
                    <a href="http://ting.hujiang.com/" target="_blank"><img src="/classzt/shanghailigong/images/tingxieku.png" /></a>
                    <p class="description">多语种尽收耳边，<br />听写就是这么简单</P>
                </li>
                <li>
                    <a href="http://bulo.hujiang.com/app/day/sentence_en/" target="_blank"><img src="/classzt/shanghailigong/images/tiantian.png" /></a>
                    <p class="description">每天一点，天天沪江</P>
                </li>
                <li>
                    <a href="http://dict.hujiang.com/" target="_blank"><img src="/classzt/shanghailigong/images/xiaod.png" /></a>
                    <p class="description">小D在手，单词无忧</P>
                </li>
                <li>
                    <a href="http://class.hujiang.com/gongkaike/" target="_blank"><img src="/classzt/shanghailigong/images/gongkaike.png" /></a>
                    <p class="description">登录CCTALK<br />倾听名师传道</P>
                </li>
            </ul>
        </div>
    </div>
    <div id="app" class="block">
        <div class="block_title">
            缤纷应用
            <div class="more"><a href="http://class.hujiang.com/app/list" target="_blank">沪江应用大全>></a></div>
        </div>
        <div class="block_cont">
            <ul class="study_app">
                <li>
                    <a href="http://class.hujiang.com/app/mobile/" target="_blank"><img src="/classzt/shanghailigong/images/wangxiao.png" /></a>
                    <p class="description">沪江网校</P>
                </li>
                <li>
                    <a href="http://cichang.hujiang.com/" target="_blank"><img src="/classzt/shanghailigong/images/cichang.png" /></a>
                    <p class="description">开心词场</P>
                </li>
                <li>
                    <a href="http://www.hujiang.com/app/#app_sp_test" target="_blank"><img src="/classzt/shanghailigong/images/meiriyishuo.png" /></a>
                    <p class="description">每日一说</P>
                </li>
                <li>
                    <a href="http://www.hujiang.com/app/#app_tingshuodu_1" target="_blank"><img src="/classzt/shanghailigong/images/english.png" /></a>
                    <p class="description">沪江英语</P>
                </li>
            </ul>
        </div>
    </div>
    <div id="nice_course" class="block">
        <div class="block_title">
            精品课程
            <div class="more"><a href="http://class.hujiang.com/course" target="_blank">更多课程前往选课中心>></a></div>
        </div>
        <div class="block_cont">
            <div class="view_box">
                <ul id="course_list" class="course">
                <li>
                    <div class="item">
                        <div class="item_cont">
                        <div class="info_image">
                            <a href="http://class.hujiang.com/course/23661" target="_blank"><img src="http://f1.c.hjfile.cn/lesson/intro/lesson/cover/BEC_zj_new.png" /></a>
                        </div>
                        <div class="info_text">
                            <a class="course_title" href="http://class.hujiang.com/course/23661" target="_blank">BEC商务英语中级【随到随学班】</a>
                            <span class="course_price">504学币</span>
                            <a class="btn_baoban" href="http://class.hujiang.com/course/23661" target="_blank"></a>
                        </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item_cont">
                        <div class="info_image">
                            <a href="http://class.hujiang.com/course/42966" target="_blank"><img src="http://f1.c.hjfile.cn/lesson/intro/lesson/cover/lang_en_beczgj.png" /></a>
                        </div>
                        <div class="info_text">
                            <a class="course_title" href="http://class.hujiang.com/course/42966" target="_blank">BEC商务英语中高级【9月通关班】</a>
                            <span class="course_price">738学币</span>
                            <a class="btn_baoban" href="http://class.hujiang.com/course/42966" target="_blank"></a>
                        </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item_cont">
                        <div class="info_image">
                            <a href="http://class.hujiang.com/course/31383" target="_blank"><img src="http://f1.c.hjfile.cn/lesson/intro/lesson/cover/en-IELTS65.png" /></a>
                        </div>
                        <div class="info_text">
                            <a class="course_title" href="http://class.hujiang.com/course/31383" target="_blank">大学水平直达雅思6.5【随到随学班】</a>
                            <span class="course_price">935学币</span>
                            <a class="btn_baoban" href="http://class.hujiang.com/course/31383" target="_blank"></a>
                        </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item_cont">
                        <div class="info_image">
                            <a href="http://class.hujiang.com/course/39996" target="_blank"><img src="http://f1.c.hjfile.cn/lesson/intro/lesson/cover/jp_0-N2_tg.png" /></a>
                        </div>
                        <div class="info_text">
                            <a class="course_title" href="http://class.hujiang.com/course/39996" target="_blank">新版日语入门至中级【0-N2名师暑期长期通关班】</a>
                            <span class="course_price">1410学币</span>
                            <a class="btn_baoban" href="http://class.hujiang.com/course/39996" target="_blank"></a>
                        </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item">
                        <div class="item_cont">
                        <div class="info_image">
                            <a href="http://class.hujiang.com/course/22770" target="_blank"><img src="http://f1.c.hjfile.cn/lesson/intro/lesson/cover/fr_dx0-4.png" /></a>
                        </div>
                        <div class="info_text">
                            <a class="course_title" href="http://class.hujiang.com/course/22770" target="_blank">法语零基础直达大学四级【全程暑期通关班】</a>
                            <span class="course_price">948学币</span>
                            <a class="btn_baoban" href="http://class.hujiang.com/course/22770" target="_blank"></a>
                        </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item_cont">
                        <div class="info_image">
                            <a href="http://class.hujiang.com/course/33264" target="_blank"><img src="http://f1.c.hjfile.cn/lesson/intro/201307/b691c4ee-8e06-4b0a-9d4e-ee13e4c67a14.png" /></a>
                        </div>
                        <div class="info_text">
                            <a class="course_title" href="http://class.hujiang.com/course/33264" target="_blank">思维导图精品入门【9月班】</a>
                            <span class="course_price">315学币</span>
                            <a class="btn_baoban" href="http://class.hujiang.com/course/33264" target="_blank"></a>
                        </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item_cont">
                        <div class="info_image">
                            <a href="http://class.hujiang.com/course/33462" target="_blank"><img src="http://f1.c.hjfile.cn/lesson/intro/lesson/cover/zc_sjgl.png" /></a>
                        </div>
                        <div class="info_text">
                            <a class="course_title" href="http://class.hujiang.com/course/33462" target="_blank">时间管理-高效能工作密码【8月班】</a>
                            <span class="course_price">230学币</span>
                            <a class="btn_baoban" href="http://class.hujiang.com/course/33462" target="_blank"></a>
                        </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item_cont">
                        <div class="info_image">
                            <a href="http://class.hujiang.com/course/34749" target="_blank"><img src="http://f1.c.hjfile.cn/lesson/intro/201308/a5c9f476-a4bb-4c5c-a3f4-103c2b889525.png" /></a>
                        </div>
                        <div class="info_text">
                            <a class="course_title" href="http://class.hujiang.com/course/34749" target="_blank">夏威夷小吉他Ukulele入门【暑期通关班】</a>
                            <span class="course_price">320学币</span>
                            <a class="btn_baoban" href="http://class.hujiang.com/course/34749" target="_blank"></a>
                        </div>
                        </div>
                    </div>
                </li>
                </ul>
            </div>
            <div id="prev" class="btn_prev" href="javascript:void(0);"></div>
            <div id="next" class="btn_next" href="javascript:void(0);"></div>
        </div>
    </div>
</div>

    </div>
    <!-- wrapper End -->

    <!-- footer Start -->
    <class:Footer ID="footer" runat="server" />
    <!-- footer End -->
<div id="flashlayer" style="display:none;"><div id="layer_title"><a id="closeLayer" href="javascript:void(0)"></a></div><div id="layer_cont"></div></div>
</body>
<script type="text/javascript" src="/classzt/js/head.js"></script>
<script type="text/javascript" src="/classzt/js/gotop.js"></script>
<script type="text/javascript" src="http://class.hujiang.com/js/base.js"></script>
<!--客服咨询-->
<script type="text/javascript" src="http://class.hujiang.com/js/kf.js"> </script>



<!-- 统计代码在这里 -->
<script type="text/javascript" src="http://common.hjfile.cn/analytics/hotlink/hotlink.js"></script>
<script type="text/javascript" src="http://common.hjfile.cn/analytics/site/hujiang.js"></script>
<script type="text/javascript" src="/classzt/js/webclick.js"></script>
<script type="text/javascript">
    $(function () {
        setWebClick("shanghailigong");
    });
</script>
</html>
