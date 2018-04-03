using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

using YesHJ;
using YesHJ.Class;
using com.hujiang.bulo;
public partial class classzt_liuxue_getgift : System.Web.UI.Page
{
    /*
     * 本页面主要是收集手机号码     
     * 
     */
    protected int userID = 0;

    protected static int classID = 146574;
    protected bool hasGot = false;
    protected bool isPhoneBinded = false;
    const string openClassSummary = "网校专题留学大作战注册开通";

    static string msgTitle = "欢迎您加入“沪江留学体验有礼（ni）团”！";
    static string msgContent = string.Format(@"
恭喜您成功加入 “沪江留学体验有礼（ni）团”，您在该班学号为 UserNumber，班级链接 [url=http://class.hujiang.com/{0}/]http://class.hujiang.com/{0}/[/url]。

友情提示：

1. 进班请填写新生调 [url=http://class.hujiang.com/topic/340794/]http://class.hujiang.com/topic/340794/[/url]
2. 班级使用说明请到班级讨论区置顶帖中寻找，可以帮助您更快地熟悉沪江网校的使用。
3. 如果有其他问题或者疑问，可以联系客服详细咨询，客服邮箱:kf@hujiang.com。", classID);
    protected void Page_Load(object sender, EventArgs e)
    {
        userID = LoginHelper.GetUserID();
        if (userID <= 0)
        {
            Response.Write("请登录");
            Response.End();
            return;
        }
        hasGot = UserClass.IsInClass(userID, classID);
        isPhoneBinded = CheckIsBinded(userID);
    }

    [WebMethod()]
    public static string GetGift()
    {
        int userID = LoginHelper.GetUserID();
        if (userID <= 0)
        {
            return "请登录";
        }

        //绑定手机       
        if (CheckIsBinded(userID))
        {
            //开通班级
            SendGift(userID);
            return "ok";
        }
        else
        {
            return "请绑定手机";
        }
    }

    /// <summary>
    /// 开通班级
    /// </summary>
    /// <returns></returns>
    static void SendGift(int userID)
    {
        string userName = clsUser.GetUserName(userID);
        if (!UserClass.IsInClass(userID, classID))
        {
            YesHJ.Class.OpenClassHelper.OpenClass(userID, userName, classID, OpenClassType.Give, true, 0, openClassSummary);

            //发送短消息和邮件
            string emailAddress = clsUser.GetUserEmail(userID);
            string userNumber = clsClassInfo.GetUserNumber(classID, userID);

            //发送站内信
            clsMessage.SendNotice(userName, "沪江网校", msgTitle, msgContent.Replace("UserNumber", userNumber));

            //发送邮件
            if (!string.IsNullOrEmpty(emailAddress))
            {
                clsMessage.SendMail(emailAddress, msgTitle, msgContent.Replace("UserNumber", userNumber));
            }
        }
    }

    /// <summary>
    /// 检查是否绑定了手机号
    /// </summary>
    /// <param name="userID"></param>
    /// <returns></returns>
    public static bool CheckIsBinded(int userID)
    {
        string phoneNumber = string.Empty;

        bool hasMobile = false;
        try
        {
            mobile_services mobileServices = new mobile_services(); //web services
            mobileServices.UserAgent = "bulo.hujiang.com" + "|" + "hjbulo_9A263AC7F9584ffd8537655D5AB17AE4";
            mobileServices.CheckIsHasMobile(userID, out hasMobile, out phoneNumber);
        }
        catch (Exception)
        {

        }
        return hasMobile;
    }

    [WebMethod()]
    public static string CheckPhoneNumber()
    {
        //检查时候绑定过手机


        return "ok";
    }

    [WebMethod()]
    public static string SendValidateCode(string phoneNumber)
    {
        //数据校验
        int userId = LoginHelper.GetUserID();
        if (userId <= 0) return "请登录";
        var result = string.Empty;
        if (!System.Text.RegularExpressions.Regex.IsMatch(phoneNumber, "^[1][3-8]+\\d{9}")) return "暂只支持大陆手机号";

        try
        {
            mobile_services mobileServices = new mobile_services(); //web services
            mobileServices.UserAgent = "bulo.hujiang.com" + "|" + "hjbulo_9A263AC7F9584ffd8537655D5AB17AE4";
            result = mobileServices.SendSms(phoneNumber, userId);
            switch (result)
            {
                case "-1": result = "请1分钟后重新获取"; break;
                case "1": result = "ok"; break;
                case "-2": result = "该手机号已经被使用"; break;//已经绑定过
                default: break;
            }
        }
        catch (Exception)
        {
        }

        return result;
    }

    /// <summary>
    /// 验证
    /// </summary>
    [WebMethod()]
    public static string ValidatePhone(string code)
    {
        if (code.Length != 6) return "验证码无效";
        int userId = LoginHelper.GetUserID();
        string result = string.Empty;
        try
        {
            mobile_services mobileServices = new mobile_services(); //web services
            mobileServices.UserAgent = "bulo.hujiang.com" + "|" + "hjbulo_9A263AC7F9584ffd8537655D5AB17AE4";
            result = mobileServices.ValidSMS(code, userId);
            switch (result)
            {
                case "0": result = "验证码无效"; break;//无效验证码
                case "1": result = "ok"; break;//验证通过
                case "-1": result = "ok"; break;//已经验证过
                case "-2": result = "请重新获取"; break;//尚未生成验证码
                case "-3": result = "已过期，请重新获取"; break;//30分钟内有效期
                default: break;
            }
        }
        catch (Exception)
        {

        }
        return result;
    }
}