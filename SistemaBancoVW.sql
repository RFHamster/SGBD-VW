CREATE TABLE Arquivo(
	 id_arquivo TEXT PRIMARY KEY,
	 localizacao TEXT,
	 tipo TEXT
);

CREATE TABLE Cliente(
	 nome TEXT,
	 cpf TEXT PRIMARY KEY,
	 data_nascimento DATE,
	 cnh VARCHAR
);

CREATE TABLE Endereco(
	 estado TEXT, 
	 cidade TEXT, 
	 rua TEXT,
	 bairro TEXT,
	 numero TEXT,
	 cliente TEXT REFERENCES Cliente(cpf) ON DELETE CASCADE,
	 PRIMARY KEY(estado,cidade,rua,bairro,numero,cliente)
);

CREATE TABLE Gerente(
	 cpf TEXT PRIMARY KEY,
	 nome TEXT,
	 cpf_gerente TEXT,
	 sala TEXT,
	 salario_bruto FLOAT
);

CREATE TABLE Auxiliar(
	 cpf TEXT PRIMARY KEY ,
	 nome TEXT,
	 cpf_gerente TEXT REFERENCES Gerente(cpf),
	 salario_bruto FLOAT,
	 carros_lavados INT
);

CREATE TABLE Vendedor(
	 cpf TEXT PRIMARY KEY,
	 nome TEXT,
	 cpf_gerente TEXT REFERENCES Gerente(cpf),
	 salario_bruto FLOAT,
	 comissao FLOAT
);	

CREATE TABLE Placa(
	 numero TEXT PRIMARY KEY,
	 UF VARCHAR(2)
);

CREATE TABLE CRLV(
	 proprietario TEXT,
	 renavam TEXT PRIMARY KEY,
	 placa TEXT REFERENCES Placa(numero),
	 marca TEXT,
	 modelo TEXT,
	 arquivado_em TEXT REFERENCES Arquivo(id_arquivo),
	 ano_fabricacao INT,
	 ano_modelo INT,
	 cor TEXT
);

CREATE TABLE Documento_Compra(
	 id_doc TEXT PRIMARY KEY,
	 carro_comprado TEXT REFERENCES CRLV(renavam),
	 arquivado_em TEXT REFERENCES Arquivo(id_arquivo),
	 cliente_vendedor TEXT REFERENCES Cliente(cpf),
	 observacao TEXT,
	 preco_compra FLOAT,
  	 data_compra DATE
);


CREATE TABLE Carro(
	 n_documento TEXT REFERENCES CRLV(renavam) PRIMARY KEY,
  	 placa TEXT REFERENCES Placa(numero),
	 doc_compra TEXT REFERENCES Documento_Compra(id_doc),
	 descricao TEXT,
	 preco_anunciado FLOAT
);

CREATE TABLE Lavados(
	 cpf_aux TEXT REFERENCES Auxiliar(cpf),
	 veiculo TEXT REFERENCES Placa(numero),
	 id_lavada TEXT PRIMARY KEY,
	 data_lavada DATE
);

CREATE TABLE Documento_Venda(
	 id_venda TEXT PRIMARY KEY,
	 cliente TEXT REFERENCES Cliente(cpf),
	 vendedor TEXT REFERENCES Vendedor(cpf),
	 carro TEXT REFERENCES CRLV(renavam),
	 arquivado_em TEXT REFERENCES Arquivo(id_arquivo),
	 data_venda DATE,
  	 preco_venda FLOAT
);




INSERT INTO gerente(cpf, nome, sala, salario_bruto)
VALUES ('99199199199', 'gerente chefe roberto', 'sala dos fundos', 9999.99);

INSERT INTO gerente(cpf, nome,cpf_gerente, sala, salario_bruto)
VALUES ('99199199191', 'gerente Kleber','99199199199', 'sala da frente', 6666.66);

INSERT INTO gerente(cpf, nome,cpf_gerente, sala, salario_bruto)
VALUES ('99199199192', 'gerente mario','99199199199', 'sala da frente', 6666.66);

INSERT INTO gerente(cpf, nome, cpf_gerente,sala, salario_bruto)
VALUES ('99199199193', 'gerente gama','99199199199', 'sala da frente', 6666.66);

INSERT INTO gerente(cpf, nome, cpf_gerente,sala, salario_bruto)
VALUES ('99199199194', 'gerente waldemar','99199199199', 'sala da frente', 6666.66);


