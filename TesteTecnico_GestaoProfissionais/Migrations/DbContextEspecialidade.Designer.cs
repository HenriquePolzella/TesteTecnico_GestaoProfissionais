﻿// <auto-generated />
using TesteTecnico_GestaoProfissionais.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace TesteTecnico_GestaoProfissionais.Migrations
{
    [DbContext(typeof(Context))]
    [Migration("ContextEspecialidade")]
    partial class Especialidades
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.15")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("TesteTecnico_GestaoProfissionais.Models.Especialidades", b =>
            {
                b.Property<int>("Id_Especialidade")
                .ValueGeneratedOnAdd()
                .HasColumnType("int")
                .HasColumnName("Id_Especialidade");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id_Especialidade"));

                b.Property<string>("Nome_Especialidade")
                    .IsRequired()
                    .HasColumnType("varchar(50)")
                    .HasColumnName("Nome_Especialidade");

                b.Property<string>("Tipo_Documento")
                    .IsRequired()
                    .HasColumnType("char(10)")
                    .HasColumnName("Tipo_Documento");

                b.HasKey("Id_Especialidade");

                b.ToTable("Especialidades");
            });
#pragma warning restore 612, 618
        }
    }
}
