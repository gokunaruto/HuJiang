<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="classzt_liuxue_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>出国留学考试_留学考试培训_免费出国留学课程_沪江留学体验班-沪江网校</title>
    <meta name="Keywords" content="留学考试,留学英语培训,出国留学课程,免费课程" />
    <meta name="Description" content="沪江留学团队为您提供优质留学考试培训（包括留学英语和留学日语培训）、最新留学资讯（如出国留学的条件、出国移民的条件、出国留学流程、如何做留学准备等），提供免费的高品质出国留学体验课程，是国内最专业的出国留学培训机构和留学资讯平台。" />
    <link rel="stylesheet" type="text/css" href="http://class.hujiang.com/app/css/base.css" />
    <link rel="stylesheet" type="text/css" href="http://class.hujiang.com/app/css/app.css" />
    <link rel="stylesheet" type="text/css" href="/classzt/css/head.css" />
    <link rel="stylesheet" type="text/css" href="/classzt/css/footer.css" />

    <link rel="stylesheet" type="text/css" href="/classzt/liuxue/css/basic.css" />
    <link rel="stylesheet" type="text/css" href="/classzt/liuxue/css/liuxue_reg.css?v=2" />

    <script type="text/javascript" src="http://class.hujiang.com/js/jquery-1.7.2.min.js"></script>