INSERT INTO placa(numero, uf)
VALUES ('bkt3826', 'SP');

INSERT INTO placa (numero, uf)
VALUES ('htn5972', 'MG');

INSERT INTO placa (numero, uf)
VALUES ('xyz1234', 'RJ');

INSERT INTO placa (numero, uf)
VALUES ('abc5678', 'RS');

INSERT INTO placa (numero, uf)
VALUES ('qwe7890', 'PR');

INSERT INTO placa (numero, uf)
VALUES ('mnb4567', 'SC');

INSERT INTO placa (numero, uf)
VALUES ('def1234', 'SP');

INSERT INTO placa (numero, uf)
VALUES ('pqr5678', 'RJ');

INSERT INTO placa (numero, uf)
VALUES ('uvw9012', 'MG');

INSERT INTO placa (numero, uf)
VALUES ('ghi3456', 'RS');

INSERT INTO placa (numero, uf)
VALUES ('jkl7890', 'PR');


INSERT INTO vendedor(cpf, nome, cpf_gerente, salario_bruto, comissao)
VALUES ('12944237357', 'rosangela', '99199199194', 1500.98, 0);

INSERT INTO vendedor(cpf, nome, cpf_gerente, salario_bruto, comissao)
VALUES ('98765432100', 'Fernando', '99199199194', 2500.00, 0);

INSERT INTO vendedor(cpf, nome, cpf_gerente, salario_bruto, comissao)
VALUES ('54321098700', 'Carolina', '99199199193', 1800.50, 0);

INSERT INTO vendedor(cpf, nome, cpf_gerente, salario_bruto, comissao)
VALUES ('16122273344', 'Rafael', '99199199193', 2000.75, 0);


INSERT INTO auxiliar(cpf, nome, cpf_gerente, salario_bruto, carros_lavados)
VALUES ('82387462483', 'ze da manga','99199199192', 1200.45, 0);

INSERT INTO auxiliar(cpf, nome, cpf_gerente, salario_bruto, carros_lavados)
VALUES ('38476523978', 'Ana Silva', '99199199192', 1100.75, 0);

INSERT INTO auxiliar(cpf, nome, cpf_gerente, salario_bruto, carros_lavados)
VALUES ('69234871625', 'Pedro Santos', '99199199191', 1300.90, 0);

INSERT INTO auxiliar(cpf, nome, cpf_gerente, salario_bruto, carros_lavados)
VALUES ('97845612345', 'Mariana Oliveira', '99199199191', 1150.60, 0);


INSERT INTO arquivo(id_arquivo, localizacao, tipo)
VALUES ('id1', 'local1', 'carro1');

INSERT INTO arquivo(id_arquivo, localizacao, tipo)
VALUES ('id2', 'local2', 'carros comprados');

INSERT INTO arquivo(id_arquivo, localizacao, tipo)
VALUES ('id3', 'local3', 'carros vendidos');

INSERT INTO arquivo(id_arquivo, localizacao, tipo)
VALUES ('id4', 'local de venda 222', 'carro');


INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Ronivaldo', '12312312312', '2000-08-05', 'cnh316497');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Roberval', '32132132132', '2001-02-03', 'cnh738291');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('João Kleber', '333111222333', '1992-06-01', 'cnh789654');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Lucas', '44477744421', '1994-04-04', 'cnh857496');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Kleber', '33366655589', '1997-05-09', 'cnh737377');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Rodrigo', '67890123456', '1997-01-23', 'cnh678901');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Fernanda', '23456789012', '1988-08-17', 'cnh234567');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Carlos', '90123456789', '1991-11-06', 'cnh901234');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Mariana', '34567890123', '1996-03-28', 'cnh345678');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Pedro', '78901234567', '1992-07-11', 'cnh789012');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Ana', '56789123450', '1998-12-20', 'cnh567891');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('João', '98765432109', '1985-09-02', 'cnh987654');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('Maria', '12345678910', '1990-05-15', 'cnh123456');

INSERT INTO cliente (nome, cpf, data_nascimento, cnh)
VALUES ('mario', '10101010101', '1991-01-10', 'cnh101010');


INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('sao paulo', 'orlandia', 'av 4', 'centro', 1137, '10101010101');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('sao paulo', 'orlandia', 'av 4', 'centro', 1137, '12312312312');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('minas gerais', 'monte carmelo', 'rua inconfidencia', 'cidade jardim', 203, '32132132132');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('Sao paulo', 'Ribeirao Preto', 'rua lafaiete', 'centro', 103, '333111222333');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('Minas Gerais', 'Monte Carmelo', 'avenida da imprensa', 'boa vista', 303, '44477744421');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('Minas Gerais', 'Monte Carmelo', 'rua genoveva', 'santa rita', 999, '33366655589');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('São Paulo', 'Ribeirao Preto', 'Rua das Flores', 'Bairro Primavera', 1562, '67890123456');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('São Paulo', 'Franca', 'Rua dos Sonhos', 'Bairro Esperança', 1356, '23456789012');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('São Paulo', 'Jardinopolis', 'Rua do Sol', 'Bairro Solar', 224, '90123456789');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('São Paulo', 'Olimpia', 'Rua da Amizade', 'Bairro Harmonia', 51, '34567890123');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('São Paulo', 'Nuporanga', 'Rua do Lago', 'Bairro Sereno', 3478, '78901234567');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('São Paulo', 'Ribeirao Preto', 'Rua das Estrelas', 'Bairro Celestial', 241, '56789123450');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('São Paulo', 'Araraquara', 'Rua do Bosque', 'Bairro Verdejante', 876, '98765432109');

INSERT INTO endereco (estado, cidade, rua, bairro, numero, cliente)
VALUES ('São Paulo', 'Sertaozinho', 'Rua da Paz', 'Bairro Tranquilidade', 695, '12345678910');


INSERT INTO crlv(proprietario, renavam, placa, marca, modelo, arquivado_em, ano_fabricacao, ano_modelo, cor)
VALUES ('wesley', 'numero_renavam_1', 'bkt3826', 'volvo', 'sedan', 'id1', 2011, 2012, 'branco');

INSERT INTO crlv (proprietario, renavam, placa, marca, modelo, arquivado_em, ano_fabricacao, ano_modelo, cor)
VALUES ('carlos', 'numero_renavam_2', 'htn5972', 'ford', 'hatchback', 'id1', 2015, 2016, 'preto');

INSERT INTO crlv (proprietario, renavam, placa, marca, modelo, arquivado_em, ano_fabricacao, ano_modelo, cor)
VALUES ('ana', 'numero_renavam_3', 'xyz1234', 'chevrolet', 'suv', 'id1', 2020, 2021, 'vermelho');

INSERT INTO crlv (proprietario, renavam, placa, marca, modelo, arquivado_em, ano_fabricacao, ano_modelo, cor)
VALUES ('maria', 'numero_renavam_4', 'abc5678', 'fiat', 'compacto', 'id1', 2018, 2019, 'azul');

INSERT INTO crlv (proprietario, renavam, placa, marca, modelo, arquivado_em, ano_fabricacao, ano_modelo, cor)
VALUES ('joão', 'numero_renavam_5', 'qwe7890', 'renault', 'seda', 'id1', 2017, 2018, 'prata');

INSERT INTO crlv (proprietario, renavam, placa, marca, modelo, arquivado_em, ano_fabricacao, ano_modelo, cor)
VALUES ('pedro', 'numero_renavam_6', 'mnb4567', 'honda', 'crossover', 'id1', 2019, 2020, 'cinza');

INSERT INTO crlv (proprietario, renavam, placa, marca, modelo, arquivado_em, ano_fabricacao, ano_modelo, cor)
VALUES ('fernanda', 'numero_renavam_7', 'def1234', 'toyota', 'suv', 'id1', 2022, 2023, 'branco');

INSERT INTO crlv (proprietario, renavam, placa, marca, modelo, arquivado_em, ano_fabricacao, ano_modelo, cor)
VALUES ('rafael', 'numero_renavam_8', 'jkl7890', 'volkswagen', 'sedan', 'id1', 2014, 2015, 'verde');


INSERT INTO documento_compra(id_doc, carro_comprado, arquivado_em, cliente_vendedor, observacao, preco_compra, data_compra)
VALUES ('id1_doc_compra', 'numero_renavam_1', 'id1','12312312312', 'obs venda_1', 24300.85,'2023-06-06');

INSERT INTO documento_compra (id_doc, carro_comprado, arquivado_em, cliente_vendedor, observacao, preco_compra, data_compra)
VALUES ('id2_doc_compra', 'numero_renavam_2', 'id1', '23456789012', 'obs venda_2', 18500.75,'2023-05-05');

