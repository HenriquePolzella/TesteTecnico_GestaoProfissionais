CREATE OR ALTER PROCEDURE dbo.CriarBancoDeDadosETabelas
AS
BEGIN

    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'TesteTecnico')
    BEGIN
        CREATE DATABASE TesteTecnico;
    END

    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Profissionais')
    BEGIN
        CREATE TABLE Profissionais (
            Id_Profissional INT PRIMARY KEY IDENTITY(1,1),
            Nome_Profissional VARCHAR(100) NOT NULL,
            Nome_Especialidade CHAR(50) NOT NULL,
            Tipo_Documento CHAR(9) NOT NULL,
            Numero_Documento CHAR(8) NOT NULL
        );
    END

    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Especialidades')
    BEGIN
        CREATE TABLE Especialidades (
            Id_Especialidade INT PRIMARY KEY IDENTITY(1,1),
            Nome_Especialidade CHAR(50) NOT NULL,
            Tipo_Documento CHAR(10) NOT NULL
        );
    END

    IF NOT EXISTS (SELECT * FROM Especialidades)
    BEGIN
        INSERT INTO Especialidades (Nome_Especialidade, Tipo_Documento)
        VALUES
            ('Cardiologia', 'CRM'),
            ('Ortopedia', 'CRM'),
            ('Pediatria', 'CRM'),
            ('Dermatologia', 'CRM'),
            ('Ginecologia', 'CRM'),
            ('Neurologia', 'CRM'),
            ('Psiquiatria', 'CRM'),
            ('Anestesiologia', 'CRM'),
            ('Radiologia', 'CRM'),
            ('Endocrinologia', 'CRM'),
            ('Nutricionista Clínico', 'CRN'),
            ('Nutrição Esportiva', 'CRN'),
            ('Nutrição Oncológica', 'CRN'),
            ('Fisioterapia Ortopédica', 'CREFITO'),
            ('Fisioterapia Neurológica', 'CREFITO'),
            ('Fisioterapia Respiratória', 'CREFITO'),
            ('Ortodontia', 'CRO'),
            ('Implantodontia', 'CRO'),
            ('Endodontia', 'CRO'),
            ('Enfermagem Geral', 'COREN'),
            ('Enfermagem Obstétrica', 'COREN'),
            ('Psicologia Clínica', 'CRP'),
            ('Psicologia Organizacional', 'CRP'),
            ('Neuropsicologia', 'CRP'),
            ('Farmácia Clínica', 'CRF'),
            ('Farmácia Hospitalar', 'CRF'),
            ('Análises Clínicas', 'CRF'),
            ('Personal Trainer', 'CREF'),
            ('Preparação Física', 'CREF');
    END
END;
