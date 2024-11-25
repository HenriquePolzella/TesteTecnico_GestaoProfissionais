Teste Tecnico Gestao de Profissionais

### Descrição
Este é um projeto ASP.NET desenvolvido como parte de um teste técnico. O objetivo é implementar um sistema de gestão de profissionais, permitindo o cadastro, consulta, atualização e exclusão de registros.

---
## 📦 Tecnologias Utilizadas

- **ASP.NET Core**: Framework principal para desenvolvimento da aplicação.
- **Entity Framework Core**: Para manipulação do banco de dados.
- **SQL Server**: Banco de dados utilizado no projeto.
- **C#**: Linguagem principal do desenvolvimento.
---

## ⚙️ Configuração do Banco de Dados

Para que o projeto funcione no seu ambiente local, você deve atualizar a string de conexão do banco de dados no arquivo `Program.cs` com as informações do seu servidor SQL.

### Passos:
1. **Abra o arquivo** `program.cs`, localizado na raiz do projeto.
2. **Encontre a seguinte configuração:**
   ```
   builder.Services.AddDbContext<Context>
     (options => options.UseSqlServer("Data Source=ALTERARDATASOURCE;Initial Catalog=TesteTecnico;Integrated Security=True;TrustServerCertificate=True"));    
3. **Substitua o valor de Data Source pelo nome ou endereço do seu servidor**
   Para um servidor local padrão:
   ```
    builder.Services.AddDbContext<Context>
     (options => options.UseSqlServer("Data Source=localhost;Initial Catalog=TesteTecnico;Integrated Security=True;TrustServerCertificate=True"));
   ```

  Para um servidor com autenticação do SQL Server:
   ```
    builder.Services.AddDbContext<Context>
     (options => options.UseSqlServer("Data Source=SEU_SERVIDOR;Initial Catalog=TesteTecnico;User ID=SEU_USUARIO;Password=SUA_SENHA;TrustServerCertificate=True"));
   ```
 Executar o Script SQL para Criar as Tabelas
   O script necessário para criar as tabelas no banco de dados já está incluído no repositório.
  Navegue até a pasta Scripts (ou onde o arquivo SQL esteja localizado).
  Execute o script SQL para criar as tabelas e inicializar o banco de dados com a estrutura correta.


### Pré-requisitos

Certifique-se de ter as ferramentas abaixo instaladas:

- Visual Studio 2022 ou mais recente.
- .NET SDK (versão recomendada: 6.0 ou mais recente).
- SQL Server.
- Git (opcional, para gerenciamento de versões).

---

### Instalação


1. **Clone este repositório:**
   ```bash
   git clone https://github.com/HenriquePolzella/TesteTecnico_GestaoProfissionais
