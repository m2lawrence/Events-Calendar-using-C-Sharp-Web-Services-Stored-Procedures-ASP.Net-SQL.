
# Events-Calendar-using-C-Sharp-Web-Services-Stored-Procedures-ASP.Net-SQL.
Events Calendar using: C Sharp, Web Services, Stored Procedures, ASP.Net, Javascript, Bootstrap Javascript, jQuery, SQL with InUpDelSel


MY GUIDE that I created to learn Web Services correctly.
--------------------------------------------------------

1. Create an empty ASP.Net project called WebServices1.

2. Add a connection string in the Web config file, use the correct database name:
<!--Add in the connection string here:-->
  <connectionStrings>
    <add name="con" connectionString="Data Source=MIKESDELL\SQLEXPRESS;Initial Catalog=mike;Integrated Security=True"
      providerName="System.Data.SqlClient" />
  </connectionStrings>

3. RC Project, add, new item, Create Web Service, name it: TestService.asmx.cs
4. Add these 3 libraries: using System.Data.SqlClient; using System.Data; using System.Configuration; 

5. Create the Web Method:
[WebMethod]
        public int InsertDetail(string Date, string Event)        {
            int resultRecord = 0;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("InsertDetail", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("Date", SqlDbType.VarChar, 100).Value = Date;
                    cmd.Parameters.Add("Event", SqlDbType.VarChar, 100).Value = Event;
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    resultRecord = cmd.ExecuteNonQuery();
                }
            }
            return resultRecord;
        }
//------------------------------------------------------------------------------------------------------------------------

6. Run the WebService and copy the website URL link: http://localhost:50713/TestService.asmx 

7. Create a new empty project called ServiceConsume in the same folder.

8. RC Project, add, Service Reference. Click Advanced, Click Web Service Reference, paste the URL in, click the right arrow, 
name it: ServiceRef.

9. Add a Web Form Default.aspx and create a table with three text boxes, a label, and a submit button:

    <center> 
        <h1><u><asp:Label ID="Label1" runat="server" ForeColor="#0066FF" Text="Calendar"></asp:Label>
        </u></h1> <br /> 
    <table>
        <tr>
            <td>ID</td>
            <td><asp:TextBox runat="server" ID="txtID" BorderColor="#0066FF"></asp:TextBox></td>
        </tr>       
        <tr>
            <td>Date</td>
            <td><asp:TextBox runat="server" ID="txtCity" BorderColor="#0066FF"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Event</td>
            <td><asp:TextBox runat="server" ID="txtName" BorderColor="#0066FF"></asp:TextBox></td>
        </tr>

    </table>
        <asp:Button runat="server" ID="btnInsert" OnClick="btnInsert_Click" Text="Insert" BackColor="#0066FF" ForeColor="White" />
        <asp:Button runat="server" ID="btnUpdate" OnClick="btnUpdate_Click" Text="Update" BackColor="#0066FF" ForeColor="White" />
        <asp:Button runat="server" ID="btnDelete" OnClick="btnDelete_Click" Text="Delete" BackColor="#0066FF" ForeColor="White" />
        <asp:Button runat="server" ID="btnSelect" OnClick="btnSelect_Click" Text="Select" BackColor="#0066FF" ForeColor="White" />
        <p>
        <asp:Label runat="server" id="lblMessage" ForeColor="#0066FF"></asp:Label>
        </p>
    </center> 
//--------------------------------------------------------------------------------------------------------

10. The class TestService in the WebService website, is joined onto the class of the ServiceConsume website in 
the default.aspx.cs page here (top line) in the Insert button below:

protected void btnInsert_Click(object sender, EventArgs e)
        {
            ServiceRef.TestService objTest = new ServiceRef.TestService();
            int result = objTest.InsertDetail(txtDate.Text, txtEvent.Text);
            if (result > 0)
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
//---------------------------------------------------------------

11. One more parameter (the ID number) is required here for the Update, Delete and Select methods. 

12. NuGet - download Bootstrap and jQuery packages. Add the calendar icon in the images folders and the calendar script.js in the scripts folder. Add all the required scripts/css scripts links in the header tag. Done!