</head>
<body>
    <class:HeaderBar runat="server" />
    <div class="head_set">
        <div class="container" style="height: 50px; position: absolute; left: 50%; top: 0px; margin-left: -500px">
            <div style="right: 25px; top: 77px; position: absolute; z-index: 999">
                <img src="/classzt/liuxue/images/reg.png">
                <%if (userID <= 0)
                  { %>
                <a href="javascript:" onclick="showReg();return false;" style="position: absolute; left: 65px; top: 307px">
                    <img src="/classzt/liuxue/images/get-btn.png" /></a>
                <%}
                  else
                  {
                      if (hasGot)
                      { %>
                <a href="javascript:" style="cursor: default; position: absolute; left: 65px; top: 307px">
                    <img src="/classzt/liuxue/images/got-btn.png" /></a>
                <%}
                      else
                      {%>
                <a href="javascript:" onclick="showGet();return false;" style="position: absolute; left: 65px; top: 307px">
                    <img src="/classzt/liuxue/images/get-btn.png" /></a>
                <%}
                  }%>
            </div>

        </div>
        <div id="js_banner" class="fx_banner">


            <ul id="js_banner_img" class="fx_banner_img cf">
                <li style="background: #179e80">
                    <div class="fx_banner_inner fx_grid_c1">
                        <div class="child child0" data-z="1">
                        </div>
                        <div class="child" data-z="2" style="left: 22px; top: -70px;">
                            <img src="/classzt/liuxue/images/slider_1_1.png">
                        </div>
                        <div class="child" data-z="3" style="left: 107px; top: 85px;">
                            <img src="/classzt/liuxue/images/slider_1_2.png">
                        </div>

                    </div>
                </li>
                <li style="background: #3194d5">
                    <div class="fx_banner_inner fx_grid_c1">
                        <div class="child child0" data-z="1">
                        </div>
                        <div class="child" data-z="2" style="left: 0; top: 22px;">
                            <img src="/classzt/liuxue/images/slider_2_1.png">
                        </div>
                        <div class="child" data-z="3" style="left: 48px; top: 68px;">
                            <img src="/classzt/liuxue/images/slider_2_2.png">
                        </div>

                    </div>
                </li>
                <li style="background: #5d569a">
                    <div class="fx_banner_inner fx_grid_c1">
                        <div class="child child0" data-z="1">
                        </div>
                        <div class="child" data-z="2" style="left: 0; top: 80px;">
                            <img src="/classzt/liuxue/images/slider_3_1.png">
                        </div>
                        <div class="child" data-z="3" style="left: 52px; top: 62px;">
                            <img src="/classzt/liuxue/images/slider_3_2.png">
                        </div>

                    </div>
                </li>
            </ul>
        </div>
        <!-- js_banner -->
    </div>
    <div class="container wraper-mt">
        <div class="block road1 ">
            <img data-src="/classzt/liuxue/images/road1.png" class="road" src="/classzt/liuxue/images/loader.png">
            <img data-src="/classzt/liuxue/images/boshi.png" class="boshi" src="/classzt/liuxue/images/loader.png">
            <img data-src="/classzt/liuxue/images/yun.png" class="yun" src="/classzt/liuxue/images/loader.png">
            <img data-src="/classzt/liuxue/images/book.png" class="book" src="/classzt/liuxue/images/loader.png">
            <div class="node node1">
                <a href="javascript:">水平测试</a><div class="hover node-hover1"></div>
            </div>
            <div class="node node2"><a href="javascript:">精品课程</a></div>
        </div>
        <div class="block road2 ">
            <img data-src="/classzt/liuxue/images/road2.png" class="road" src="/classzt/liuxue/images/loader.png">
            <div class="class-box clearfix">
                <img data-src="/classzt/liuxue/images/border-t.png" alt="" class="bordert border">
                <img data-src="/classzt/liuxue/images/border-r.png" alt="" class="borderr border">
                <img data-src="/classzt/liuxue/images/border-b.png" alt="" class="borderb border">
                <img data-src="/classzt/liuxue/images/border-l.png" alt="" class="borderl border">
                <div class="_class img">
                    <a href="javascript:">
                        <img data-src="/classzt/liuxue/images/tuofu.png" src="/classzt/liuxue/images/loader.png"></a>
                </div>
                <div class="_class img">
                    <a href="javascript:">
                        <img data-src="/classzt/liuxue/images/gre.png" src="/classzt/liuxue/images/loader.png"></a>
                </div>
                <div class="_class img">
                    <a href="javascript:">
                        <img data-src="/classzt/liuxue/images/yasi.png" src="/classzt/liuxue/images/loader.png"></a>
                </div>
            </div>
        </div>
        <div class="block road3">
            <img data-src="/classzt/liuxue/images/road3.png" class="road" src="/classzt/liuxue/images/loader.png">
            <div class="node node3">
                <a class="three" href="#">背单词</a><div class="hover node-hover2"></div>
            </div>
            <div class="node node4">
                <a class="three" href="#">练听力</a><div class="hover node-hover3"></div>
            </div>
            <div class="node node5">
                <a class="three" href="#">提问题</a><div class="hover node-hover-que">
                    <img src="/classzt/liuxue/images/hover-que.png" alt="">
                </div>
            </div>
        </div>
        <div class="block road4">
            <img data-src="/classzt/liuxue/images/road4.png" class="road" src="/classzt/liuxue/images/loader.png">
            <div class="node node6"><a href="javascript:">名师互动</a></div>
            <div class="tea-box clearfix">
                <div class="teacher">
                    <a href="javascript:" class="img">
                        <img data-src="/classzt/liuxue/images/xiaoP.png" src="/classzt/liuxue/images/loader.png"></a><a class="name" href="javascript:">Echo&nbsp;&nbsp;老师</a>
                </div>
                <div class="teacher">
                    <a href="javascript:" class="img">
                        <img data-src="/classzt/liuxue/images/xiaoai.png" src="/classzt/liuxue/images/loader.png"></a><a class="name" href="javascript:">Eileen&nbsp;&nbsp;老师</a>
                </div>
                <div class="teacher">
                    <a href="javascript:" class="img">
                        <img data-src="/classzt/liuxue/images/jiangjiang.png" src="/classzt/liuxue/images/loader.png"></a><a class="name" href="javascript:">Jacky&nbsp;&nbsp;老师</a>
                </div>
                <div class="teacher">
                    <a href="javascript:" class="img">
                        <img data-src="/classzt/liuxue/images/xiongshu.png" src="/classzt/liuxue/images/loader.png"></a><a class="name" href="javascript:">Lee&nbsp;&nbsp;老师</a>
                </div>
                <div class="teacher">
                    <a href="javascript:" class="img">
                        <img data-src="/classzt/liuxue/images/ruhua.png" src="/classzt/liuxue/images/loader.png"></a><a class="name" href="javascript:">Rachel&nbsp;&nbsp;老师</a>


                </div>
            </div>
        </div>
        <div class="block road5 ">
            <div class="node node7"><a class="three" href="#">公开课</a></div>
            <div class="node node8">
                <a href="javascript:">作文批改</a><div class="hover node-hover-zuowen">
                    <img src="/classzt/liuxue/images/hover-zuowen.png" alt="">
                </div>
            </div>
            <img data-src="/classzt/liuxue/images/road5.png" class="road" src="/classzt/liuxue/images/loader.png">
        </div>
        <div class="block road6 ">
            <img data-src="/classzt/liuxue/images/road6.png" class="road" src="/classzt/liuxue/images/loader.png">
            <div class="club-box clearfix img">
                <img data-src="/classzt/liuxue/images/club.png" src="/classzt/liuxue/images/loader.png">
            </div>
        </div>
        <div class="block road7">
            <img data-src="/classzt/liuxue/images/road7.png" class="road" src="/classzt/liuxue/images/loader.png">
            <div class="node node9">
                <a href="javascript:">留学指南</a><div class="hover node-hover-liuxue">
                    <img src="/classzt/liuxue/images/hover-liuxue.png" alt="">
                </div>
            </div>
            <div class="node node10">
                <a href="javascript:">全真模考</a><div class="hover node-hover-kao">
                    <img src="/classzt/liuxue/images/hover-kao.png" alt="">
                </div>
            </div>
            <img data-src="/classzt/liuxue/images/boshi2.png" class="boshi2">
        </div>
        <div class="xueyuan clearfix">
            <div class="xinde">
                <img data-src="/classzt/liuxue/images/xinde.png" class="_xinde" src="/classzt/liuxue/images/loader.png">
                <ul class="xinde-box">
                    <li class="xinde-detail">
                        <div class="u-info clearfix">
                            <p class="u-pho img">
                                <img data-src="/classzt/liuxue/images/gezi.jpg" alt="" class="pho">
                            </p>
                            <p class="u-name">
                                <span class="name">清风雨鸽</span>
                                <span class="_cla">雅思写作7分速成【暑期通关班】</span>
                            </p>
                        </div>
                        <div class="u-xinde">
                            <span class="org_bot_cor"></span>
                            这段时间收获很大。感觉自己的写作水平提升了一个层次。以前写250个词像要了命一样 好不容易写到了，写的也是
