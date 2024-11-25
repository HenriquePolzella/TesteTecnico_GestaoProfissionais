using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TesteTecnico_GestaoProfissionais.Migrations
{
    /// <inheritdoc />
    public partial class Profissionais : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Profissionais",
                columns: table => new
                {
                    Id_Profissional = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nome_Profissional = table.Column<string>(type: "varchar(100)", nullable: true),
                    Nome_Especialidade = table.Column<string>(type: "char(50)", nullable: true),
                    Tipo_Documento = table.Column<string>(type: "char(10)", nullable: true),
                    Numero_Documento = table.Column<string>(type: "varchar(20)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Profissional", x => x.Id_Profissional);
                });

        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Profissionais");
        }
    }
}
