CREATE OR ALTER PROCEDURE dbo.CriarBancoDeDadosETabelas
AS
BEGIN
    -- Criar o banco de dados
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'TesteTecnico')
    BEGIN
        CREATE DATABASE TesteTecnico;
    END

    
    -- Criar a tabela Profissionais
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

    -- Criar a tabela Especialidades
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Especialidades')
    BEGIN
        CREATE TABLE Especialidades (
            Id_Especialidade INT PRIMARY KEY IDENTITY(1,1),
            Nome_Especialidade CHAR(50) NOT NULL,
            Tipo_Documento CHAR(10) NOT NULL
        );
    END

    -- Inserir os dados na tabela Especialidades
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
            ('Nutricionista Cl�nico', 'CRN'),
            ('Nutri��o Esportiva', 'CRN'),
            ('Nutri��o Oncol�gica', 'CRN'),
            ('Fisioterapia Ortop�dica', 'CREFITO'),
            ('Fisioterapia Neurol�gica', 'CREFITO'),
            ('Fisioterapia Respirat�ria', 'CREFITO'),
            ('Ortodontia', 'CRO'),
            ('Implantodontia', 'CRO'),
            ('Endodontia', 'CRO'),
            ('Enfermagem Geral', 'COREN'),
            ('Enfermagem Obst�trica', 'COREN'),
            ('Psicologia Cl�nica', 'CRP'),
            ('Psicologia Organizacional', 'CRP'),
            ('Neuropsicologia', 'CRP'),
            ('Farm�cia Cl�nica', 'CRF'),
            ('Farm�cia Hospitalar', 'CRF'),
            ('An�lises Cl�nicas', 'CRF'),
            ('Personal Trainer', 'CREF'),
            ('Prepara��o F�sica', 'CREF');
    END
END;
