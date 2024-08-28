CREATE DATABASE TravelWorld;
USE TravelWorld;

CREATE TABLE usuario(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    cep INT(10),
    rua VARCHAR(255),
    numero INT(5),
    bairro VARCHAR(40),
    cidade VARCHAR(40),
    uf CHAR(2),
    complemento VARCHAR(100),
    referencia VARCHAR(255),
    pais CHAR(3),
    telefone VARCHAR(13),
    email VARCHAR(45),
    senha VARCHAR(45),
    tipo_usuario VARCHAR(45)
);

CREATE TABLE imagens(
	id_img int auto_increment primary key,
    imagem longblob);

CREATE TABLE imovel(
	id_imovel INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    diaria DECIMAL(10,2) NOT NULL,
    hospedes INT NOT NULL,
    quarto INT NOT NULL,
    cep INT(10),
    rua VARCHAR(255),
    numero INT,
    bairro VARCHAR(40),
    cidade VARCHAR(40),
    uf CHAR(2),
    complemento VARCHAR(100),
    referencia VARCHAR(255),
    pais CHAR(3),
    id_img int,
    foreign key (id_img) references imagens(id_img),
    id_locador INT NOT NULL,
    FOREIGN KEY (id_locador) REFERENCES usuario(id_usuario)
);

CREATE TABLE forma_pagamento(
	id_forma_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(25)
);

CREATE TABLE locatario(
	id_locatario INT auto_increment PRIMARY KEY,
    id_imovel INT NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE reserva(
	id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_imovel INT NOT NULL,
    id_locatario INT NOT NULL,
    checkin DATE NOT NULL,
    checkout DATE NOT NULL,
    numero_hospedes int(11),
    valor_total DECIMAL(10,2),
    id_forma_pagamento INT NOT NULL,
    FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel),
    FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento),
    FOREIGN KEY (id_locatario) REFERENCES locatario(id_locatario)
);



CREATE TABLE avaliacao(
	id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_imovel INT NOT NULL,
    id_reserva INT NOT NULL,
    nota TINYINT NOT NULL,
    mensagem VARCHAR(400),
    FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel),
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
);

INSERT INTO usuario (nome, cpf, cep, rua, numero, bairro, cidade, uf, complemento, referencia, pais, telefone, email, senha, tipo_usuario)
VALUES 
('João Silva', '123.456.789-00', 36880000, 'Rua Principal', 123, 'Centro', 'Muriaé', 'MG', 'Apto 101', 'Próximo ao mercado', 'BRA', '(32)999999999', 'joao.silva@example.com', 'senha123', 'locador'),
('Maria Oliveira', '987.654.321-00', 36880001, 'Av. São João', 456, 'São Pedro', 'Muriaé', 'MG', 'Casa', 'Em frente ao parque', 'BRA', '(32)988888888', 'maria.oliveira@example.com', 'senha456', 'locatario'),
('Carlos Santos', '111.222.333-44', 20000000, 'Rua das Flores', 789, 'Jardim', 'Rio de Janeiro', 'RJ', 'Cobertura', 'Perto da padaria', 'BRA', '(21)977777777', 'carlos.santos@example.com', 'senha789', 'locador'),
('Ana Paula', '555.666.777-88', 40000000, 'Av. Paulista', 101, 'Bela Vista', 'São Paulo', 'SP', 'Apto 301', 'Ao lado do shopping', 'BRA', '(11)966666666', 'ana.paula@example.com', 'senha101', 'locatario'),
('Pedro Martins', '999.888.777-66', 60000000, 'Rua do Comércio', 202, 'Centro', 'Salvador', 'BA', 'Casa', 'Próximo à igreja', 'BRA', '(71)955555555', 'pedro.martins@example.com', 'senha202', 'locatario');

INSERT INTO imovel (titulo, descricao, diaria, hospedes, quarto, cep, rua, numero, bairro, cidade, uf, complemento, referencia, pais, id_locador)
VALUES 
('Apartamento no Centro de Muriaé', 'Apartamento confortável no coração de Muriaé, próximo a tudo.', 120.00, 4, 2, 36880000, 'Rua Principal', 150, 'Centro', 'Muriaé', 'MG', 'Apto 101', 'Em frente à praça', 'BRA', 1),
('Casa Aconchegante em Muriaé', 'Casa espaçosa e aconchegante, perfeita para famílias.', 250.00, 6, 3, 36880001, 'Rua São João', 220, 'São Pedro', 'Muriaé', 'MG', 'Casa', 'Próximo à escola', 'BRA', 1),
('Flat Moderno em Ipanema', 'Flat moderno e elegante, a poucos passos da praia de Ipanema.', 400.00, 2, 1, 22410000, 'Rua Visconde de Pirajá', 500, 'Ipanema', 'Rio de Janeiro', 'RJ', 'Apto 702', 'Próximo ao metrô', 'BRA', 3),
('Cobertura com Vista Panorâmica', 'Cobertura luxuosa com vista deslumbrante do Cristo Redentor.', 750.00, 8, 4, 22241000, 'Rua General Glicério', 1500, 'Laranjeiras', 'Rio de Janeiro', 'RJ', '', 'Ao lado do Parque Guinle', 'BRA', 3),
('Casa de Campo em Tiradentes', 'Casa de campo charmosa, ideal para descanso e contato com a natureza.', 300.00, 5, 3, 36325000, 'Rua Direita', 45, 'Centro Histórico', 'Tiradentes', 'MG', '', 'Próximo ao Largo das Forras', 'BRA', 1);

