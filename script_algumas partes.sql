-- 1ª modificação) Excluir banco de dados, pois faltou o atributo 'estado' nas tabelas que solicitam dados dos clientes;

DROP DATABASE faculdade_nova_geração;

-- 2ª modificação) Excluir banco de dados, pois o nome na modelagem ficou com acento;

DROP DATABASE faculdade_nova_geração;

-- 3ª modificação)Excluir banco de dados: 'bairro' ficou com poucos caracteres e digitos de CPF e CEP foram padronizados;

DROP DATABASE faculdade_nova_geracao;

-- 4ª modificação) Excluir atributo 'quant_disc_matriculadas', visto que não há necessidade.

DROP DATABASE faculdade_nova_geracao;

USE faculdade_nova_geracao;

INSERT INTO alunos(nome, rua_numero, bairro, cep, municipio, estado, cpf) 
	VALUES ('Josefina da Silva', 'Rua das Flores, 49','Cohab A ', '95487565', 'Cachoeirinha', 'RS', '00746987123');
    
SELECT * FROM alunos;

INSERT INTO alunos(nome, rua_numero, bairro, cep, municipio, estado, cpf) 
	VALUES ('Jaqueline Cella Schardosim', 'Rua Imigrante, 911','Parque da Matriz ', '98794687', 'Gravataí', 'RS', '21168332417');
    
INSERT INTO alunos(nome, rua_numero, bairro, cep, municipio, estado, cpf) 
	VALUES ('Carmem Balen', 'Rua dos Apóstolos, 247','Morada dos Gaúchos ', '95874638', 'Alvorada', 'RS', '5879456827'); 
    
INSERT INTO alunos(nome, rua_numero, bairro, cep, municipio, estado, cpf) 
	VALUES ('Joelson Farias', 'Rua Andorinhas, 521','Ingleses ', '95874368', 'Cachoeirinha', 'RS', '00758744215');    

UPDATE alunos SET cpf= 58794568278 WHERE id = 3;

INSERT INTO contatos(nome, rua_numero, bairro, cep, municipio, estado, cpf) 
	VALUES ('Giovani Souza', 'Rua Itália, 21','Centro ', '95784476', 'Cachoeirinha', 'RS', '00856987142');  
    
 SELECT * FROM contatos;   
 
 INSERT INTO contatos(nome, rua_numero, bairro, cep, municipio, estado, cpf) 
	VALUES ('Guilherme Arantes', 'Rua Pandora, 68','Centro ', '95887632', 'Cachoeirinha', 'RS', '00528744972');
    
 INSERT INTO contatos(nome, rua_numero, bairro, cep, municipio, estado, cpf) 
	VALUES ('Antônio de Jesus', 'Rua Bandeirantes, 630','Nova Roma ', '95589663', 'Gravataí', 'RS', '00236553487');
    
INSERT INTO contatos(nome, rua_numero, bairro, cep, municipio, estado, cpf) 
	VALUES ('João Prestes', 'Rua Candeias, 239','Médici', '9469874', 'Porto Alegre', 'RS', '32566328749');    
    
INSERT INTO cursos(nome_curso, data_inicio, quant_semestres) VALUES ('Ciências da Computação', '2022-02-14','8');     

SELECT * FROM cursos;  
    
INSERT INTO cursos(nome_curso, data_inicio, quant_semestres) VALUES ('Ciências de Dados', '2022-02-14','5');

INSERT INTO cursos(nome_curso, data_inicio, quant_semestres) VALUES ('Banco de Dados', '2022-08-01','5');

INSERT INTO cursos(nome_curso, data_inicio, quant_semestres) VALUES ('Análise e Desenvolvimento de Sistemas', '2022-02-14','8');

SELECT nome_curso, quant_semestres FROM cursos;

INSERT INTO disciplinas(nome, dias_da_semana) VALUES ('Lógica e Técnicas de Programação', 'terça-feira');

SELECT * FROM disciplinas;

INSERT INTO disciplinas(nome, dias_da_semana) VALUES ('Estatística', 'sexta-feira');

INSERT INTO disciplinas(nome, dias_da_semana) VALUES ('Estatística e Probabilidade', 'quarta-feira');

INSERT INTO disciplinas(nome, dias_da_semana) VALUES ('Banco de Dados Relacional', 'segunda-feira');

INSERT INTO disciplinas(nome, dias_da_semana) VALUES ('Linguagens de Programação Geral', 'quinta-feira');

INSERT INTO disciplinas(nome, dias_da_semana) VALUES ('Programação na Nuvem', 'segunda-feira');

INSERT INTO tipos_bolsa(nome_bolsa, desconto) VALUES ('Aluno Nota 10', '2');

SELECT * FROM tipos_bolsa;

INSERT INTO tipos_bolsa(nome_bolsa, desconto) VALUES ('PROUNI', '50');

INSERT INTO tipos_bolsa(nome_bolsa, desconto) VALUES ('PROUNI', '100');

INSERT INTO tipos_bolsa(nome_bolsa, desconto) VALUES ('Segunda Graduação', '5');

UPDATE tipos_bolsa SET desconto= 10 WHERE id= 1;

UPDATE tipos_bolsa SET desconto= 15 WHERE id= 4;

UPDATE tipos_bolsa SET desconto= 100 WHERE id= 3;

SELECT * FROM vendedores;

INSERT INTO vendedores(nome, cpf) VALUES ('Osmildo Ferreira', '98725887411');

INSERT INTO vendedores(nome, cpf) VALUES ('Jorge Teixeira Souza', '95875874596');

INSERT INTO vendedores(nome, cpf) VALUES ('Cenira Gutosky', '00325644871');

