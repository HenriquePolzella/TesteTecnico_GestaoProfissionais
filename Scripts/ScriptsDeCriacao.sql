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