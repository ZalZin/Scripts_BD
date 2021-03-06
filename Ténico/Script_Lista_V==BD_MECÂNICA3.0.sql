#BD Mecanica 3.0
/*
-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-
O script Ficou muito extenso, por isso esta separado em blocos.
antes de cada bloco esta uma anotação seguida poelo começo de uma anotação de multiplas linhas,
basta tirar a anotação(#) para poder minimizar os blocos.
Recomendo que rode um bloco por vez(o mysql geralmente para de responder se rodar o Script Completo).
-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-LER-
*/

#bloco com a criação do Banco
#/*
drop database if exists bd_mecanica;
create database bd_mecanica;
use bd_mecanica;


create table Estado (
cod_est int not null primary key auto_increment,
nome_est varchar (200) not null,
sigla_est varchar (2)
);

insert into Estado values (null, 'Acre', 'AC');
insert into Estado values (null, 'Alagoas', 'AL');
insert into Estado values (null, 'Amapá','AP');
insert into Estado values (null, 'Amazonas','AM');
insert into Estado values (null, 'Bahia','BA');
insert into Estado values (null, 'Ceara','CE');
insert into Estado values (null, 'Distrito Federal','DF');
insert into Estado values (null, 'Espírito Santo','ES');
insert into Estado values (null, 'Goiás','GO');
insert into Estado values (null, 'Maranhão','MA');
insert into Estado values (null, 'Mato Grosso','MT');
insert into Estado values (null, 'Mato Grosso do Sul','MS');
insert into Estado values (null, 'Minas Gerais','MG');
insert into Estado values (null, 'Pará','PA');
insert into Estado values (null, 'Paraíba','PB');
insert into Estado values (null, 'Paraná','PR');
insert into Estado values (null, 'Pernambuco','PE');
insert into Estado values (null, 'Piauí','PI');
insert into Estado values (null, 'Rio de Janeiro','RJ');
insert into Estado values (null, 'Rio Grande do Norte','RN');
insert into Estado values (null, 'Rio Grande do Sul','RS');
insert into Estado values (null, 'Rondônia','RO');
insert into Estado values (null, 'Roraima','RR');
insert into Estado values (null, 'Santa Catarina','SC');
insert into Estado values (null, 'São Paulo','SP');
insert into Estado values (null, 'Sergipe','SE');
insert into Estado values (null, 'Tocantins','TO');


create table cidade (
cod_cid int not null primary key auto_increment,
nome_cid varchar (200) not null,
cod_est int,
foreign key (cod_est) references Estado (cod_est)
);

insert into cidade values (null, 'Ji-Paraná', 22);
insert into cidade values (null, 'Porto Velho', 22);
insert into cidade values (null, 'Vilhena', 22);
insert into cidade values (null, 'Ariquemes', 22);
insert into cidade values (null, 'Jaru', 22);
insert into cidade values (null, 'Guajará-Mirim ', 22);
insert into cidade values (null, 'Colorado do Oeste', 22);
insert into cidade values (null, 'Ouro Preto do Oeste', 22);
insert into cidade values (null, 'Pimenta Bueno', 22);
insert into cidade values (null, 'Rio Branco', 1);
insert into cidade values (null, 'São Paulo', 25);
insert into cidade values (null, 'Manaus', 4);


create table Endereco (
cod_end integer not null primary key auto_increment,
rua_end varchar (300),
numero_end integer,
bairro_end varchar (100),
cod_cid int not null,
foreign key (cod_cid) references Cidade (cod_cid)
); 

insert into Endereco values (null, 'Av. Brasil', 111, 'Nova Brasília', 1);
insert into Endereco values (null, 'Av. Marechal Rondon', 1245, 'Centro', 1);
insert into Endereco values (null, 'Rua Dr. Telma Rios', 1174, 'Colina Park I', 1);
insert into Endereco values (null, 'Av. Aracaju', 911, 'BNH', 1);
insert into Endereco values (null, 'Rua 07 de Setembro', 121,'Centro',  1);
insert into Endereco values (null, 'Rua Mato Grosso', 887, 'Dom Bosco', 1);
insert into Endereco values (null, 'Av. Jorge Teixeira', 1589, 'Centro', 2);
insert into Endereco values (null, 'Av. Paulista', 989, 'Centro', 11);
insert into Endereco values (null, 'Travessa dos Mineiros', 456, 'Centro', 4);
insert into Endereco values (null, 'Av. Monte Castelo', 555, 'Jardim dos Migrantes', 1);
insert into Endereco values (null, 'Av. Aracaju', 5111, 'Nova Brasilia', 1);
insert into Endereco values (null, 'Av. Monte Castelo', 9999, 'Jardim dos Migrantes', 1);
insert into Endereco values (null, 'Rua X', 12, 'Jardim dos Migrantes', 1);
insert into Endereco values (null, 'K-0', 522, 'São Francisco', 1);
insert into Endereco values (null, 'Av. Monte Castelo', 11229, 'Jardim dos Migrantes', 1);


create table Sexo (
cod_sex int not null primary key auto_increment,
nome_sex varchar (100) not null
);

insert into Sexo values (null, 'Masculino');
insert into Sexo values (null, 'Feminino');


create table Cliente (
cod_cli integer not null primary key auto_increment,
nome_cli varchar (200) not null,
estadocivil_cli varchar (50),
cpf_cli varchar (20) not null,
rg_cli varchar (30),
datanasc_cli date,
rendafamiliar_cli float,
telefone_cli varchar (50),
celular_cli varchar (50) not null,
cod_sex integer not null,
cod_end integer not null,
foreign key (cod_sex) references Sexo (cod_sex),
foreign key (cod_end) references Endereco (cod_end)
);

