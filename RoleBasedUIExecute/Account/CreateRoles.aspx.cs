using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.Users;
using BAL.Users;
using System.Data;
using System.Data.SqlClient;

namespace UIExecute.Account
{
    public partial class CreateRoles : System.Web.UI.Page
    {
        string _currentDate = string.Format("{0:yyyy-MM-dd HH:mm:ss tt}", DateTime.Now);
        SqlCommand cmd = new SqlCommand();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                txtrolename.Focus();
                GetAllRolesData();
            }
        }


        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.btncreaterole.Click += new System.EventHandler(this.CreateRole);
        }

        void CreateRole(object Sender, EventArgs e)
        {
           
            RoleDTO _insertRole = GetRoleFromForm();
            RoleRepository.NewCreateRole(ref _insertRole);
            lblmsg.Text = _insertRole.ERROR;
            GetAllRolesData();
        }

       //Here all property assigned
       private RoleDTO GetRoleFromForm()
        {
            RoleDTO _GetRole = new RoleDTO();
            _GetRole.RoleName = txtrolename.Text.Trim();
            _GetRole.CreatedDate =Convert.ToDateTime(_currentDate);
            _GetRole.IsActive = 1;

            return _GetRole;
        }

        protected void GetAllRolesData()
        {
            DataSet ds = RoleRepository.GetAllRoles();

            if(ds.Tables.Contains("Table")==true)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    grdrole.DataSource = ds;
                    grdrole.DataBind();
                }
            }
            
        }

        
    }

}