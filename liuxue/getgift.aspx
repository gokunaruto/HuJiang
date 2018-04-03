<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getgift.aspx.cs" Inherits="classzt_liuxue_getgift" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>领取留学大礼包</title>
    <link rel="stylesheet" type="text/css" href="/classzt/liuxue/css/basic.css" />
    <link rel="stylesheet" type="text/css" href="/classzt/liuxue/css/liuxue_reg.css" />
    <script type="text/javascript" src="/classzt/js/jquery-1.7.2.min.js"></script>
    <style type="text/css">
        body {
            background: #fff;
        }

        .hide {
            display: none;
        }

        #t_valid_code {
            width: 124px;
        }

        #btn_send_code {
            color: #888888;
        }

        #msg, #msg2 {
            color: #f00;
            display: block;
            margin-top: 5px;
            font-size: 12px;
        }

        #div_before {
            font-size: 14px;
        }

        #gift_class:hover {
            text-decoration: underline;
        }

        #getgit_slider {
            position: relative;
            width: 780px;
            height: 515px;
        }

        .getgit_slider_wrap {
            position: absolute;
            width: 780px;
            height: 515px;
            overflow: hidden;
        }

            .getgit_slider_wrap .getgit_img {
                position: absolute;
            }

                .getgit_slider_wrap .getgit_img img {
                    width: 780px;
                    height: 515px;
                }

            .getgit_slider_wrap .last_getgift .feel_right_now {
                position: absolute;
                top: 40px;
                right: 136px;
                font: 40px "microsoft yahei";
                color: #FF874B;
            }

            .getgit_slider_wrap .last_getgift h3 {
                position: absolute;
                top: 0;
                right: 0;
                width: 100%;
            }
        /*.getgit_slider_wrap .last_getgift img{*/
        /*width: 200px;*/
        /*height: 100px;*/
        /*}*/
        #getgit_slider .pagenation {
            position: absolute;
            top: 470px;
            left: 50%;
            margin-left: -80px;
            z-index: 10;
        }

            #getgit_slider .pagenation span {
                display: inline-block;
                width: 16px;
                height: 16px;
                margin-right: 10px;
                text-indent: -99999px;
                background: url(/classzt/liuxue/images/getgit_icon.png) -11px -9px no-repeat;
            }

                #getgit_slider .pagenation span.current_page {
                    background-position: -46px -10px;
                }

        .getgit_next {
            position: absolute;
            top: 445px;
            right: 30px;
            display: block;
            width: 138px;
            height: 60px;
            font: 20px/50px "microsoft yahei";
            color: #fff;
            text-align: center;
            background: url(/classzt/liuxue/images/getgit_icon.png) -7px -37px no-repeat;
            z-index: 10;
        }

            .getgit_next:hover {
                opacity: 0.8;
                filter: alpha(opacity:80%);
            }

        .lightpop {
            position: absolute;
            top: 430px;
            left: 20px;
            width: 70px;
            height: 80px;
            background: url(/classzt/liuxue/images/getgit_icon.png) 0px -95px no-repeat;
        }
		.q_title { font-size:16px; color:#999999; 		
		
		}
    </style>
