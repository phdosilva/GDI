CREATE TABLE Profissional (
    cpf varchar(11),
    email varchar(50) NOT NULL,
    nome varchar(255) NOT NULL,
    endereco_rua varchar(255),
    endereco_numero int,
    endereco_bairro varchar(255),
    endereco_complemento varchar(255),
    endereco_cidade varchar(255),
    endereco_estado varchar(255),
    CONSTRAINT PK_Profissional PRIMARY KEY (cpf)
    );
    
CREATE TABLE Numero_Contato_Profissional (
    cpf varchar(11),
    numero_contato varchar(11),
    CONSTRAINT PK_Numero_Contato PRIMARY KEY (cpf, numero_contato),
    CONSTRAINT FK_Numero_Contato_Profissional FOREIGN KEY (cpf) REFERENCES Profissional ON DELETE CASCADE
    );
    
    
CREATE TABLE Empregador (
    cpf varchar(11),
    CONSTRAINT PK_Empregador PRIMARY KEY (cpf),
    CONSTRAINT FK_Empregador_Profissional FOREIGN KEY (cpf) REFERENCES Profissional ON DELETE CASCADE
    );

CREATE TABLE Candidato (
    cpf varchar(11),
    interesse_salarial number(15,2),
    disponibilidade_horarios int, -- 0=nenhum, 1=manha, 2=tarde, 3=manha e tarde
    cargo_almejado varchar(255),
    CONSTRAINT PK_Candidato PRIMARY KEY (cpf),
    CONSTRAINT FK_Candidato_Profissional FOREIGN KEY (cpf) REFERENCES Profissional ON DELETE CASCADE
    );
    
CREATE TABLE Empresa (
    cnpj varchar(14),
    nome varchar(255) NOT NULL,
    descricao varchar(255),
    endereco_rua varchar(255) NOT NULL,
    endereco_numero int NOT NULL,
    endereco_bairro varchar(255) NOT NULL,
    endereco_complemento varchar(255),
    endereco_cidade varchar(255) NOT NULL,
    endereco_estado varchar(255) NOT NULL,
    dirigida_por varchar(11) NOT NULL,
    CONSTRAINT PK_Empresa PRIMARY KEY (cnpj),
    FOREIGN KEY (dirigida_por) REFERENCES Profissional
    );
    
CREATE TABLE Conquista (
    empresa varchar(11),
    numero_de_registro varchar(4),
    imagem varchar(255),
    titulo varchar(255) NOT NULL,
    descricao varchar(255),
    data_conquista date NOT NULL,
    CONSTRAINT PK_Conquista PRIMARY KEY (empresa, numero_de_registro),
    CONSTRAINT FK_Conquista_Empresa FOREIGN KEY (empresa) REFERENCES Empresa ON DELETE CASCADE
    );
    
CREATE TABLE Vaga (
    empregador varchar(11),
    empresa varchar(11),
    CONSTRAINT PK_Vaga PRIMARY KEY (empregador, empresa),
    CONSTRAINT FK_Vaga_Empregador FOREIGN KEY (empregador) REFERENCES Empregador ON DELETE CASCADE,
    CONSTRAINT FK_Vaga_Empresa FOREIGN KEY (empresa) REFERENCES Empresa ON DELETE CASCADE
    );
    
CREATE TABLE Conectase (
    profissional_um varchar(11),
    profissional_dois varchar(11),
    CONSTRAINT PK_Conectase PRIMARY KEY (profissional_um, profissional_dois),
    CONSTRAINT FK_Conectase_Profissional_Um FOREIGN KEY (profissional_um) REFERENCES Profissional ON DELETE CASCADE,
    CONSTRAINT FK_Conectase_Profissional_Dois FOREIGN KEY (profissional_dois) REFERENCES Profissional ON DELETE CASCADE
    );
    
CREATE TABLE Trabalha (
    profissional varchar(11),
    empresa varchar(11),
    data_de_entrada date,
    data_de_saida date,
    cargo varchar(255) NOT NULL,
    descricao varchar(255),
    CONSTRAINT PK_Trabalha PRIMARY KEY (profissional, empresa),
    CONSTRAINT FK_Trabalha_Profissional FOREIGN KEY (profissional) REFERENCES Profissional ON DELETE CASCADE,
    CONSTRAINT FK_Trabalha_Empresa FOREIGN KEY (empresa) REFERENCES Empresa ON DELETE CASCADE
    );
    
CREATE TABLE Aplica (
    empregador varchar(11),
    empresa varchar(11),
    candidato varchar(11),
    CONSTRAINT PK_Aplica PRIMARY KEY (empregador, empresa, candidato),
    CONSTRAINT FK_Aplica_Vaga FOREIGN KEY (empregador, empresa) REFERENCES Vaga(empregador, empresa) ON DELETE CASCADE,
    CONSTRAINT FK_Aplica_Candidato FOREIGN KEY (candidato) REFERENCES Candidato ON DELETE CASCADE
    );