insert into cliente values (null, 'Rodrigo Hilbert', 'Casado', '111.111.111-11', '54654 sesdec', '1987-06-30', 10000.00, '69 84085712', '69 84111111', 1, 3);
insert into cliente values (null, 'Tiago Lacerda', 'Casado', '111.111.111-22', '54654 sesdec',  '1965-1-1', 456454.45, '', '', 1, 8);
insert into cliente values (null, 'Tom Cruise', 'Solteiro', '111.111.111-33', '48877 sesdec',  '1950-05-30', 0.00, '11 454546511', '', 1, 1);
insert into cliente values (null, 'José Pereiro da Silva', 'Casado', '222.222.222-88', '8888888 spp',  '1990-11-12', 900.00, '69 88998899', '69 4444 4444', 1, 4);
insert into cliente values (null, 'Maria de Jesus dos Santos', 'Solteira', '554.454.444-99', '99999 sesdec',  '1993-06-21', 3000.00, '69 3421 5511', '69 99111111', 2, 3);
insert into cliente values (null, 'Camila de Oliveira', 'Casada', '987.123.654-55', '8889999 sesdec',  '2000-12-12', 5450.00, '69 3421 1122', '69 9999 7788', 2, 10);
insert into cliente values (null, 'Marcos Araujo de Souza', 'Casado', '654.789.123-88', '998877 sesdec',  '1970-01-01', 6845.00, '69 84085712', '69 84111111', 1, 9);
insert into cliente values (null, 'Cleiton Batista Ferraz', 'Solteiro', '321.111.222-44', '1234312 sesdec',  '1982-07-30', 4199.00, '69 3421 2211', '69 84118811', 1, 2);
insert into cliente values (null, 'Eliana da Cruz', 'Solteira', '988.235.654-54', '12345 sesdec',  '1978-11-11', 3250.00, '69 3421 9999', '69 84118811', 2, 5);
insert into cliente values (null, 'Igor Garcia da Silva', 'Solteiro', '123.445.888-99', '999992 sesdec',  '1989-12-30', 9600.00, '69 3421 1123', '69 84118811', 1, 11);
insert into cliente values (null, 'Jackson Henrique da Silva Bezerra', 'Casado', '529.562.612-15', '880075 sesdec',  '1987-06-30', 11000.00, '', '69 84085712', 1, 3);
insert into cliente values (null, 'Jaqueline Leão Pereira', 'Casada', '522.222.153-15', '12315 sesdec', '1993-06-21', 11000.00, null, '69 984210921', 2, 3);
insert into cliente values (null, 'Gleicy Borgio', 'Casada', '126.777.888-99', null, null, 5000.00, null, '69 84888899', 2, 11);
insert into cliente values (null, 'Diego da Silva Bezerra', 'Solteiro', '111.987.123-55', null, null, 3999.99, null, '69 88997722', 1, 15);
insert into cliente values (null, 'Murilo Benicio', 'Casado', '321.123.321-55', null, null, 2450.80, null, '11 2121 1111', 1, 8);


create table Carro (
cod_car int primary key not null auto_increment,
modelo_car varchar (100) not null,
cor_car varchar (50) not null,
portas_car varchar (50),
placa_car varchar (50) not null,
marcar_car varchar (50) not null,
cod_cli int not null,
foreign key (cod_cli) references Cliente (cod_cli)
);

insert into carro values (null, 'Gol 1.0', 'preto', '4 portas', 'ndr 2815', 'Volkswagen', 1);
insert into carro values (null, 'Palio 1.0', 'branco', '4 portas', 'nea 1231', 'Fiat', 2);
insert into carro values (null, 'Gol 1.0', 'preto', '4 portas', 'wat 1254', 'Volkswagen', 3);
insert into carro values (null, 'S-10', 'prata', '2 portas', 'eae 2815', 'GM', 4);
insert into carro values (null, 'Celta Spirit 1.0', 'branco', '4 portas', 'ndd 2815', 'GM', 5);
insert into carro values (null, 'Celta Life 1.0', 'vermelho', '2 portas', 'mra 1288', 'GM', 6);
insert into carro values (null, 'Hilux 2.4', 'prata', '4 portas', 'rtu 3498', 'Toyota', 7);
insert into carro values (null, 'Prisma LTZ', 'branco', '4 portas', 'oip 1231', 'GM', 8);
insert into carro values (null, 'Hilux 2.4', 'branco', '4 portas', 'asd 1234', 'Toyota', 9);
insert into carro values (null, 'HB-20', 'preto', '4 portas', 'ndt 1155', 'Hunday', 10);
insert into carro values (null, 'Hilux 2.4', 'prata', '4 portas', 'noo 2010', 'Toyota', 1);
insert into carro values (null, 'Gol 1.6', 'branco', '4 portas', 'nnd 2066', 'Volkswagen', 7);
insert into carro values (null, 'Cruze LTZ 1.8', 'preto', '4 portas', 'ndm 2819', 'GM', 11);
insert into carro values (null, 'Cruze LTZ 1.8', 'branco', '4 portas', 'nra 2233', 'GM', 5);
insert into carro values (null, 'Celta Spirit 1.0', 'branco', '4 portas', 'ndr 2233', 'GM', 12);


create table Departamento (
cod_dep integer not null primary key auto_increment,
nome_dep varchar (100),
descrição_dep varchar (300)
);

insert into Departamento values (null, 'Vendas', 'Venda de peças e serviços');
insert into Departamento values (null, 'Financeiro', 'Controle Financeiro e Caixa');
insert into Departamento values (null, 'Entrega', 'Entregar peças');
insert into Departamento values (null, 'Mecânica', 'Realizar manutenção em veículos');
insert into Departamento values (null, 'Administração', 'Gestão da Empresa');


create table Funcionario (
cod_func integer not null primary key auto_increment,
nome_func varchar (200) not null,
cpf_func varchar (20) not null,
rg_func varchar (20),
datanasc_func date,
salário_func double not null,
telefone_func varchar (50),
celular_func varchar (50) not null,
função_func varchar (50) not null,
cod_sex integer not null,
cod_dep integer not null,
cod_end integer not null,
foreign key (cod_sex) references Sexo (cod_sex),
foreign key (cod_dep) references Departamento (cod_dep),
foreign key (cod_end) references Endereco (cod_end)
);

insert into funcionario values (null, 'João Batista', '123.544.311-99', '22222 sesdec', '1988-10-30', 5000.00, '', '69 84111155', 'Gerente', 1, 5, 3);
insert into funcionario values (null, 'Marcos Garcia Souza', '565.888.988-88', '64444 sesdec', '1965-1-20', 45000.00, '', '', 'Vendedor', 1, 1, 8);
insert into funcionario values (null, 'Leticia de Jesus', '998.999.789-55', '46666 sesdec', '1990-05-23', 1500.00, '11 454546511', '', 'Vendedora', 2, 1, 10);
insert into funcionario values (null, 'Mateus Solano ', '522.222.232-08', '65655 spp', '1990-11-30', 900.00, '69 8855 5544', '69 5555 4444', 'Mecanico', 1, 4, 4);
insert into funcionario values (null, 'Roger da Silva', '123.589.978-77', null, '1987-11-11', 1100.00, null, '69 9988 7788', 'Mecanico', 1, 4, 11);
insert into funcionario values (null, 'Karina Quadros', '987.987.788-88', null, '1985-11-22', 1000.50, null, '69 8888 7777', 'Caixa', 2, 2, 1);
insert into funcionario values (null, 'Isaias Queiroz', '123.121.321-88', '87788 sesdec', '1980-11-30', 2000.00, null, '69 8877 88881', 'Entregador', 1, 3, 7);