</head>
<body>
    <form>
	<div id="qusetion">
		<div class="q_title">完成3个小问题，免费开通留学预备班!</div>
		
	
	</div>
        <div id="div_before" class="<%=hasGot?"hide":"" %>">
            <div class="model-form model-form-phone" style="width: 420px;">
                <%-- 没有绑定的用户需要手机号 --%>
                <div id="need_bind" class="<%=isPhoneBinded?"hide":"" %>">
                    <p class="phone-til">
                        请留下您的手机号码
                    </p>
                    <div class="phone" style="margin-bottom: 60px">
                        <div class="clearfix" style="height: 50px">
                            <div style="float: left">
                                <input type="text" id="t_phone" placeholder="输入手机号码" />
                                <span id="msg"></span>
                            </div>
                            <a href="javascript:" id="btn_send_code" onClick="sendCode();return false;" style="width: 100px; height: 30px; text-align: center; line-height: 30px; float: left; color: #fff; background: #ff874b; margin-left: 20px">获取验证码</a>
                        </div>
                        <div class="clearfix" style="margin-top: 20px">
                            <p class="phone-til">
                                请输入手机短信验证码
                            </p>
                            <input type="text" id="t_valid_code" /><span id="msg2"></span>
                        </div>
                    </div>

                </div>
                <a href="javascript:" class="reg-btn active" style="margin: 0px auto" id="btn_get" onClick="getGift();return false;">领取</a>
            </div>
        </div>
        <div id="div_after" class="<%=hasGot?"":"hide" %>">
            <!-- <a class="img"style="display:block;margin:40px auto"href="http://class.hujiang.com/<%=classID %>/share"><img src="/classzt/liuxue/images/light_box.png"></a>
                    <a id="gift_class" href="http://class.hujiang.com/<%=classID %>/share" target="_blank"style="margin: 20px auto 0px auto;width: 150px;display: block;color: #3D3D3D;">进入班级查看礼包</a> -->
            <div id="getgit_slider">
                <div class="getgit_slider_wrap">
                    <div class="getgit_img">
                        <img src="images/getgit_0.jpg" alt="" />
                    </div>
                
                    <div class="getgit_img hide last_getgift">
                        <!-- <h3>领取留学大礼包</h3> -->
                        <div class="feel_right_now">立刻感受线上班级新体验！</div>
                        <img src="/classzt/liuxue/images/getgit05.png" alt="">
                    </div>
                </div>
                <div class="pagenation">
                    <span class="current_page">page1</span>
                    <span>page2</span>
              
                </div>
                <div class="lightpop"></div>
                <a class="getgit_next" href="javascript:;">下一步</a>
            </div>
        </div>
    </form>
    <input type="hidden" id="hidden_isbinded" value="<%=isPhoneBinded ? 1 : 0 %>" />
    <script type="text/javascript" src="/classzt/js/jquery.json-2.2.min.js"></script>
    <script type="text/javascript" src="/classzt/js/jquery.wsajax.js"></script>
    <script type="text/javascript">
        var wsurl = "/classzt/liuxue/getgift.aspx";
        var leftSecond = 0;
        var isValid = false;
        var isCodeValid = false;
        var phoneNumber;
        var isBinded = $("#hidden_isbinded").val() == 1;

        $(function () {

            $(window.parent.document).find("#modal_title").html("领取留学大礼包");

            $("#t_phone").blur(function () {
                checkPhoneNumber();
            });

            $("#t_valid_code").blur(function () {
                checkValidCode();
            });

            var getgitNext = $('.getgit_next');
            var getgitIndex = 0;
            getgitNext.click(function (event) {
                var $this = $(this);
                if ($this.text() == "立即领取") {
                    $this.attr('href', 'http://class.hujiang.com/<%=classID %>/share');
                    $this.attr("target", "_blank");
                    $(window.parent.document).find(".simplemodal-close").click();
                }
                else {
                    getgitIndex++;
                    getgitSlider(getgitIndex);
                    if (getgitIndex == 4) {
                        $this.text('立即领取');
                        $('last_getgift').addClass('inview');
                        return false;
                    }
                }
            });

        });


        function checkPhoneNumber() {
            phoneNumber = $.trim($("#t_phone").val());
            var exp = /^0?1[3|5|8|4][0-9]\d{8}$/;
            if (exp.test(phoneNumber)) {
                isValid = true;
                $("#msg").html("");
            }
            else {
                isValid = false;
                $("#msg").html("请输入有效的手机号码");
            }
        }
        function checkValidCode() {
            var code = $.trim($("#t_valid_code").val());
            if (code == "") {
                $("#msg2").html("请输入验证码");
            }
            else {
                $.wsajax(wsurl, "ValidatePhone", { code: code }, function (data) {
                    if (data == "ok") {
                        isCodeValid = true;
                        $("#msg2").html("");

                        $.get("/classzt/liuxue/tj.ashx", { source: "finish_phone" });
                    }
                    else {
                        isCodeValid = false;
                        $("#msg2").html(data);
                    }
                });
            }
        }

        //发送验证码
        function sendCode() {
            checkPhoneNumber();
            if (isValid) {
                if (leftSecond == 0) {
                    $.wsajax(wsurl, "SendValidateCode", { phoneNumber: phoneNumber }, function (data) {
                        if (data == "ok") {
                            $("#btn_send_code").addClass("disable");
                            leftSecond = 59;
                            setInterval(function () {
                                if (leftSecond > 0) {
                                    leftSecond = leftSecond - 1;
                                    $("#btn_send_code").html(leftSecond + "秒后重新发送");
                                }
                                else {
                                    $("#btn_send_code").removeClass("disable").html("发送验证码");
                                }
                            }, 1000);
                        }
                        else {
                            $("#msg").html(data);
                        }
                    });
                }
            }
        }

        //领取礼物
        function getGift() {
            if (!isBinded) {
                if (!(isValid && isCodeValid)) {

                    if (!isValid) {
                        $("#t_phone").blur();
                    }
                    else {
                        $("#t_valid_code").blur();
                    }

                    return;
                };
            }

            $.wsajax(wsurl, "GetGift", {}, function (data) {
                if (data == "ok") {
                    $("#div_before").hide();
                    $("#div_after").show();

                    $.get("/classzt/liuxue/tj.ashx", { source: "finish_get" });
                }
            });
        }
        //弹出层引导
        function getgitSlider(index) {
            var sliderImg = $('.getgit_slider_wrap .getgit_img');
            var pageNation = $('.pagenation');
            sliderImg.eq(index).fadeIn(300).siblings();
            pageNation.find('span').eq(index).addClass('current_page').siblings().removeClass('current_page');
        }
    </script>
</body>
</html>
