-- Criar a tabela Profissionais
CREATE TABLE IF NOT EXISTS Profissionais (
    Id_Profissional INTEGER PRIMARY KEY,
    Nome_Profissional TEXT NOT NULL,
    Nome_Especialidade TEXT NOT NULL,
    Tipo_Documento TEXT NOT NULL,
    Numero_Documento TEXT NOT NULL
);

-- Criar a tabela Especialidades
CREATE TABLE IF NOT EXISTS Especialidades (
    Id_Especialidade INTEGER PRIMARY KEY ,
    Nome_Especialidade TEXT NOT NULL,
    Tipo_Documento TEXT NOT NULL
);

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