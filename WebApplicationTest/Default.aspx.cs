using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationTest.Models;

namespace WebApplicationTest
{
    
    public partial class _Default : Page
    {
        public testdbEntities DB = new testdbEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Request.IsAuthenticated)
                {
                    Response.Redirect("~/Contact.aspx");
                }
                else
                {
                    
                    GVPrimaryNurse.DataSource = DB.Member.OrderBy(x => x.id).Skip((0))
                        .Take(DB.Member.Count()).ToList();
                    GVPrimaryNurse.DataBind();
                }
                
            }
            }
        protected void SaveOne(object sender, EventArgs e)
        {
            Member member = new Member();
            member.Name = "ali";
            DB.Member.Add(member);
            DB.SaveChanges();
            GVPrimaryNurse.DataSource = DB.Member.OrderBy(x => x.id).ToList();
            GVPrimaryNurse.DataBind();
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "ShowPopup", "successalert();", true);
        }
        protected void SaveClick(object sender, EventArgs e)
        {
            Button lb = (Button)sender;
            GridViewRow r = (GridViewRow)lb.Parent.Parent;
            String Serial = GVPrimaryNurse.DataKeys[r.RowIndex].Values[0].ToString();
            var item = DB.Member.Find(Convert.ToInt32(Serial));
            DB.Member.Remove(item);
            DB.SaveChanges();
            GVPrimaryNurse.DataSource = DB.Member.OrderBy(x => x.id).ToList();
            GVPrimaryNurse.DataBind();

        }

        public void GridView1_PageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            // increment PageIndex
            GVPrimaryNurse.PageIndex = e.NewPageIndex;

            // bind table again
            //GVPrimaryNurse.DataSource = DB.Member.OrderBy(x => x.id).ToList();
            GVPrimaryNurse.DataSource = DB.Member.OrderBy(x => x.id).Skip((e.NewPageIndex) )
                       .Take(DB.Member.Count()).ToList();
            GVPrimaryNurse.DataBind();

        }
    }
    }
