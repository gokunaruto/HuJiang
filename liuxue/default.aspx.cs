using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using YesHJ;
using YesHJ.Class;
public partial class classzt_liuxue_default : System.Web.UI.Page
{
    protected int userID = 0;
    const int classID = 146574;
    protected bool hasGot = false;//是否已经领取（即是否已经开通了赠送的班级）
    protected void Page_Load(object sender, EventArgs e)
    {
        userID = LoginHelper.GetUserID();

        if (userID > 0)
        {
            hasGot = UserClass.IsInClass(userID, classID);
        }

    }

    
}