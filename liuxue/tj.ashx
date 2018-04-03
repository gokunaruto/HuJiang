<%@ WebHandler Language="C#" Class="tongji" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;

using YesHJ;
using YesHJ.Class;


public class tongji : IHttpHandler
{

    /*
     * 留学大作战统计 
     * 
     */
    public void ProcessRequest(HttpContext context)
    {

        /*
         *           
         *  173 点击弹窗次数
         *  175 完成注册次数
         *  176 完成手机验证次数
         *  180 完成领取次数
         * 
         */
        int bannerID = 163;
        string source = CheckHelper.CheckStr(context.Request["source"], string.Empty);
        switch (source)
        {
            case "pop": bannerID = 173; break;
            case "finish_reg": bannerID = 175; break;
            case "finish_phone": bannerID = 176; break;
            case "finish_get": bannerID = 180; break;
            default: break;
        }

        AddClick(bannerID);
    }

    /// <summary>
    /// 添加点击量
    /// </summary>
    /// <param name="bannerId"></param>
    public void AddClick(int bannerId)
    {
        string sql = " update ulti_Banner set ClickNum = ClickNum + 1 where BannerID = @BannerID ";
        SqlParameter[] para = 
            {
                SqlHelper.MakeInParam("@BannerID",bannerId)
            };
        SqlHelper.ExecuteNonQuery(clsConfig.classExt, CommandType.Text, sql, para);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}