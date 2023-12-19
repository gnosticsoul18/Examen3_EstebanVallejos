using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen3_EstebanVallejos
{
    public partial class AgregarEncuestaPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
          
            string nombre = tNombre.Text;
            int edad = Convert.ToInt32(tEdad.Text);
            string email = tEmail.Text;
            string partido = dPartido.SelectedValue;

            int resultado = AgregarEncuesta(nombre, edad, email, partido);

       
            if (resultado > 0)
            {
                MostrarAlerta("Encuesta agregada con éxito");
                LimpiarCampos();
            }
            else
            {
                MostrarAlerta("Error al agregar la encuesta");
            }
        }

        private int AgregarEncuesta(string nombre, int edad, string email, string partido)
        {
            int result = 0;
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("AgregarEncuesta", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Nombre", nombre);
                    cmd.Parameters.AddWithValue("@Edad", edad);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@PartidoP", partido);

                    con.Open();
                    result = cmd.ExecuteNonQuery();
                }
            }

            return result;
        }

        private void MostrarAlerta(string mensaje)
        {
            string message = mensaje;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        private void LimpiarCampos()
        {
            tNombre.Text = string.Empty;
            tEdad.Text = string.Empty;
            tEmail.Text = string.Empty;
            dPartido.SelectedIndex = 0;
        }
    }
}