INSERT INTO documento_compra (id_doc, carro_comprado, arquivado_em, cliente_vendedor, observacao, preco_compra, data_compra)
VALUES ('id3_doc_compra', 'numero_renavam_3', 'id1', '90123456789', 'obs venda_3', 31500.50,'2023-01-25');

INSERT INTO documento_compra (id_doc, carro_comprado, arquivado_em, cliente_vendedor, observacao, preco_compra, data_compra)
VALUES ('id4_doc_compra', 'numero_renavam_4', 'id1', '34567890123', 'obs venda_4', 25000.00,'2023-02-02');

INSERT INTO documento_compra (id_doc, carro_comprado, arquivado_em, cliente_vendedor, observacao, preco_compra, data_compra)
VALUES ('id5_doc_compra', 'numero_renavam_5', 'id1', '78901234567', 'obs venda_5', 19800.25,'2023-06-01');

INSERT INTO documento_compra (id_doc, carro_comprado, arquivado_em, cliente_vendedor, observacao, preco_compra, data_compra)
VALUES ('id6_doc_compra', 'numero_renavam_6', 'id1', '333111222333', 'obs venda_6', 22000.00,'2022-07-23');

INSERT INTO documento_compra (id_doc, carro_comprado, arquivado_em, cliente_vendedor, observacao, preco_compra, data_compra)
VALUES ('id7_doc_compra', 'numero_renavam_7', 'id1', '98765432109', 'obs venda_7', 28000.50,'2022-11-25');

INSERT INTO documento_compra (id_doc, carro_comprado, arquivado_em, cliente_vendedor, observacao, preco_compra, data_compra)
VALUES ('id8_doc_compra', 'numero_renavam_8', 'id1', '12345678910', 'obs venda_8', 19500.75,'2023-03-05');


INSERT INTO carro(n_documento,placa, doc_compra, descricao, preco_anunciado)
VALUES ('numero_renavam_1','bkt3826', 'id1_doc_compra', 'Carro Sedan', 25000.00);

INSERT INTO carro(n_documento,placa, doc_compra, descricao, preco_anunciado)
VALUES ('numero_renavam_2','htn5972', 'id2_doc_compra', 'Carro Hatchback', 18000.00);

INSERT INTO carro(n_documento,placa, doc_compra, descricao, preco_anunciado)
VALUES ('numero_renavam_3','xyz1234', 'id3_doc_compra', 'Carro SUV', 35000.00);

INSERT INTO carro(n_documento,placa, doc_compra, descricao, preco_anunciado)
VALUES ('numero_renavam_4','abc5678', 'id4_doc_compra', 'Carro Esportivo', 50000.00);


INSERT INTO documento_venda(id_venda, cliente, vendedor, carro, arquivado_em, data_venda, preco_venda)
VALUES ('id_venda_1','12312312312', '98765432100', 'numero_renavam_1', 'id1', '2023-04-06',16666.54);

INSERT INTO documento_venda(id_venda, cliente, vendedor, carro, arquivado_em, data_venda, preco_venda)
VALUES ('id_venda_2', '32132132132', '54321098700', 'numero_renavam_2', 'id1', '2023-05-12',30211.22);

INSERT INTO documento_venda(id_venda, cliente, vendedor, carro, arquivado_em, data_venda, preco_venda)
VALUES ('id_venda_3', '333111222333', '54321098700', 'numero_renavam_3', 'id1', '2023-06-20',45888.54);

INSERT INTO documento_venda(id_venda, cliente, vendedor, carro, arquivado_em, data_venda, preco_venda)
VALUES ('id_venda_4', '44477744421', '16122273344', 'numero_renavam_4', 'id1', '2023-07-15',88546.45);


INSERT INTO lavados(cpf_aux, veiculo, id_lavada, data_lavada)
VALUES ('82387462483', 'jkl7890', '1', '2023-06-01');
INSERT INTO lavados(cpf_aux, veiculo, id_lavada, data_lavada)
VALUES ('97845612345', 'uvw9012', '2', '2023-06-01');
INSERT INTO lavados(cpf_aux, veiculo, id_lavada, data_lavada)
VALUES ('97845612345', 'uvw9012', '3', '2023-06-01');

