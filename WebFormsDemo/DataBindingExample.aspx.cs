using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebFormsDemo
{
    public partial class DataBindingExample : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindDataToGridView();
            }
        }

        public void BindDataToGridView()
        {
            var connFromConfig = WebConfigurationManager.ConnectionStrings["DBConnection"];

            using(SqlConnection dbConnection = new SqlConnection(connFromConfig.ConnectionString))
            {
                try
                {
                    dbConnection.Open();
                    SqlCommand command = new SqlCommand("SELECT id, name, hex FROM Color ORDER BY id", dbConnection);

                    // Create a SqlDataAdapter to execute the command and fill the DataSet
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

                    DataSet dataSet = new DataSet();

                    // Fill the DataSet with the results of the query
                    dataAdapter.Fill(dataSet);

                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        gvColors.DataSource = dataSet;
                        gvColors.DataBind();
                    }
                }
                catch (SqlException ex)
                {
                    ltError.Text = "Error connecting to the database: " + ex.Message;
                }
                finally
                {
                    dbConnection.Close();
                }
            }
        }

        protected void gvColors_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ltError.Text = string.Empty;
            GridViewRow gvRow = (GridViewRow)gvColors.Rows[e.RowIndex];
            HiddenField hdnId = (HiddenField)gvRow.FindControl("hdnId");

            var connFromConfig = WebConfigurationManager.ConnectionStrings["DBConnection"];

            using (SqlConnection dbConnection = new SqlConnection(connFromConfig.ConnectionString))
            {
                try
                {
                    dbConnection.Open();
                    string sql = string.Format("DELETE FROM Color WHERE Id={0}", hdnId.Value);
                    SqlCommand command = new SqlCommand(sql, dbConnection);
                    // Execute the command to delete the record
                    command.ExecuteNonQuery();
                    gvColors.EditIndex = -1; // Reset the edit index
                    BindDataToGridView(); // Rebind the data to the GridView
                }
                catch (SqlException ex)
                {
                    ltError.Text = "Error: " + ex.Message;
                }
                finally
                {
                    dbConnection.Close();
                }
            }
        }

        protected void gvColors_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ltError.Text = string.Empty;
            gvColors.EditIndex = e.NewEditIndex;
            BindDataToGridView();
        }

        protected void gvColors_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ltError.Text = string.Empty;
            // Get the row being edited
            GridViewRow gvRow = (GridViewRow)gvColors.Rows[e.RowIndex];
            // Get the controls in the row
            HiddenField hdnId = (HiddenField)gvRow.FindControl("hdnId");
            TextBox txtName = (TextBox)gvRow.Cells[1].Controls[0];
            TextBox txtHex = (TextBox)gvRow.Cells[2].Controls[0];

            var connFromConfig = WebConfigurationManager.ConnectionStrings["DBConnection"];

            using (SqlConnection dbConnection = new SqlConnection(connFromConfig.ConnectionString))
            {
                try
                {
                    dbConnection.Open();

                    string sql = string.Format("UPDATE Color set name='{0}', " +
                        "hex='{1}' WHERE Id={2}", txtName.Text, txtHex.Text, hdnId.Value);

                    SqlCommand command = new SqlCommand(sql, dbConnection);

                    // Execute the command to update the database (so, we need ExecuteNonQuery)
                    command.ExecuteNonQuery();

                    gvColors.EditIndex = -1; // Reset the edit index
                    BindDataToGridView(); // Rebind the data to the GridView
                }
                catch (SqlException ex)
                {
                    ltError.Text = "Error: " + ex.Message;
                }
                finally
                {
                    dbConnection.Close();
                }
            }
        }

        protected void gvColors_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvColors.EditIndex = -1; // Reset the edit index
            BindDataToGridView(); // Rebind the data to the GridView
        }

        protected void btnAddRow_Click(object sender, EventArgs e)
        {
            var connFromConfig = WebConfigurationManager.ConnectionStrings["DBConnection"];

            using (SqlConnection dbConnection = new SqlConnection(connFromConfig.ConnectionString))
            {
                try
                {
                    dbConnection.Open();

                    string sql = string.Format("INSERT INTO Color (name, hex)" +
                        " values ('','')", dbConnection);

                    SqlCommand command = new SqlCommand(sql, dbConnection);

                    command.ExecuteNonQuery();
                    BindDataToGridView();
                }
                catch (SqlException ex)
                {
                    ltError.Text = "Error: " + ex.Message;
                }
                finally
                {
                    dbConnection.Close();
                }
            }
        }
    }
}