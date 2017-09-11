#BD Mecanica 3.0
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








#Questão1
/*
CREATE PROCEDURE InsertXXX ()
BEGIN
if (id != '') then
	if (nome_est !='') then
		insert into Estado values (id, nome_est, sigla);
	else select 'Favor informar o nome do Estado' as Msg;
    end if;
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;




DELIMITER $$
CREATE PROCEDURE DeleteXXX (id int)
BEGIN
if (id != '' && id > 0) then
	delete from XXX where cod_XXX = id;
else select 'Favor Inserir um número Válido' as Msg;
end if;
END;
$$ DELIMITER ;

*/





DELIMITER $$
CREATE PROCEDURE InsertEstado (id int, nome_est varchar(200), sigla varchar(2))
BEGIN
if (id != '') then
	if (nome_est !='') then
		insert into estado values (id, nome_est, sigla);
	else select 'Favor informar o nome do Estado' as Msg;
    end if;
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteEstado (id int)
BEGIN
if (id != '' && id > 0) then
	delete from estado where cod_est = id;
else select 'Favor Inserir um número Válido' as Msg;
end if;
END;
$$ DELIMITER ;





DELIMITER $$
CREATE PROCEDURE InsertCidade (id int, nome_cid varchar(200), cod_est int)
BEGIN
if (id != '') then
	if (nome_cid !='') then
		insert into cidade values (id, nome_cid, cod_est);
	else select 'Favor informar o nome do Estado' as Msg;
    end if;
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteCidade (id int)
BEGIN
if (id != '' && id > 0) then
	delete from estado where cod_est = id;
else select 'Favor Inserir um número Válido' as Msg;
end if;
END;
$$ DELIMITER ;





DELIMITER $$
CREATE PROCEDURE InsertEndereco (id int, rua_end varchar(200), numero_end int, bairro_end varchar(100), cod_cid int)
BEGIN
if (id != '') then
	if (cod_cid !='') then
		insert into endereco values (id, rua_end, numero_end, bairro_end, cod_cid);
	else select 'Favor informar o nome do Estado' as Msg;
    end if;
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteEndereco (id int)
BEGIN
if (id != '' && id > 0) then
	delete from endereco where cod_end = id;
else select 'Favor Inserir um número Válido' as Msg;
end if;
END;
$$ DELIMITER ;





DELIMITER $$
CREATE PROCEDURE InsertSexo (id int, nome_sex varchar(100))
BEGIN
if (id != '') then
	if (nome_sex !='') then
		insert into sexo values (id, nome_sex);
	else select 'Favor informar o nome do Estado' as Msg;
    end if;
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteSexo (id int)
BEGIN
if (id != '' && id > 0) then
	delete from sexo where cod_end = id;
else select 'Favor Inserir um número Válido' as Msg;
end if;
END;
$$ DELIMITER ;




DELIMITER $$
CREATE PROCEDURE InsertCliente (id int, nome_cli varchar(200), estadocivil_cli varchar(50), cpf_cli varchar(20), rg_cli varchar(30), datanasc_cli date, rendafamiliar_cli float, telefone_cli varchar(50), celular_cli varchar(50), cod_sex int, cod_end int)
BEGIN
if (id != '') then
	if (nome_cli !='') then
		if (cpf_cli !='') then
			if (celular_cli !='') then
				if (cod_sex !='') then
					if (cod_end !='') then
						insert into cliente values (id, nome_cli, estadocivil_cli, cpf_cli, rg_cli, datanasc_cli, rendafamiliar_cli, telefone_cli, celular_cli, cod_sex, cod_end);
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
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteCliente (id int)
BEGIN
if (id != '' && id > 0) then
	delete from cliente where cod_end = id;
else select 'Favor Inserir um número Válido' as Msg;
end if;
END;
$$ DELIMITER ;



DELIMITER $$
CREATE PROCEDURE InsertCarro (id int, modelo_car varchar(100), cor_car varchar(50), portas_car varchar(50), placa_car varchar(50), marca_car varchar(50), cod_cli int)
BEGIN
if (id !='') then
	if (modelo_car !='') then
		if (cor_car !='') then
			if (placa_car !='') then
				if (marcar_car !='') then
					if (cod_cli !='') then
						insert into carro values (id, modelo_car, cor_car, portas_car, placa_car, marca_car, cod_cli);
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
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteCarro (id int)
BEGIN
if (id != '' && id > 0) then
	delete from carro where cod_car = id;
else select 'Favor Inserir um número Válido' as Msg;
end if;
END;
$$ DELIMITER ;





DELIMITER $$
CREATE PROCEDURE InsertDepartamento (id int, nome_dep varchar(100), desc_dep varchar(300))
BEGIN
if (id !='') then
	insert into carro values (id, nome_dep, desc_dep);
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteDepartamento (id int)
BEGIN
if (id != '' && id > 0) then
	delete from departamento where cod_car = id;
else select 'Favor Inserir um número Válido' as Msg;
end if;
END;
$$ DELIMITER ;





DELIMITER $$
CREATE PROCEDURE InsertFuncionario (id int, nome_func varchar(200), cpf_func varchar(20), rg_func varchar(30), datanasc_func date, salario_func double, telefone_func varchar(50), celular_func varchar(50), funcao_func varchar(50), cod_sex int, cod_dep int)
BEGIN
if (id != '') then
	if (nome_cli !='') then
		if (cpf_cli !='') then
			if (celular_cli !='') then
				if (cod_sex !='') then
					if (cod_end !='') then
						insert into cliente values (id, nome_cli, estadocivil_cli, cpf_cli, rg_cli, datanasc_cli, rendafamiliar_cli, telefone_cli, celular_cli, cod_sex, cod_end);
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
else select 'Favor informar o id' as Msg;
end if;
END;
$$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteFuncionario (id int)
BEGIN
if (id != '' && id > 0) then
	delete from funcionario where cod_end = id;
else select 'Favor Inserir um número Válido' as Msg;
end if;
END;
$$ DELIMITER ;





























DELIMITER $$
CREATE PROCEDURE InsertCaixa (id int, dataabertura date, datafechamento date, saldoinicial double, troco double, valorcreditos double, valordebitos double, saldofinal double, statusC varchar(100))
BEGIN
if (id != '') then
	if (dataabertura != '') then
    	if (datafechamento != '') then
			if (saldoinicial != '') then
		    	if (troco != '') then
					if (valorcreditos != '') then
						if (valordebitos != '') then
							if (saldofinal != '') then
								if (statusC != '') then
									insert into Caixa values (id, dataabertura, datafechamento, saldoinicial, troco, valorcreditos, valordebitos, saldofinal, statusC);
								else select 'Favor informar o Status do caixa' as Msg;
								end if;
							else select 'Favor informar o Saldo Final do caixa' as Msg;
							end if;
						else select 'Favor informar o Valor dos débitos do caixa' as Msg;
						end if;
					else select 'Favor informar o Valor dos créditos do caixa' as Msg;
					end if;
				else select 'Favor informar o Troco do caixa' as Msg;
				end if;
			else select 'Favor informar o Saldo Inicial do caixa' as Msg;
			end if;
		else select 'Favor informar a Data de Fechamento do caixa' as Msg;
		end if;
	else select 'Favor informar a Data de Abertura do caixa' as Msg;
	end if;
else select 'Favor informar o Código do caixa' as Msg;
end if;
END;
$$ DELIMITER ;
#Questão2
#Questão3
#Questão4
#Questão5
#Questão6
#Questão7
#Questão8
#Questão9
#Questão10