using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace TesteTecnico_GestaoProfissionais.Models
{

    public class ProfissionalViewModel
    {
        public int Id_Profissional { get; set; }
        public string Nome_Profissional { get; set; }
        public string Nome_Especialidade { get; set; }
        public string Tipo_Documento { get; set; }
        public string Numero_Documento { get; set; }

        public ProfissionalViewModel()
        {
            ListaEspecialidade = new List<SelectListItem>();
        }


        public List<Profissional> ?Profissionais { get; set; }
        public List<SelectListItem>? ListaEspecialidade { get; set; }
    }
}