using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ServiceConsume
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            ServiceRef.TestService objTest = new ServiceRef.TestService();
            int ret = objTest.InsertDetail(txtDate.Text, txtEvent.Text);
            if (ret > 0)
            {
                lblMessage.Text = "Record Inserted Successfully";
                txtID.Text = "";
                txtDate.Text = "";
                txtEvent.Text = "";
            }
            else
            {
                lblMessage.Text = "Error while inserting record";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ServiceRef.TestService objTest = new ServiceRef.TestService();
            int ret = objTest.UpdateDetail(Convert.ToInt32(txtID.Text), txtDate.Text, txtEvent.Text);
            if (ret > 0)
            {
                lblMessage.Text = "Record update Successfully";
                txtID.Text = "";
                txtDate.Text = "";
                txtEvent.Text = "";
            }
            else
            {
                lblMessage.Text = "Error while updating record";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ServiceRef.TestService objTest = new ServiceRef.TestService();
            int ret = objTest.DeleteRecord(Convert.ToInt32(txtID.Text));
            if (ret > 0)
            {
                lblMessage.Text = "Record delete Successfully";
                txtID.Text = "";
                txtDate.Text = "";
                txtEvent.Text = "";
            }
            else
            {
                lblMessage.Text = "Error while deleting record";
            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            ServiceRef.TestService objTest = new ServiceRef.TestService();
            DataSet ret = objTest.GetDetialByID(Convert.ToInt32(txtID.Text));
            if (ret.Tables.Count > 0)
            {
                if (ret.Tables[0].Rows.Count > 0)
                {
                    //add the rows to the tables using the column names below.

                    txtDate.Text = ret.Tables[0].Rows[0]["Date"].ToString();
                    txtEvent.Text = ret.Tables[0].Rows[0]["Event"].ToString();
                }
                else
                {
                    lblMessage.Text = "Record not found";
                }
            }
        }
    }
}