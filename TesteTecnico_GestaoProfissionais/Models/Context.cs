using Microsoft.EntityFrameworkCore;

namespace TesteTecnico_GestaoProfissionais.Models
{
    public class Context : DbContext
    {
        public Context(DbContextOptions<Context> options) : base(options)
        {

        }

        public DbSet<Profissional> Profissionais { get; set; }

        public DbSet<Especialidade> Especialidades { get; set; }

    }
}