不知所云及各种错误。现在写250 个词基本没什么大问题 ，脑海中有了一个较为清晰的写作体系。
                        </div>
                    </li>
                    <li class="xinde-detail">
                        <div class="u-info clearfix">
                            <p class="u-pho img">
                                <img data-src="/classzt/liuxue/images/cat.jpg" alt="" class="pho">
                            </p>
                            <p class="u-name">
                                <span class="name">爱小豹的猫 </span>
                                <span class="_cla">雅思写作7分速成【暑期通关班】</span>
                            </p>
                        </div>
                        <div class="u-xinde">
                            <span class="org_bot_cor"></span>
                            这是我第一次参加网校的课程，整个过程都很开心，老师都很负责很认真，深受感动。通过这次学习我对雅思大小作文写作都有了具体的概念，几次练习中也基本形成了套路，感谢Echo老师、小艾老师以及所有帮助过我的老师们~
                        </div>
                    </li>
                    <li class="xinde-detail">
                        <div class="u-info clearfix">
                            <p class="u-pho img">
                                <img data-src="/classzt/liuxue/images/jiaqi800.jpg" alt="" class="pho">
                            </p>
                            <p class="u-name">
                                <span class="name">jiaqi800 </span>
                                <span class="_cla">【新版】雅思6.5分--学术类【4月通关班】</span>
                            </p>
                        </div>
                        <div class="u-xinde">
                            <span class="org_bot_cor"></span>
                            三月份的时候报的这个班，可惜还没等四月开课我就开始养伤，一直到暑假才开始上课，又急急忙忙地去考试。虽然最后成绩不是很理想，但是课程 对我的帮助还是很大的。
                        </div>
                    </li>
                </ul>
            </div>
            <div class="highscore">
                <img data-src="/classzt/liuxue/images/gaofen.png" class="gaofen" src="/classzt/liuxue/images/loader.png">
                <div class="score-list-banner">
                    <ul>
                        <li class="banner-box">
                            <ul class="scorelist">
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head1.png" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">Retarded321</span>
                                            <span class="_cla">零基础直达雅思6.5分</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/ya-score-8.png" class="ya-score-8 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head2.png" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">喵喵妖妖770</span>
                                            <span class="_cla">零基础直达雅思6.5分</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/ya-score-8.png" class="ya-score-8 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head3.png" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">可疑红晕</span>
                                            <span class="_cla">零基础直达雅思6.5分</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/ya-score-8.png" class="ya-score-8 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head4.png" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">Monica0718</span>
                                            <span class="_cla">【新版】雅思6.5分--学术类</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/ya-75.png" class="ya-score-7 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head5.png" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">Somnuslj</span>
                                            <span class="_cla">【新版】雅思6.5分--学术类</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/ya-7.png" class="ya-score-7 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head6.png" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">Hiwactb</span>
                                            <span class="_cla">【新版】雅思6.5分--学术类</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/ya-7.png" class="ya-score-7 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                            </ul>
                            <div class="dot-box"></div>
                        </li>
                        <li class="banner-box">
                            <ul class="scorelist">
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head7.jpg" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">沈夕颜</span>
                                            <span class="_cla">新托福保90冲100+【签约保过班】</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/tuo112.png" class="ya-score-7 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head8.jpg" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">卍解奥巴马</span>
                                            <span class="_cla">新托福保90冲100+【签约保过班】</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/tuo111.png" class="ya-score-7 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head9.jpg" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">煎饼果子来两套</span>
                                            <span class="_cla">新托福保90冲100+【签约保过班】</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/tuo108.png" class="ya-score-7 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head10.jpg" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">阿拉马德里</span>
                                            <span class="_cla">新托福100强化【10月通关班】</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/tuo101.png" class="ya-score-7 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head11.jpg" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">mumuzhi03</span>
                                            <span class="_cla">新托福100强化【10月通关班】</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/tuo96.png" class="ya-score-7 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                                <li class="user">
                                    <div class="u-info clearfix">
                                        <p class="u-pho img">
                                            <img data-src="/classzt/liuxue/images/head12.jpg" alt="" class="pho">
                                        </p>
                                        <p class="u-name">
                                            <span class="name">blackeye828</span>
                                            <span class="_cla">新托福保90冲100+【签约保过班】</span>
                                        </p>
                                        <img data-src="/classzt/liuxue/images/tuo96.png" class="ya-score-7 score" src="/classzt/liuxue/images/loader.png">
                                    </div>
                                </li>
                            </ul>
                            <div class="dot-box"></div>
                        </li>
                    </ul>

                </div>


            </div>
        </div>
    </div>

    <div id="reg-model" class="reg-model hide">
        <div class="model-content">
            <div class="model-til">
                注册沪江网校
            </div>
            <form action="">
                <div class="model-form">
                    <div class="uname h8">
                        <input type="text" placeholder="用户名">
                    </div>
                    <div class="upass">
                        <input type="password" placeholder="密码">
                        <div class="strong">
                            <label for="">密码强度：</label>
                            <p class="line"></p>
                        </div>
                    </div>
                    <div class="upass-re h8">
                        <input type="password" placeholder="确认密码">
                    </div>
                    <div class="rel-name h8">
                        <input type="text" placeholder="真实姓名">
                    </div>
                    <div class="email h8">
                        <input type="email" placeholder="邮箱">
                    </div>

                    <a href="javascript:" class="reg-btn">注册</a>
                    <a href="javascript:" class="reg-info">立即注册即同意沪江网的《用户协议》</a>
                </div>
            </form>
        </div>
        <div class="reg-model-overly">
        </div>
    </div>
    <div id="gift-model" class="reg-model hide">
        <div class="model-content">
            <div class="model-til">
                领取留学大礼包
            </div>
            <form action="">
                <div class="model-form model-form-phone">
                    <p class="phone-til">
                        请留下您的手机号码
                    </p>
                    <div class="phone h8">
                        <input type="text" placeholder="手机">
                    </div>
                    <a href="javascript:" class="reg-btn active">领取</a>
                </div>
            </form>
        </div>
        <div class="reg-model-overly">
        </div>
    </div>

    <div id="div_reg_modal" class="hide" style="background: #fff; width: 780px; height: 540px; border-radius: 4px;">
        <div class="model-til" id="modal_title">
            注册沪江网校
        </div>
        <iframe id="iframe" width="780" height="520" frameborder="no" scrolling="no"></iframe>
    </div>

    <class:Footer_new runat="server" />
    <script type="text/javascript" src="/classzt/js/head.js"></script>
    <script type="text/javascript" src="/classzt/js/gotop.js"></script>
    <script type="text/javascript" src="/classzt/js/jquery.simplemodal.1.4.4.min.js"></script>
    <script type="text/javascript" src="http://class.hujiang.com/js/base.js"></script>
    <script type="text/javascript" src="/classzt/liuxue/js/tab.js"></script>
    <script type="text/javascript" src="/classzt/liuxue/js/liuxue_reg.js"></script>
    <script type="text/javascript" src="/classzt/liuxue/js/unslider.min.js"></script>
    <script type="text/javascript" src="/classzt/liuxue/js/jquery.unveil.min.js"></script>
    <script type='text/javascript'>
        var giftUrl = "/classzt/liuxue/getgift.aspx";
        var regUrl = "/classzt/iframe/signup.aspx";
        var tjUrl = "/classzt/liuxue/tj.ashx";
        $(function () {
            $('img').unveil();
            $('.score-list-banner').unslider({ dots: true });
            $('.node').hover(function () {
                $(this).children('.hover').show();
            }, function () {
                $(this).children('.hover').hide();
            });
        });

        function showReg() {
            $("#div_reg_modal iframe").attr("src", regUrl);
            $("#div_reg_modal").modal({ opacity: 40 });
            $.get(tjUrl, { source: "pop" });
        }

        function showGet() {
            $("#modal_title").html("领取留学大礼包");
            $("#div_reg_modal iframe").attr("src", giftUrl);
            $("#div_reg_modal").modal({ opacity: 40 });
        }

    </script>

    <!--客服咨询-->
    <script type="text/javascript" src="/classzt/js/kf.js"></script>
    <!-- 分享代码-->
    <script type="text/javascript" src="/classzt/js/bd_share_v2.js"> </script>
    <script type="text/jscript">
        var bd_share_config = { 'userid': '<%=userID %>', 'text': '#话题#内容', 'pic': '/classzt/2014kaixue/images/share.jpg' };
    </script>
    <!-- 统计代码在这里 -->
    <script type="text/javascript" src="http://common.hjfile.cn/analytics/hotlink/hotlink.js"></script>
    <script type="text/javascript" src="http://common.hjfile.cn/analytics/site/hujiang.js"></script>
</body>
</html>