create table Fornecedor (
cod_forn integer not null primary key auto_increment,
razãosocial_forn varchar (200),
nomefantasial_forn varchar (100),
representante_forn varchar (100),
cod_end integer not null,
foreign key (cod_end) references Endereco (cod_end)
);


insert into Fornecedor values (null, 'GM Motors LTDA', 'Chevrolet GM', 'Tony', 5);
insert into Fornecedor values (null, 'Fiat LTDA', 'Fiat', 'Fabio', 1);
insert into Fornecedor values (null, 'Toyota LTDA', 'Toyota', 'Marcos', 2);
insert into Fornecedor values (null, 'Volkswagen LTDA', 'Volkswagem', 'Nilson', 3);
insert into Fornecedor values (null, 'Hunday LTDA', 'Hynday', 'Marcos', 3);
insert into Fornecedor values (null, 'Eletrobrás Brasil', 'Ceron', 'Governo', 10);
insert into Fornecedor values (null, 'Companhia de Agua e Esgoto de Rondonia', 'Caerd', 'Maria', 11);


create table Produto (
cod_prod int primary key not null auto_increment,
descrição_prod varchar (50) not null,
marca_prod varchar (50),
quant_prod int,
valor_prod double,
tamanho_prod varchar (50),
tipo_prod varchar (50)
);


