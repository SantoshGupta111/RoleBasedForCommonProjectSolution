using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAL.MasterDB
{
   public class ExportToExcelRepository
    {
        //All pages
        public static void Export(GridView GridCancerSubType, string FileNames)
        {
            #region

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + FileNames + "" + ".xls");
            HttpContext.Current.Response.Charset = "";
            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";

            //////////////using (StringWriter sw = new StringWriter())
            //////////////{
            //////////////    HtmlTextWriter hw = new HtmlTextWriter(sw);

            //////////////    //To Export all pages
            //////////////    GridCancerSubType.AllowPaging = false;
            //////////////    //this.LoadPage();

            //////////////    //GridCancerSubType.HeaderRow.BackColor = System.Drawing.Color.White;
            //////////////    foreach (TableCell cell in GridCancerSubType.HeaderRow.Cells)
            //////////////    {
            //////////////       // cell.BackColor = GridCancerSubType.HeaderStyle.BackColor;
            //////////////    }
            //////////////    foreach (GridViewRow row in GridCancerSubType.Rows)
            //////////////    {
            //////////////        //row.BackColor = System.Drawing.Color.White;
            //////////////        foreach (TableCell cell in row.Cells)
            //////////////        {
            //////////////            if (row.RowIndex % 2 == 0)
            //////////////            {
            //////////////                //cell.BackColor = GridCancerSubType.AlternatingRowStyle.BackColor;
            //////////////            }
            //////////////            else
            //////////////            {
            //////////////                //cell.BackColor = GridCancerSubType.RowStyle.BackColor;
            //////////////            }
            //////////////            cell.CssClass = "textmode";
            //////////////        }
            //////////////    }

            //////////////    GridCancerSubType.RenderControl(hw);

            //////////////    //style to format numbers to string
            //////////////    string style = @"<style> .textmode { } </style>";
            //////////////    HttpContext.Current.Response.Write(style);
            //////////////    HttpContext.Current.Response.Output.Write(sw.ToString());
            //////////////    HttpContext.Current.Response.Flush();
            //////////////    HttpContext.Current.Response.End();
            //////////////}
            #endregion
        }
    }
}