INSERT INTO forma_pagamento (nome)
VALUES 
('Cartão de Crédito'),
('Boleto Bancário'),
('Transferência Bancária'),
('Pix'),
('PayPal');

INSERT INTO locatario (id_imovel, id_usuario)
VALUES 
(1, 2),  
(2, 2), 
(3, 4), 
(4, 4),  
(5, 5); 

INSERT INTO reserva (id_imovel, id_locatario, checkin, checkout, numero_hospedes, valor_total, id_forma_pagamento)
VALUES 
(1, 1, '2024-09-01', '2024-09-07', 4, 840.00, 1),  
(2, 2, '2024-10-01', '2024-10-05', 6, 1000.00, 2), 
(3, 3, '2024-08-15', '2024-08-20', 2, 2000.00, 3), 
(4, 4, '2024-11-01', '2024-11-10', 8, 7500.00, 4), 
(5, 5, '2024-12-20', '2024-12-27', 5, 2100.00, 5); 

INSERT INTO avaliacao (id_imovel, id_reserva, nota, mensagem)
VALUES 
(1, 1, 5, 'Excelente experiência! O imóvel estava impecável e bem localizado.'), 
(2, 2, 4, 'A casa é muito boa, mas tivemos alguns problemas com o aquecimento.'),
(3, 3, 3, 'O flat é bonito, mas esperava mais comodidades.'),
(4, 4, 5, 'Vista incrível e o imóvel é muito confortável!'), 
(5, 5, 4, 'Casa de campo muito charmosa, mas faltou um pouco de limpeza.');


/*--- Realize a alteração de alguma tabela do banco de dados e acrescente um atributo---*/
/*--- Realize a alteração de alguma tabela e altere o tipo/tamanho de um atributo---*/

alter table usuario 
modify telefone varchar(14);
alter table usuario
add column sobrenome varchar(45);

SELECT * FROM usuario
WHERE nome LIKE '%Silva%';

SELECT * FROM imovel
WHERE diaria >300;

/*--- Apresentar as reservas para Guarapari no mês de Janeiro de 2025; ---*/

SELECT i.titulo, i.cidade
FROM imovel as i 
INNER JOIN reserva as r
ON r.id_imovel = i.id_imovel
WHERE i.cidade = 'Guarapari'
AND (r.checkin BETWEEN '2024-01-01' and '2024-01-31');

/*---Exibir a quantidade de reservas cada imóvel possui---*/

SELECT i.titulo as Imovel,
count(r.id_reserva) as Qtd_Reservas
from reserva as r
left join imovel as i
on i.id_imovel = r.id_imovel
group by i.titulo;

/*--Apresentar a diária mais cara de todas;--*/

select i.titulo, i.diaria as Maior_Diaria
from imovel as i
where diaria = (select max(diaria) from imovel);

/*---Apresentar a diária mais barata em Belo Horizonte--*/

select i.titulo as Titulo, i.diaria as Menor_Diaria
from imovel as i
where diaria = (select min(diaria) from imovel)
AND i.cidade = 'Belo Horizonte';

/*---Altere os dados de um usuário;---*/

update usuario set cidade = 'Belo Horizonte'
where id_usuario = 3;

/*---Cadastre um novo usuário no sistema e logo em seguida, apague-o---*/

INSERT INTO usuario (nome, cpf, cep, rua, numero, bairro, cidade, uf, complemento, referencia, pais, telefone, email, senha, tipo_usuario)
VALUES 
('Lucas Pereira', '444.555.666-77', 12345000, 'Rua Nova', 100, 'Centro', 'Belo Horizonte', 'MG', 'Apto 202', 'Próximo ao parque', 'BRA', '(31)99999-8888', 'lucas.pereira@example.com', 'senha123', 'locatario');

DELETE FROM usuario
WHERE email = 'lucas.pereira@example.com';








 