insert into produto values (null, 'Peças do motor', 'FIAT', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Peneus', 'Pirelli', 0, 0, 'Médio', 'Borracha');
insert into produto values (null, 'Pistão', 'volkswagen', 0, 0, 'Pequeno', 'Metal');
insert into produto values (null, 'Porta', 'Ford', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Capô', 'FIAT', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Volante', 'Chevrolet', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Volante', 'Chevrolet', 0, 0, 'Médio', 'Hidráulico');
insert into produto values (null, 'Para-choque', 'Chevrolet', 0, 0, 'Médio', 'Hidráulico');
insert into produto values (null, 'Peças do motor', 'Chevrolet', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Peças do motor', 'FIAT', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Porta', 'volkswagen', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Escape', 'volkswagen', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Peças do motor', 'FIAT', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Para-choque', 'Toyota', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Peças do motor', 'hyundai', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Escape', 'Toyota', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Para-choque', 'Honda', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Porta', 'Honda', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Peças do motor', 'hyundai', 0, 0, 'Médio', 'Metal');
insert into produto values (null, 'Escape', 'hyundai', 0, 0, 'Médio', 'Metal');


create table Servico (
cod_serv int not null primary key auto_increment,
descricao_serv varchar(300),
tipo_serv varchar (100),
valor_serv float not null,
tempo_serv time
);

insert into servico values (null, 'Consertar o parachoque', 'Conserto', 75.99, '00:15:00');
insert into servico values (null, 'Rebaixar o carro', 'Estética', 121.50, '01:10:00');
insert into servico values (null, 'Envelopar com preto fosco', 'Pintura', 100.00, '02:06:00');
insert into servico values (null, 'Trocar o volante', 'Conserto', 49.99, '00:10:00');
insert into servico values (null, 'Colocar capa de couro', 'Estética', 49.99, '00:26:00');
insert into servico values (null, 'Trocar o pneu traseiro', 'Conserto', 30.80, '00:07:00');
insert into servico values (null, 'Colocar um jogo de rodas novas', 'Conserto',55.00, '00:59:00');
insert into servico values (null, 'Trocar a pintura por azul marinho', 'Pintura', 500.50, '01:03:00');
insert into servico values (null, 'Trocar as molas', 'Conserto', 299.90, '00:47:00');
insert into servico values (null, 'Consertar a porta traseira esquerda', 'Conserto', 350.00, '00:22:00'); 


create table Compra_Produto (
cod_comp integer not null primary key auto_increment,
data_comp date,
valortotal_comp double,
formpag_comp varchar (100),
cod_func integer not null,
cod_forn integer not null,
foreign key (cod_func) references Funcionario (cod_func),
foreign key (cod_forn) references Fornecedor (cod_forn)
);

insert into Compra_Produto values (null, curdate(), 0, '30 dias', 1, 1);
insert into Compra_Produto values (null, curdate(), 0, '30 dias', 1, 2);
insert into Compra_Produto values (null, curdate(), 0, 'Vista', 1, 3);
insert into Compra_Produto values (null, curdate(), 0, '60 dias', 1, 4);


create table Itens_Compra (
cod_itenscomp integer not null primary key auto_increment,
quant_itenscomp integer not null,
valor_itenscomp float not null,
cod_prod integer not null,
cod_comp integer not null,
foreign key (cod_prod) references Produto (cod_prod),
foreign key (cod_comp) references Compra_Produto (cod_comp)
);

insert into Itens_Compra values (null, 5, 5.55, 1, 1);
insert into Itens_Compra values (null, 12, 10.80, 2, 1);
insert into Itens_Compra values (null, 9, 19.99, 3, 1);
insert into Itens_Compra values (null, 2, 6.55, 4, 1);
insert into Itens_Compra values (null, 10, 10.00, 5, 1);

insert into Itens_Compra values (null, 5, 5.00, 6, 2);
insert into Itens_Compra values (null, 20, 20.50, 7, 2);
insert into Itens_Compra values (null, 15, 18.90, 8, 2);
insert into Itens_Compra values (null, 5, 30.60, 9, 2);
insert into Itens_Compra values (null, 30, 7.99, 10, 2);

insert into Itens_Compra values (null, 10, 12.90, 11, 3);
insert into Itens_Compra values (null, 20, 18.90, 12, 3);
insert into Itens_Compra values (null, 5, 120.00, 13, 3);
insert into Itens_Compra values (null, 2, 220.80, 14, 3);
insert into Itens_Compra values (null, 8, 127.70, 15, 3);

insert into Itens_Compra values (null, 10, 11.80, 16, 4);
insert into Itens_Compra values (null, 5, 124.90, 17, 4);
insert into Itens_Compra values (null, 22, 12.90, 18, 4);
insert into Itens_Compra values (null, 15, 34.80, 19, 4);
insert into Itens_Compra values (null, 12, 48.00, 20, 4);



create table Caixa (
cod_caixa integer not null primary key auto_increment,
dataabertura_caixa date not null,
datafechamento_caixa date,
saldoinicial_caixa double not null,
troco_caixa double,
valorcréditos_caixa double,
valordébitos_caixa double,
saldofinal_caixa double,
status_caixa varchar (100) not null
);

insert into Caixa values (null, curdate(), null, 0, 100.00, 0, 0, 0, 'Fechado');
insert into Caixa values (null, curdate(), null, 0, 100.00, 0, 0, 0, 'Fechado');
insert into Caixa values (null, curdate(), null, 0, 100.00, 0, 0, 0, 'Aberto');
insert into Caixa values (null, curdate(), null, 0, 0, 0, 0, 0, 'Criado');


create table Venda (
cod_vend integer not null primary key auto_increment,
data_vend date,
valortotal_vend double not null,
desconto_vend double,
formpag_vend varchar (50),
cod_func integer not null,
cod_cli integer not null,
foreign key (cod_func) references Funcionario (cod_func),
foreign key (cod_cli) references Cliente (cod_cli)
);

insert into Venda values (null, curdate(), 0, 0, 'Vista', 2, 1);
insert into Venda values (null, curdate(), 0, 10.50, 'Vista', 2, 2);
insert into Venda values (null, curdate(), 0, 0, 'Vista', 3, 8);

create table Itens_Venda (
cod_itensvend integer not null primary key auto_increment,
quant_itensvend integer not null,
valor_itensvend integer not null,
cod_prod integer not null,
cod_vend integer not null,
foreign key (cod_prod) references Produto (cod_prod),
foreign key (cod_vend) references Venda (cod_vend)
);

insert into Itens_Venda values (null, 2, 0, 1, 1);
insert into Itens_Venda values (null, 1, 0, 3, 1);
insert into Itens_Venda values (null, 1, 0, 5, 1);
insert into Itens_Venda values (null, 3, 0, 4, 1);

insert into Itens_Venda values (null, 1, 0, 10, 2);
insert into Itens_Venda values (null, 4, 0, 4, 2);
insert into Itens_Venda values (null, 3, 0, 7, 2);
insert into Itens_Venda values (null, 9, 0, 1, 2);

insert into Itens_Venda values (null, 10, 0, 9, 3);
insert into Itens_Venda values (null, 2, 0, 2, 3);
insert into Itens_Venda values (null, 3, 0, 8, 3);
insert into Itens_Venda values (null, 1, 0, 1, 3);



create table Recebimentos (
cod_receb integer not null primary key auto_increment,
data_receb date,
valor_receb double,
cod_func integer not null,
cod_caixa integer not null,
cod_vend integer not null,
foreign key (cod_caixa) references Caixa (cod_caixa),
foreign key (cod_vend) references Venda (cod_vend),
foreign key (cod_func) references Funcionario (cod_func)

);

insert into Recebimentos values (null, curdate(), 0, 6, 1, 1);
insert into Recebimentos values (null, curdate(), 0, 6, 1, 2);
insert into Recebimentos values (null, curdate(), 0, 6, 2, 3);


create table Despesas (
cod_desp integer not null primary key auto_increment,
descrição_desp varchar (200),
valor_desp double,
datavencimento_desp date,
númerodoc_desp integer,
cod_forn int,
foreign key (cod_forn) references Fornecedor (cod_forn)
);

insert into Despesas values (null, 'Conta de Agua de Janeiro/2017', 150.50, '2017-01-31', 21311, 7);
insert into Despesas values (null, 'Conta de Luz de Janeiro/2017', 550.90, '2017-02-25', 48777, 6);


create table Pagamentos (
cod_pag integer not null primary key auto_increment,
data_pag date,
valor_pag float,
formapagamento_pag varchar (100),
cod_func integer not null,
cod_caixa integer not null,
cod_desp integer,
cod_comp integer,
foreign key (cod_caixa) references Caixa (cod_caixa),
foreign key (cod_desp) references Despesas (cod_desp),
foreign key (cod_comp) references Compra_produto (cod_comp),
foreign key (cod_func) references Funcionario (cod_func)
);

insert into Pagamentos values (null, curdate(), 0, 'Dinheiro', 6, 1, null, 1);
insert into Pagamentos values (null, curdate(), 0, 'Dinheiro', 6, 2, null, 2);
insert into Pagamentos values (null, curdate(), 0, 'Dinheiro', 6, 1, null, 3);
insert into Pagamentos values (null, curdate(), 0, 'Dinheiro', 6, 2, null, 4);
insert into Pagamentos values (null, curdate(), 0, 'Débito Conta', 6, 3, 1, null);
insert into Pagamentos values (null, curdate(), 0, 'Débito Conta', 6, 3, 2, null);

#*/

#Bloco  com a questão 1.
#/*
#Questão1#Questão1#Questão1#Questão1#Questão1
drop procedure if exists InsertEstado;
DELIMITER $$
CREATE PROCEDURE InsertEstado (nome_est varchar(200), sigla varchar(2))
BEGIN
if (nome_est != '') then
	insert into estado values (null, nome_est, sigla);
else select 'Favor informar o nome do Estado' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertEstado('Rondônia', 'RO');
select * from Estado;

drop procedure if exists DeleteEstado;
DELIMITER $$
CREATE PROCEDURE DeleteEstado (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Estado where cod_est = id;
    select 'Codigo deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
END;
$$ DELIMITER ;

call DeleteEstado(28);
select * from Estado;





drop procedure if exists InsertCidade;
DELIMITER $$
CREATE PROCEDURE InsertCidade (nome_cid varchar(200), cod_est int)
BEGIN
if (nome_cid !='') then
	insert into cidade values (null, nome_cid, cod_est);
else select 'Favor informar o nome da Cidade' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertCidade('Presidente Médici', 22);
select * from Cidade;

drop procedure if exists DeleteCidade;
DELIMITER $$
CREATE PROCEDURE DeleteCidade (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Cidade where cod_cid = id;
    select 'Codigo deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
END;
$$ DELIMITER ;

call Deletecidade(13);
select * from Cidade;





drop procedure if exists InsertEndereco;
DELIMITER $$
CREATE PROCEDURE InsertEndereco (rua_end varchar(200), numero_end int, bairro_end varchar(100), cod_cid int)
BEGIN
if (cod_cid !='' && cod_cid > 0) then
	insert into endereco values (null, rua_end, numero_end, bairro_end, cod_cid);
else select 'Favor informar o nome da Cidade' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertEndereco('Silva', 569, 'Centro', 1);
select * from Endereco;

drop procedure if exists DeleteEndereco;
DELIMITER $$
CREATE PROCEDURE DeleteEndereco (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Endereco where cod_end = id;
    select 'Endereço deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
END;
$$ DELIMITER ;

call DeleteEndereco(16);
select * from Endereco;





drop procedure if exists InsertSexo;
DELIMITER $$
CREATE PROCEDURE InsertSexo (nome_sex varchar(100))
BEGIN
if (nome_sex !='') then
	insert into sexo values (null, nome_sex);
else select 'Favor informar o nome do Sexo' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertSexo('Indefinido');
select * from Sexo;

drop procedure if exists DeleteSexo;
DELIMITER $$
CREATE PROCEDURE DeleteSexo (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Sexo where cod_sex = id;
    select 'Sexo deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
END;
$$ DELIMITER ;

call DeleteSexo(3);
select * from Sexo;





drop procedure if exists InsertCliente;
DELIMITER $$
CREATE PROCEDURE InsertCliente (nome_cli varchar(200), estadocivil_cli varchar(50), cpf_cli varchar(20), rg_cli varchar(30), datanasc_cli date, rendafamiliar_cli float, telefone_cli varchar(50), celular_cli varchar(50), cod_sex int, cod_end int)
BEGIN
	if (nome_cli !='') then
		if (cpf_cli !='') then
			if (celular_cli !='') then
				if (cod_sex !='' && cod_sex > 0) then
					if (cod_end !='' && cod_end > 0) then
						insert into cliente values (null, nome_cli, estadocivil_cli, cpf_cli, rg_cli, datanasc_cli, rendafamiliar_cli, telefone_cli, celular_cli, cod_sex, cod_end);
					else select 'Favor informar o Endereço' as Msg;
					end if;
                else select 'Favor informar o Sexo' as Msg;
                end if;
			else select 'Favor informar o Celular' as Msg;
            end if;
        else select 'Favor informar o CPF' as Msg;
        end if;
	else select 'Favor informar o Nome' as Msg;
    end if;
END;
$$ DELIMITER ;

call Insertcliente('João', 'Solteiro', '5664186', '684864', '1985-05-23', 5671, '684165', '2341853', 1, 3);
select * from Cliente;

drop procedure if exists DeleteCliente;
DELIMITER $$
CREATE PROCEDURE DeleteCliente (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Cliente where cod_cli = id;
    select 'Cliente deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
END;
$$ DELIMITER ;

call DeleteCliente(16);
select * from Cliente;





drop procedure if exists InsertCarro;
DELIMITER $$
CREATE PROCEDURE InsertCarro (modelo_car varchar(100), cor_car varchar(50), portas_car varchar(50), placa_car varchar(50), marca_car varchar(50), cod_cli int)
BEGIN
	if (modelo_car != '') then
		if (cor_car != '') then
			if (placa_car != '') then
				if (marca_car != '') then
					if (cod_cli != '' && cod_cli > 0) then
						insert into carro values (null, modelo_car, cor_car, portas_car, placa_car, marca_car, cod_cli);
					else select 'Favor informar o Código do cliente' as Msg;
					end if;
				else select 'Favor informar a Marca' as Msg;
				end if;
			else select 'Favor informar a Placa' as Msg;
			end if;
		else select 'Favor informar a Cor' as Msg;
		end if;
    else select 'Favor informar o Modelo' as Msg;
	end if;
END;
$$ DELIMITER ;

call InsertCarro('fgb', 'azul', '5', '5643', 'fngl', 3);
select * from carro;

drop procedure if exists DeleteCarro;
DELIMITER $$
CREATE PROCEDURE DeleteCarro (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Carro where cod_car = id;
    select 'Carro deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
END;
$$ DELIMITER ;

call DeleteCarro(16);
select * from carro;





drop procedure if exists InsertDepartamento;
DELIMITER $$
CREATE PROCEDURE InsertDepartamento (nome_dep varchar(100), desc_dep varchar(300))
BEGIN
if (nome_dep !='') then
	insert into Departamento values (null, nome_dep, desc_dep);
else select 'Favor informar o Nome' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertDepartamento('erghedth', 'srgdth');
select * from Departamento;

DELIMITER $$
CREATE PROCEDURE DeleteDepartamento (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Departamento where cod_dep = id;
    select 'Departamento deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
END;
$$ DELIMITER ;

call DeleteDepartamento(6);
select * from departamento;





drop procedure if exists InsertFuncionario;
DELIMITER $$
CREATE PROCEDURE InsertFuncionario (nome_func varchar(200), cpf_func varchar(20), rg_func varchar(30), datanasc_func date, salario_func double, telefone_func varchar(50), celular_func varchar(50), funcao_func varchar(50), cod_sex int, cod_dep int, cod_end int)
BEGIN
	if (nome_func !='') then
		if (cpf_func !='') then
			if (salario_func !='') then
				if (celular_func !='') then
					if (funcao_func !='') then
						if (cod_sex != '' && cod_sex > 0) then
							if (cod_dep != '' && cod_dep > 0) then
								if (cod_end != '' && cod_end > 0) then
									insert into Funcionario values (null, nome_func, cpf_func, rg_func, datanasc_func, salario_func, telefone_func, celular_func, funcao_func, cod_sex, cod_dep, cod_end);
                                else select 'Favor informar o Endereço' as Msg;
                                end if;
                            else select 'Favor informar o Departamento' as Msg;
                            end if;
                        else select 'Favor informar o Sexo' as Msg;
                        end if;
					else select 'Favor informar o Função' as Msg;
					end if;
                else select 'Favor informar a Celular' as Msg;
                end if;
			else select 'Favor informar o Salário' as Msg;
            end if;
        else select 'Favor informar o CPF' as Msg;
        end if;
	else select 'Favor informar o Nome' as Msg;
    end if;
END;
$$ DELIMITER ;

call InsertFuncionario('tiao', 'lv5546', '', null, 56841, '', '63534', 'atendente', 1, 3, 2);
select * from funcionario;

drop procedure if exists DelteFuncionario;
DELIMITER $$
CREATE PROCEDURE DeleteFuncionario (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Funcionario where cod_func = id;
    select 'Funcionario deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
END;
$$ DELIMITER ;

call DeleteFuncionario(8);
select * from funcionario;





drop procedure if exists InsertFornecedor;
DELIMITER $$
CREATE PROCEDURE InsertFornecedor (razaoSocial_forn varchar(200), nomefantasia_forn varchar(100), representante_forn varchar(100), cod_end int)
BEGIN
if (cod_end !='' && cod_end > 0) then
	insert into Fornecedor values (null, razaoSocial_forn, nomefantasia_forn, representante_forn, cod_end);
else select 'Favor informar o Código do endereço' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertFornecedor('', '', '', 3);
select * from fornecedor;

drop procedure if exists DeleteFornecedor;
DELIMITER $$
CREATE PROCEDURE DeleteFornecedor (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Fornecedor where cod_forn = id;
    select 'Fornecedor deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
END;
$$ DELIMITER ;

call DeleteFornecedor(8);
select * from fornecedor;





drop procedure if exists InsertProduto;
DELIMITER $$
CREATE PROCEDURE InsertProduto (desccricao_prod varchar(50), marca_prod varchar(50), quant_prod int, valor_prod double, tamanho_prod varchar(50), tipo_prod varchar(50))
BEGIN
if (desccricao_prod != '') then
	insert into Produto values (null, desccricao_prod, marca_prod, quant_prod, valor_prod, tamanho_prod, tipo_prod);
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertProduto('fgmnf', '', 65, 564, '', '');
select * from produto;

drop procedure if exists Deleteproduto;
DELIMITER $$
CREATE PROCEDURE DeleteProduto (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Produto where cod_prod = id;
    select 'Produto deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeleteProduto(21);
select * from produto;





drop procedure if exists InsertServico;
DELIMITER $$
CREATE PROCEDURE InsertServico (descricao_serv varchar(300), tipo_serv varchar(100), valor_serv float, tempo_serv time)
BEGIN
	if (valor_serv >= 0 || valor_serv !='') then
		insert into Servico values (null, descricao_serv, tipo_serv, valor_serv, tempo_serv);
	else select 'Favor informar um Valor válido' as Msg;
    end if;
END;
$$ DELIMITER ;

call InsertServico('', '', 654, '01:30');
select * from Servico;

drop procedure if exists DeleteServico;
DELIMITER $$
CREATE PROCEDURE DeleteServico (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Servico where cod_serv = id;
    select 'Serviço deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeleteServico(11);
select * from Servico;





drop procedure if exists InsertCompra_Produto;
DELIMITER $$
CREATE PROCEDURE InsertCompra_Produto (data_comp date, valortoal_comp double, formapag_comp varchar(100), cod_func int, cod_forn int)
BEGIN
if (data_comp != '') then
	if (cod_func !='' && cod_func > 0) then
		if (cod_forn !='' && cod_forn > 0) then
			insert into Compra_Produto values (null, data_comp, valortoal_comp, formapag_comp, cod_func, cod_forn);
		else select 'Favor informar o Código do Fornecedor' as Msg;
        end if;
	else select 'Favor informar o Código do Funcionario' as Msg;
    end if;
else select 'Favor informar a Data' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertCompra_Produto('1994-03-20', 4682, '', 1, 2);
select * from Compra_Produto;

drop procedure if exists DeleteCompra_Produto;
DELIMITER $$
CREATE PROCEDURE DeleteCompra_Produto (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from compra_produto where cod_comp = id;
    select 'Compra deletada com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeleteCompra_Produto(5);
select * from Compra_Produto;





drop procedure if exists InsertItens_Compra;
DELIMITER $$
CREATE PROCEDURE InsertItens_Compra (quant_itenscomp int, valor_itenscomp float, cod_prod int, cod_comp int)
BEGIN
if (quant_itenscomp != '') then
	if (valor_itenscomp != '') then
		if (cod_prod != '' && cod_prod > 0) then
			if (cod_comp != '' && cod_comp > 0) then
				insert into Itens_Compra values (null, quant_itenscomp, valor_itenscomp, cod_prod, cod_comp);
            else select '' as Msg;
            end if;
        else select '' as Msg;
        end if;
	else select 'Favor informar o nome do Estado' as Msg;
    end if;
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertItens_Compra(52, 36521, 3, 1);
select * from Itens_Compra;

drop procedure if exists DeleteItens_Compra;
DELIMITER $$
CREATE PROCEDURE DeleteItens_Compra (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Itens_Compra where cod_itenscomp = id;
    select 'Itens deletados com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeleteItens_Compra(21);
select * from Itens_Compra;





drop procedure if exists InsertCaixa;
DELIMITER $$
CREATE PROCEDURE InsertCaixa (dataabertura date, datafechamento date, saldoinicial double, troco double, valorcreditos double, valordebitos double, saldofinal double, statusC varchar(100))
BEGIN
if (dataabertura != '') then
	if (saldoinicial != '') then
		if (statusC != '') then
			insert into Caixa values (null, dataabertura, datafechamento, saldoinicial, troco, valorcreditos, valordebitos, saldofinal, statusC);
		else select 'Favor informar o Status do caixa' as Msg;
		end if;
	else select 'Favor informar o Saldo Inicial do caixa' as Msg;
	end if;
else select 'Favor informar a Data de Abertura do caixa' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertCaixa('2004-12-25', null, 68, 32, 960, 320, null, 'fhjmet');
select * from Caixa;

drop procedure if exists DeleteCaixa;
DELIMITER $$
CREATE PROCEDURE DeleteCaixa (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Caixa where cod_caixa = id;
    select 'Caixa deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeleteCaixa(5);
select * from Caixa;





drop procedure if exists InsertVenda;
DELIMITER $$
CREATE PROCEDURE InsertVenda (data_vend date, valortotal_vend double, desconto_vend double, formpag_vend varchar(50), cod_func int, cod_cli int)
BEGIN
if (valortotal_vend != '') then
	if (cod_func != '' && cod_func > 0) then
		if (cod_cli != '' && cod_cli > 0) then
			insert into Venda values (null, data_vend, valortotal_vend, desconto_vend, formpag_vend, cod_func, cod_cli);
		else select 'Favor informar o Código do cliente' as Msg;
		end if;
	else select 'Favor informar o Código do funcionario' as Msg;
    end if;
else select 'Favor informar o Valor Total' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertVenda('2017-05-20', 46385, 360, 'rnjr', 1, 3);
select * from Venda;

drop procedure if exists DeleteVenda;
DELIMITER $$
CREATE PROCEDURE DeleteVenda (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Venda where cod_vend = id;
    select 'Venda deletada com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeleteVenda(4);
select * from Venda;





drop procedure if exists InsertItens_Venda;
DELIMITER $$
CREATE PROCEDURE InsertItens_Venda (quant_itensvend int, valor_itensvend int, cod_prod int, cod_vend int)
BEGIN 
if (quant_itensvend != '' && quant_itensvend > 0) then
	if (valor_itensvend != '' && valor_itensvend > 0) then 
		if (cod_prod != '' && cod_prod > 0) then 
			if (cod_vend != '' && cod_vend > 0) then 
				insert into Itens_Venda values (null, quant_itensvend, valor_itensvend, cod_prod, cod_vend);
			else select 'Favor informar o Código da Venda' as Msg;
			end if;
		else select 'Favor informar o Código do Produto' as Msg;
		end if;
	else select 'Favor informar o Valor do Item' as Msg;
    end if;
else select 'Favor informar a Quantidade de Itens' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertItens_Venda(52, 365, 2, 3);
select * from Itens_Venda;

drop procedure if exists DeleteItens_Venda;
DELIMITER $$
CREATE PROCEDURE DeleteItens_Venda (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Itens_Venda where cod_itensvend = id;
    select 'Itens deletados com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeleteItens_Venda(13);
select * from Itens_Venda;





drop procedure if exists InsertRecebimentos;
DELIMITER $$
CREATE PROCEDURE InsertRecebimentos (data_receb date, valor_receb double, cod_func int, cod_caixa int, cod_vend int)
BEGIN
if (data_receb != '') then
	if (cod_func != '' && cod_func > 0) then
		if (cod_caixa != '' && cod_caixa > 0) then
			if (cod_vend != '' && cod_vend > 0) then
				insert into Recebimentos values (null, data_receb, valor_receb, cod_func, cod_caixa, cod_vend);
			else select 'Favor informar o Código da Venda' as Msg;
			end if;
		else select 'Favor informar o Código do Caixa' as Msg;
		end if;
	else select 'Favor informar o Código do Funcionario' as Msg;
    end if;
else select 'Favor informar a Data do Recebimento' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertRecebimentos('2007-05-25', 566666, 1, 1, 1);
select * from Recebimentos;

drop procedure if exists DeleteRecebimentos;
DELIMITER $$
CREATE PROCEDURE DeleteRecebimentos (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Recebimentos where cod_receb = id;
    select 'Recebimento deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeleteRecebimentos(4);
select * from Recebimentos;





drop procedure if exists InsertDespesas;
DELIMITER $$
CREATE PROCEDURE InsertDespesas (descrição_desp  varchar(200), valor_desp double, datavencimento_desp date, númerodoc_desp int, cod_forn int)
BEGIN
if (cod_forn  != '' && cod_forn > 0) then 
	insert into Despesas values (null, descrição_desp, valor_desp, datavencimento_desp, númerodoc_desp, cod_forn);
else select 'Favor informar o Código do Fornecedor' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertDespesas('', 66468, null, 234, 1);
select * from Despesas;

drop procedure if exists DeleteDespesas;
DELIMITER $$
CREATE PROCEDURE DeleteDespesas (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Despesas where cod_desp = id;
    select 'Despesa deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeleteDespesas(3);
select * from Despesas;





drop procedure if exists InsertPagamentos;
DELIMITER $$
CREATE PROCEDURE InsertPagamentos (data_pag date, valor_pag float, formapagamento_pag varchar (100), cod_func int, cod_caixa int, cod_desp int, cod_comp integer)
BEGIN
if (cod_func != '' && cod_func > 0) then 
	if (cod_caixa != '' && cod_caixa > 0) then
		insert into Pagamentos values (null, data_pag, valor_pag, formapagamento_pag, cod_func, cod_caixa, cod_desp, cod_comp);
	else select 'Favor informar o Código do Caixa' as Msg;
    end if;
else select 'Favor informar o Código do Funcionario' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertPagamentos(null, 5684, 'trhr', 3, 1, null, null);
select * from Pagamentos;

drop procedure if exists DeletePagamentos;
DELIMITER $$
CREATE PROCEDURE DeletePagamentos (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from Pagamentos where cod_pag = id;
    select 'Pagamento deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeletePagamentos(8);
select * from Pagamentos;


/*
drop procedure if exists InsertXXX;
DELIMITER $$
CREATE PROCEDURE InsertXXX ()
BEGIN
if (XXX != '') then # && cod_XXX > 0
	if (XXX != '') then
		insert into Estado values (null, XXX, XXX);
	else select 'Favor informar o XXXXXX' as Msg;
    end if;
else select 'Favor informar o XXXXXX' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertXXX();
select * from XXX;

drop procedure if exists DeleteXXX;
DELIMITER $$
CREATE PROCEDURE DeleteXXX (id varchar(1000))
BEGIN
if (select id rlike '([0-9])' = 1) then
	delete from XXX where cod_XXX = id;
    select 'XXX deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ DELIMITER ;

call DeleteXXX();
select * from XXX;

colocar !='0' em todas as chaves estrangeiras
	!= 0 NÃO, > 0 SIM
substituir os deletes pelos deletes com Rlike
*/

#Bloco com o resto das questões.
#/*
#Questão2#Questão2#Questão2#Questão2#Questão2
drop trigger if exists Questao2;
DELIMITER $$ 
CREATE TRIGGER Questao2 AFTER INSERT
ON Itens_Compra FOR EACH ROW
BEGIN

update compra_produto set valortotal_comp = valortotal_comp + NEW.valor_itenscomp
where compra_produto.cod_comp = NEW.cod_comp;

update produto set quant_prod = quant_prod + NEW.quant_itenscomp
where produto.cod_prod = NEW.cod_prod;

update produto set valor_prod = valor_prod + (NEW.valor_itenscomp * 1.75)
where produto.cod_prod = NEW.cod_prod;
END; 
$$ DELIMITER ;

#Questão3#Questão3#Questão3#Questão3#Questão3
drop trigger if exists Questao3
DELIMITER $$ 
CREATE TRIGGER Questao3 AFTER INSERT
ON Itens_Venda FOR EACH ROW
BEGIN
update venda set valortotal_vend = valortotal_vend + new.valor_itensvend 
where venda.cod_vend = new.cod_vend;

update produto set quant_prod = quant_prod - new.quant_itensvend
where produto.cod_prod = new.cod_prod;
END; 
$$ DELIMITER ;

#Questão4#Questão4#Questão4#Questão4#Questão4
drop procedure if exists InsertItens_VendaQTD;
DELIMITER $$
CREATE PROCEDURE InsertItens_VendaQTD (quant_itensvend int, valor_itensvend int, cod_prod2 int, cod_vend int)
BEGIN 

declare ttt int;
declare nume varchar(50);

select produto.quant_prod, produto.descrição_prod into ttt, nume from produto where produto.cod_prod = cod_prod2;

if (quant_itensvend != '' && quant_itensvend > 0) then
	if (valor_itensvend != '' && valor_itensvend > 0) then 
		if (cod_prod2 != '' && cod_prod2 > 0) then 
			if (cod_vend != '' && cod_vend > 0) then 
				if (ttt > 0 && ttt >= quant_itensvend) then 
					if (cod_prod2 > 0 && cod_vend > 0) then 
						insert into Itens_Venda values (null, quant_itensvend, valor_itensvend, cod_prod2, cod_vend);
                    				select 'Produto Inserido com sucesso.' as Msg;
					else select concat("Produto e/ou venda não existe(m)") as Msg;
                			end if;
				else select concat("A quantidade do produto ", nume, " é de ", ttt, "! Digite uma quantidade valida!") as Msg;
                		end if;
			else select 'Favor informar o Código da Venda' as Msg;
			end if;
		else select 'Favor informar o Código do Produto' as Msg;
		end if;
	else select 'Favor informar o Valor do Item' as Msg;
    end if;
else select 'Favor informar a Quantidade de Itens' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertItens_VendaQTD(5, 365, 2, 3);
select * from Itens_Venda;
select * from produto;
delete from itens_venda where cod_itensvend = 14;

#Questão5#Questão5#Questão5#Questão5#Questão5
drop procedure if exists AbrirCaixa;
DELIMITER $$
CREATE PROCEDURE AbrirCaixa (cod_caixa2 int, troco double)
BEGIN 

declare PrimeiroSaldo double;
declare estado varchar(100);

select caixa.saldofinal_caixa into PrimeiroSaldo from caixa where caixa.cod_caixa = LAST_INSERT_ID();
select caixa.status_caixa into estado from caixa where caixa.cod_caixa = cod_caixa2;

if (cod_caixa2 > 0) then 
	if (estado != 'Fechado') then 
		if (estado != 'Aberto') then 
        		update caixa set status_caixa = 'Aberto', troco_caixa = troco, saldoinicial_caixa = PrimeiroSaldo
        		where caixa.cod_caixa = cod_caixa2;
			select 'Caixa aberto com sucesso.' as Msg;
		else select 'Este Caixa já esta Aberto' as Msg;
		end if;
	else select 'Este Caixa já foi Fechado' as Msg;
	end if;
else select 'Este Caixa não existe.' as Msg;
end if;
END;
$$ DELIMITER ;

select * from caixa;
#select saldofinal_caixa from caixa where caixa.cod_caixa = LAST_INSERT_ID();//TESTESTESTESTESTES
#select cod_prod, descrição_prod from produto where cod_prod = LAST_INSERT_ID();//TESTESTESTESTESTES

#Questão6#Questão6#Questão6#Questão6#Questão6
drop procedure if exists FecharCaixa;
DELIMITER $$
CREATE PROCEDURE FecharCaixa (cod_caixa2 int)
BEGIN 

declare estado varchar(100);

select caixa.status_caixa into estado from caixa where caixa.cod_caixa = cod_caixa2;

if (cod_caixa2 > 0) then 
	if (estado != 'Fechado') then 
		if (estado != 'Criado') then 
        		update caixa set status_caixa = 'Fechado', datafechamento_caixa = curdate(), saldofinal_caixa = valorcréditos_caixa - valordébitos_caixa
        		where caixa.cod_caixa = cod_caixa2;
			select 'Caixa Fechado com sucesso.' as Msg;
		else select 'O Caixa precisa antes ser aberto.' as Msg;
		end if;
	else select 'Este Caixa já foi Fechado' as Msg;
	end if;
else select 'Este Caixa não existe.' as Msg;
end if;
END;
$$ DELIMITER ;

select * from caixa;


#Questão7#Questão7#Questão7#Questão7#Questão7
drop procedure if exists InsertRecebimentosQTD;
DELIMITER $$
CREATE PROCEDURE InsertRecebimentosQTD (cod_funcio int, cod_caixa2 int, cod_vendo int)
BEGIN

declare valor_receb double;
declare estado varchar(100);
declare dept varchar(100);

select venda.valortotal_vend into valor_receb from venda where cod_vend = cod_vendo;
select caixa.status_caixa into estado from caixa where caixa.cod_caixa = cod_caixa2;
select departamento.nome_dep into dept from departamento 
	inner join funcionario on departamento.cod_dep = funcionario.cod_dep
	where funcionario.cod_func = cod_funcio;

if (cod_funcio > 0 && cod_caixa2 > 0 && cod_vendo > 0) then
	if (estado = 'Aberto') then
		if (dept = 'Financeiro') then
			insert into Recebimentos values (null, curdate(), valor_receb, cod_funcio, cod_caixa2, cod_vendo);
			select 'Recebimento Inserido com Sucesso' as Msg;
		else select 'Este Funcionario não pertence ao departamento Financeiro.' as Msg;
		end if;
	else select 'Este Caixa não esta aberto.' as Msg;
	end if;
else select 'Dados incompletos ou incorretos.' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertRecebimentosQTD(6, 3, 1);
select * from Recebimentos;
select * from caixa;
select * from funcionario;
select * from departamento;
select * from recebimentos;

#Questão8#Questão8#Questão8#Questão8#Questão8
drop trigger if exists Questao8
DELIMITER $$ 
CREATE TRIGGER Questao8 AFTER INSERT
ON recebimentos FOR EACH ROW
BEGIN
update caixa set valorcréditos_caixa = valorcréditos_caixa + new.valor_receb
where caixa.cod_caixa = new.cod_caixa;
END; 
$$ DELIMITER ;

#Questão9#Questão9#Questão9#Questão9#Questão9
drop procedure if exists InsertPagamentosQTD;
DELIMITER $$
CREATE PROCEDURE InsertPagamentosQTD (formapagamento_pag varchar (100), cod_funcio int, cod_caixa2 int, cod_despe int, cod_comp int)
BEGIN
declare valor_pagar float;
declare estado varchar(100);
declare dept varchar(100);

select despesas.valor_desp into valor_pagar from despesas where despesas.cod_desp = cod_despe;
select caixa.status_caixa into estado from caixa where caixa.cod_caixa = cod_caixa2;
select departamento.nome_dep into dept from departamento 
	inner join funcionario on departamento.cod_dep = funcionario.cod_dep
	where funcionario.cod_func = cod_funcio;

if (cod_funcio > 0 && cod_caixa2 > 0 && cod_despe > 0 && cod_comp > 0) then
	if (estado = 'Aberto') then
		if (dept = 'Financeiro') then
			insert into Pagamentos values (null, curdate(), valor_pagar, formapagamento_pag, cod_funcio, cod_caixa2, cod_despe, cod_comp);
			select 'Pagamento inserido com Sucesso' as Msg;
		else select 'Este Funcionario não pertence ao departamento Financeiro.' as Msg;
		end if;
	else select 'Este Caixa não esta aberto.' as Msg;
	end if;
else select 'Dados incompletos ou incorretos' as Msg;
end if;
END;
$$ DELIMITER ;

call InsertPagamentosQTD('HODOR', 6, 3, 1, 1);
#delete from pagamentos where pagamentos.cod_pag = 7;
select * from Pagamentos;
select * from caixa;
select * from funcionario;

#Questão10#Questão10#Questão10#Questão10#Questão10
drop trigger if exists Questao10
DELIMITER $$ 
CREATE TRIGGER Questao10 AFTER insert
ON pagamentos FOR EACH ROW
BEGIN
update caixa set valordébitos_caixa = valordébitos_caixa + new.valor_pag 
where caixa.cod_caixa = new.cod_caixa;
END; 
$$ DELIMITER ;s