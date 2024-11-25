using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel.DataAnnotations.Schema;

namespace TesteTecnico_GestaoProfissionais.Models
{
    public class Especialidade
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int Id_Especialidade { get; set; }

        public string Nome_Especialidade { get; set; }

        public string Tipo_Documento { get; set; }
    }
}
