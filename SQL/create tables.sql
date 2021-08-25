CREATE TABLE Profissional (
    cpf INT,
    email VARCHAR(50),
    endereco_rua VARCHAR(255),
    endereco_numero INT,
    endereco_bairro VARCHAR(255),
    endereco_complemento VARCHAR(255),
    endereco_cidade VARCHAR(255),
    endereco_estado VARCHAR(255),
    CONSTRAINT PK_Profissional PRIMARY KEY (cpf)
    );
    
CREATE TABLE Numero_Contato_Profissional (
    cpf INT,
    numero_contato INT,
    CONSTRAINT PK_Numero_Contato PRIMARY KEY (cpf, numero_contato),
    CONSTRAINT FK_Numero_Contato_Profissional FOREIGN KEY (cpf) REFERENCES Profissional ON DELETE CASCADE
    );
    
    
CREATE TABLE Empregador (
    cpf INT,
    CONSTRAINT PK_Empregador PRIMARY KEY (cpf),
    CONSTRAINT FK_Empregador_Profissional FOREIGN KEY (cpf) REFERENCES Profissional ON DELETE CASCADE
    );

CREATE TABLE Candidato (
    cpf INT,
    interesse_salaciral NUMBER,
    disponibilidade_horarios INT,
    cargo_almejado VARCHAR(255),
    CONSTRAINT PK_Candidato PRIMARY KEY (cpf),
    CONSTRAINT FK_Candidato_Profissional FOREIGN KEY (cpf) REFERENCES Profissional ON DELETE CASCADE
    );
    
CREATE TABLE Empresa (
    cnpj INT,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    endereco_rua VARCHAR(255),
    endereco_numero INT,
    endereco_bairro VARCHAR(255),
    endereco_complemento VARCHAR(255),
    endereco_cidade VARCHAR(255),
    endereco_estado VARCHAR(255),
    dirigida_por INT NOT NULL,
    CONSTRAINT PK_Empresa PRIMARY KEY (cnpj),
    FOREIGN KEY (dirigida_por) REFERENCES Profissional
    );
    
CREATE TABLE Conquista (
    empresa INT,
    numero_de_registro INT,
    imagem VARCHAR(255) NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    data_conquista DATE NOT NULL,
    CONSTRAINT PK_Conquista PRIMARY KEY (empresa, numero_de_registro),
    CONSTRAINT FK_Conquista_Empresa FOREIGN KEY (empresa) REFERENCES Empresa ON DELETE CASCADE
    );
    
CREATE TABLE Vaga (
    empregador INT,
    empresa INT,
    CONSTRAINT PK_Vaga PRIMARY KEY (empregador, empresa),
    CONSTRAINT FK_Vaga_Empregador FOREIGN KEY (empregador) REFERENCES Empregador ON DELETE CASCADE,
    CONSTRAINT FK_Vaga_Empresa FOREIGN KEY (empresa) REFERENCES Empresa ON DELETE CASCADE
    );
    
CREATE TABLE Conectase (
    profissional_um INT,
    profissional_dois INT,
    CONSTRAINT PK_Conectase PRIMARY KEY (profissional_um, profissional_dois),
    CONSTRAINT FK_Conectase_Profissional_Um FOREIGN KEY (profissional_um) REFERENCES Profissional ON DELETE CASCADE,
    CONSTRAINT FK_Conectase_Profissional_Dois FOREIGN KEY (profissional_dois) REFERENCES Profissional ON DELETE CASCADE
    );
    
CREATE TABLE Trabalha (
    profissional INT,
    empresa INT,
    data_de_entrada DATE,
    data_de_saida DATE,
    cargo VARCHAR(255),
    descricao VARCHAR(255),
    CONSTRAINT PK_Trabalha PRIMARY KEY (profissional, empresa),
    CONSTRAINT FK_Trabalha_Profissional FOREIGN KEY (profissional) REFERENCES Profissional ON DELETE CASCADE,
    CONSTRAINT FK_Trabalha_Empresa FOREIGN KEY (empresa) REFERENCES Empresa ON DELETE CASCADE
    );
    
CREATE TABLE Aplica (
    empregador INT,
    empresa INT,
    candidato INT,
    CONSTRAINT PK_Aplica PRIMARY KEY (empregador, empresa, candidato),
    CONSTRAINT FK_Aplica_Vaga FOREIGN KEY (empregador, empresa) REFERENCES Vaga(empregador, empresa) ON DELETE CASCADE,
    CONSTRAINT FK_Aplica_Candidato FOREIGN KEY (candidato) REFERENCES Candidato ON DELETE CASCADE
    );