/*Todos os Funcionarios da Loja*/
SELECT nome, cpf
FROM Gerente
UNION
SELECT nome, cpf
FROM Auxiliar
UNION
SELECT nome, cpf
FROM Vendedor;

/*retorna o nome dos vendedores e seus respectivos gerentes*/
SELECT vendedor.nome, vendedor.cpf, gerente.nome, gerente.cpf
FROM vendedor
JOIN gerente ON Vendedor.cpf_gerente = gerente.cpf;

/*Selecionando o nome dos clientes que tem endereco em Ribeirao Preto*/
SELECT nome
FROM Cliente
WHERE cpf IN (
    SELECT cliente
    FROM Endereco
    WHERE LOWER(Endereco.cidade) = 'ribeirao preto'
);

/*Todos os auxiliares que não lavaram carros ainda*/
SELECT nome
FROM Auxiliar
WHERE NOT EXISTS (
    SELECT cpf_aux
    FROM Lavados
    WHERE Lavados.cpf_aux = Auxiliar.cpf
);

/*Selecionar todas as placas (numero e UF) dos carros que foram vendidos em Abril*/
SELECT numero,UF
FROM Placa
INNER JOIN(
SELECT CRLV.placa
FROM CRLV
INNER JOIN Documento_venda 
ON Documento_venda.carro = crlv.renavam 
WHERE TO_CHAR(Documento_venda.data_venda,'MM') LIKE '04') as Consulta
ON Placa.numero = Consulta.placa;

/*Vendedores que ainda não venderam nada nesse mês (junho)*/
SELECT cpf
FROM Vendedor
EXCEPT
SELECT vendedor
FROM Documento_venda
WHERE TO_CHAR(Documento_venda.data_venda,'MM') LIKE '06';

/*Unir os dois documentos (compra e venda) para descobrir a história completa do carro*/
SELECT *
FROM Documento_venda
RIGHT OUTER JOIN Documento_compra
ON Documento_venda.carro = Documento_compra.carro_comprado;


/*retornar o lucro de determinado mes 
somando o preço do total de carros comprados e 
subtraindo com o preço do total de carros vendidos
naquele periodo de tempo
A funcao EXTRACT é usada para extrair parte de uma data.*/

SELECT SUM(Documento_Venda.preco_venda) - SUM(Documento_Compra.preco_compra) AS lucro
FROM Documento_Venda
LEFT JOIN Documento_Compra ON Documento_Venda.carro = Documento_Compra.carro_comprado
WHERE EXTRACT(YEAR FROM Documento_Venda.data_venda) = 2023 AND 
EXTRACT(MONTH FROM Documento_Venda.data_venda) = 6;



/*Deleta os carros que foram vendidos (estao na tabela documento venda)*/
DELETE FROM Carro
WHERE n_documento IN (
    SELECT n_documento
    FROM documento_venda
);

/*Deleta endereco do cliente de cpf "10101010101"*/
DELETE FROM endereco
WHERE cliente = '10101010101'

/*Atualiza o endereco do clinte*/
UPDATE endereco
SET estado = 'sao paulo', cidade = 'sao joaquim', rua = 'rua 2', bairro = 'centro', numero = 222, cliente = '10101010101'
WHERE cliente = '10101010101'

/*Deleta os auxiliares que nao lavaram nenhum carro no mes 6*/
DELETE FROM Auxiliar
WHERE auxiliar.cpf NOT IN (
    SELECT cpf_aux
    FROM Lavados
    WHERE EXTRACT(MONTH FROM data_lavada) = 6
);

/*Atualiza todos os documentos_venda para serem guardados no arquivo 3*/
UPDATE Documento_venda
SET arquivado_em = 'id3'

/*Armazena os carros com placa par no arquivo 2*/
UPDATE Documento_Compra
SET arquivado_em = 'id2'
WHERE carro_comprado IN (
    SELECT n_documento 
	FROM Carro
    WHERE placa IN (
        SELECT numero 
		FROM Placa
        WHERE numero LIKE '%0' OR 
			  numero LIKE '%2' OR 
		 	  numero LIKE '%4' OR 
			  numero LIKE '%6' OR 
			  numero LIKE '%8'
	)
);

/*O GERENTE ENDOIDOU - comando para abaixar 1000 do preco de todos os carros*/
UPDATE carro
SET preco_anunciado = preco_anunciado - 1000;