INSERT INTO vendedores(nome, cpf) VALUES ('Maria Rosa', '98725887411');

SELECT * FROM clientes_potenciais;

INSERT INTO clientes_potenciais(cursos_id, contatos_id) VALUES (1,2);

INSERT INTO clientes_potenciais(cursos_id, contatos_id) VALUES (2,3);

UPDATE clientes_potenciais SET id=3 WHERE id=4;

INSERT INTO clientes_potenciais(cursos_id, contatos_id) VALUES (4,4);

SELECT * FROM comissoes;

INSERT INTO comissoes(cursos_id, vendedores_id, valor_comissao,quant_cursos_vendidos)
	VALUES (2, 2, 200.00, 8 );
    
INSERT INTO comissoes(cursos_id, vendedores_id, valor_comissao,quant_cursos_vendidos)
	VALUES (4, 3, 200.00, 12 );    
    
INSERT INTO comissoes(cursos_id, vendedores_id, valor_comissao,quant_cursos_vendidos)
	VALUES (3, 1, 200.00, 6 );

INSERT INTO comissoes(cursos_id, vendedores_id, valor_comissao,quant_cursos_vendidos)
	VALUES (3, 1, 200.00, 6 );
    
INSERT INTO comissoes(cursos_id, vendedores_id, valor_comissao,quant_cursos_vendidos)
	VALUES (4, 1, 200.00, 2 );
   
INSERT INTO comissoes(cursos_id, vendedores_id, valor_comissao,quant_cursos_vendidos)
	VALUES (1, 3, 200.00, 7 );    
    
SELECT id, cursos_id, vendedores_id, valor_comissao, quant_cursos_vendidos
	FROM comissoes ORDER BY vendedores_id ASC;
    
DELETE FROM comissoes WHERE id= 4;   

SELECT id, cursos_id, vendedores_id, valor_comissao, quant_cursos_vendidos
	FROM comissoes ORDER BY id ASC;
    
 UPDATE comissoes SET id=4 WHERE id=5;   
 
 UPDATE comissoes SET id=5 WHERE id=6; 
 
 UPDATE comissoes SET cursos_id=1 WHERE id=2;
 
 SELECT * FROM comissoes;
    
 SELECT * FROM cursos_valores;   
 
 INSERT INTO cursos_valores (cursos_id, disciplinas_id, preco_disciplina) VALUES (2, 1,200.00);
 
  INSERT INTO cursos_valores (cursos_id, disciplinas_id, preco_disciplina) VALUES (2, 2,200.00);
  
 INSERT INTO cursos_valores (cursos_id, disciplinas_id, preco_disciplina) VALUES (2, 3,200.00);
 
INSERT INTO cursos_valores (cursos_id, disciplinas_id, preco_disciplina) VALUES (2, 5,200.00); 

  
SELECT * FROM alunos_disciplinas;

INSERT INTO alunos_disciplinas(alunos_id, disciplinas_id,situacao)
	VALUES(2, 1, 'em andamento');
 
INSERT INTO alunos_disciplinas(alunos_id, disciplinas_id,situacao)
	VALUES(2, 4, 'em andamento'); 
    
 INSERT INTO alunos_disciplinas(alunos_id, disciplinas_id,situacao)
	VALUES(2, 1, 'em andamento');  
   
  INSERT INTO alunos_disciplinas(alunos_id, disciplinas_id,situacao)
	VALUES(2, 1, 'em andamento');   
    
UPDATE alunos_disciplinas SET disciplinas_id=3 WHERE id=4;

INSERT INTO alunos_disciplinas(alunos_id, disciplinas_id,situacao)
	VALUES(2, 5, 'em andamento');  
 
INSERT INTO alunos_disciplinas(alunos_id, disciplinas_id,situacao)
	VALUES(2, 3, 'em andamento');   
    
INSERT INTO alunos_disciplinas(alunos_id, disciplinas_id,situacao)
	VALUES(4, 5, 'em andamento');   
    
INSERT INTO alunos_disciplinas(alunos_id, disciplinas_id,situacao)
	VALUES(4, 2, 'em andamento');     
    
INSERT INTO alunos_disciplinas(alunos_id, disciplinas_id,situacao)
	VALUES(4, 1, 'em andamento');    
    
INSERT INTO alunos_disciplinas(alunos_id, disciplinas_id,situacao)
	VALUES(4, 4, 'cancelada');     
    
SELECT * FROM bolsa;

INSERT INTO bolsa (tipos_bolsa_id, quantidade, alunos_id) VALUES (2,1,4);

INSERT INTO bolsa (tipos_bolsa_id, quantidade, alunos_id) VALUES (1,1,3);

INSERT INTO bolsa (tipos_bolsa_id, quantidade, alunos_id) VALUES (3,1,1);

SELECT * FROM matriculas;

INSERT INTO matriculas(alunos_id, cursos_id, data_matricula, status_matricula, numero_matricula)
	VALUES (2, 1, '2022-01-10','ativa', '12');
    
INSERT INTO matriculas(alunos_id, cursos_id, data_matricula, status_matricula, numero_matricula)
	VALUES (3, 2, '2022-01-15','ativa', '14');
   
INSERT INTO matriculas(alunos_id, cursos_id, data_matricula, status_matricula, numero_matricula)
	VALUES (4, 3, '2022-01-03','cancelada', '15'); 
    
UPDATE  matriculas SET numero_matricula=4 WHERE id=7; 

UPDATE matriculas SET id=2 WHERE id=5;

UPDATE matriculas SET id=3 WHERE id=7;

SELECT * FROM disciplinas;

SHOW DATABASES;
    
    



 
 
 
 
    
    
    










    
    
 
 
