#Script BD_AgenciaBancaria - Versão 4.0 - Atividade 01 - 3ª Etapa
#SEU NOME: _________________________________________

drop database if exists BD_Banco_Agencia;
create database BD_Banco_Agencia;
use BD_Banco_Agencia;

create table Banco (
cod_ban int primary key not null auto_increment,
nome_ban varchar (200) not null
);

insert into Banco values (null, 'Caixa Econômica Federal');
insert into Banco values (null, 'Banco do Brasil');


create table Agencia (
cod_ag int primary key not null auto_increment,
numero_ag varchar (100) not null,
nome_ag varchar (100),
telefone_ag varchar (200),
cod_ban_fk int not null,
foreign key (cod_ban_fk) references Banco (cod_ban)
);

insert into Agencia values (null, '0951-2', 'Centro', '69 3421 1111', 2);
insert into Agencia values (null, '4402-1', 'Centro', '69 3422 2299', 2);
insert into Agencia values (null, '1824', 'Centro', '69 3423 1925', 1);
insert into Agencia values (null, '1920', 'Nova Brasilia', '69 3421 1122', 1);


create table Cliente (
cod_cli int primary key not null auto_increment,
nome_cli varchar (200) not null,
cpf_cli varchar (50) not null,
rg_cli varchar (100) not null,
sexo_cli varchar (1),
dataNasc_cli date not null,
renda_cli float not null,
endereco_cli varchar (300) not null,
email_cli varchar (300) not null,
telefone_cli varchar (200) not null
);

insert into Cliente values (null, 'Maria da Silva', '123.123.123-23', '1113322 sesdec/RO', 'F', '1990-10-10', 2500.00, 'Rua das Flores', 'maria.silva@hotmail.com', '3423 3333'); 
insert into Cliente values (null, 'Roberto Carlos', '789.789.789-89', '889977 sesdec/RO', 'M', '1975-01-10', 4990.00, 'Av. Costa', 'roberto.carlos@gmail.com', '8444 8899'); 
insert into Cliente values (null, 'Jane Pereira', '444.666.444-44', '005548 sesdec/RO', 'F', '1989-06-07', 1850.50, 'Rua Presidente', 'jane.pereira@hotmail.com', '9977 8899'); 
insert into Cliente values (null, 'Clodoaldo Bragança', '654.456.654-65', '654658 sesdec/RO', 'F', '1991-10-12', 9850.50, 'Av. Brasil', 'clodoaldo.bragança@gmail.com', '3423 5500'); 
insert into Cliente values (null, 'Livia de Souza', '333.444.666-98', '0033333 sesdec/RO', 'F', '1982-01-30', 1100.00, 'Av. Ji-Parana', 'livia.souza@hotmail.com', '8498 9898'); 
insert into Cliente values (null, 'Joab da Silva', '159.425.456-77', '001215 sesdec/RO', 'M', '2000-10-01', 4990.00, 'Av. Ji-Parana', 'joab.silva@hotmail.com', '69 8411 2321');
insert into cliente values (null, 'Rodrigo Hilbert', '123.445.888-99', '5592 sesdec', 'M', '1970-09-30', 2500.00, 'Rua Dr. Luiz', 'rodrigo.hilbert@yahoo.com.br', '9944 4545');
insert into cliente values (null, 'João Eujácio Teixeira Júnior', '999.445.789-99', '978999992 sesdec', 'M', '1989-01-10', 6000.00, 'Rua Silva Abreu', 'joao.eujacio@ifro.edu.br', '3421 1159');
insert into cliente values (null, 'Everton Feline', '123.123.888-99', '12392 sesdec', 'M', '1987-12-10', 11500.00, 'Rua Alencar Vieira', 'everton.feline@gmail.com','69 84228811');
insert into cliente values (null, 'Igor de Souza Santos', '123.345.848-99', '43299892 sesdec', 'M', '1990-12-30', 1000.00, 'Av. Brasil', 'igor.souza@gmail.com', '69 9977 7777');
insert into cliente values (null, 'Francisco Bezerra', '888.123.111-11', '213156 sesdec', 'M', '1965-01-30', 3500.00, 'Rua Fim do Mundo', 'francisco.bezerra@ifro.edu.br', '69 3423 5502');


create table Conta_Corrente (
cod_cc int primary key not null auto_increment,
numero_cc int not null,
dataAbertura_cc date not null,
saldo_cc float not null,
cod_ag_fk int not null,
cod_cli_fk int not null,
foreign key (cod_ag_fk) references Agencia (cod_ag),
foreign key (cod_cli_fk) references Cliente (cod_cli)
);

insert into Conta_Corrente values (null, 40650, '2009-01-01', 0.00, 1, 1);
insert into Conta_Corrente values (null, 41897, '2009-01-30', 0.00, 1, 2);
insert into Conta_Corrente values (null, 42487, '2010-06-06', 0.00, 1, 3);
insert into Conta_Corrente values (null, 43456, '2011-04-21', 0.00, 1, 4);
insert into Conta_Corrente values (null, 44787, '2012-12-31', 0.00, 1, 5);

create table Deposito (
cod_dep int primary key not null auto_increment,
valor_dep float not null,
data_dep date not null,
tipo_dep varchar (100),
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

create table Saque (
cod_saq int primary key not null auto_increment,
valor_saq float not null,
data_saq date not null,
local_saq varchar (100) not null,
hora_saq time,
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

create table Transferencia (
cod_trans int primary key not null auto_increment,
valor_trans float not null,
data_trans date not null,
descricao_trans varchar (100), #Exemplo: Pagamento de carro
cod_cc_origem_fk int not null,
cod_cc_destino_fk int not null,
foreign key (cod_cc_origem_fk) references Conta_Corrente (cod_cc),
foreign key (cod_cc_destino_fk) references Conta_Corrente (cod_cc)
);

create table Pagamento (
cod_pag int primary key not null auto_increment,
valor_pag float not null,
data_pag date not null,
tipo_pag varchar (100), #Tipos possíveis: Boleto ou Convênio
hora_pag time,
dataVencimento_pag date not null,
codigoBarras_pag varchar (300),
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

#TEREFAS A PARTIR DAQUI
#Tarefa01
drop trigger if exists depositar;
DELIMITER $$ 
CREATE TRIGGER depositar AFTER INSERT ON deposito FOR EACH ROW
BEGIN 
UPDATE conta_corrente
SET saldo_cc = saldo_cc + NEW.valor_dep
WHERE cod_cc = NEW.cod_cc_fk;
END;
$$ DELIMITER ;

drop procedure if exists Inserir_Deposito;
DELIMITER $$
CREATE PROCEDURE Inserir_Deposito (valor float, datadep date, tipo varchar(100), cc int)
BEGIN
if (valor > 0) then
    if (tipo = 'Cheque') then
		if (valor <= 2000) then
			insert into deposito values(null, valor, datadep, tipo, cc);
            select concat('Depósito efetuado com sucesso!') as Msg;
        else select concat('Depósitos em cheque não podem exceder R$ 2000,00.') as Msg;
        end if;
    end if;
    
    if (tipo = 'Dinheiro') then
		if (valor <= 5000) then
			insert into deposito values(null, valor, datadep, tipo, cc);
			select concat('Depósito efetuado com sucesso!') as Msg;
        else select concat('Depósitos em Dinheiro não podem exceder R$ 5000,00.') as Msg;
        end if;
    end if;
else select concat('Valor de depósito deve ser maior que 0.') as Msg;
end if;
END;
$$ DELIMITER ;

call Inserir_Deposito(4096, '2020-10-15', 'Dinheiro', 1);
call Inserir_Deposito(1500, '2020-10-15', 'Cheque', 2);
call Inserir_Deposito(512, '2020-10-15', 'Cheque', 3);
call Inserir_Deposito(2048, '2020-10-15', 'Dinheiro', 4);
call Inserir_Deposito(2000, '2020-10-15', 'Cheque', 5);



#Tarefa02
drop trigger if exists realizar_saque;
DELIMITER $$ 
CREATE TRIGGER realizar_saque AFTER INSERT ON saque FOR EACH ROW
BEGIN 
UPDATE conta_corrente
SET saldo_cc = saldo_cc - NEW.valor_saq
WHERE cod_cc = NEW.cod_cc_fk;
END;
$$ DELIMITER ;

drop procedure if exists Inserir_Saque;
DELIMITER $$
CREATE PROCEDURE Inserir_Saque (valor_saq float, data_saq date, local_saq varchar(100), hora_saq time, cc int)
BEGIN
declare saldo float;
select saldo_cc into saldo from conta_corrente where cod_cc = cc;

if (saldo >= valor_saq) then
	if (valor_saq <= 3000) then
		if (hora_saq BETWEEN '00:00' AND '06:01') then
            select concat('Saques só podem ser realizados entre 06:01 e 23:59!') as Msg;
		else 
			insert into saque values(null, valor_saq, data_saq, local_saq, hora_saq, cc);
			select concat('Saque realizado com sucesso!') as Msg;
        end if;
	else select concat('Valor máximo permitido para saque: R$3000,00') as Msg;
	end if;
else select concat('Saldo insuficiente!') as Msg;
end if;

END;
$$ DELIMITER ;

call Inserir_Saque(1096, '2020-05-16', 'Auto-atendiento', '06:01', 1);#4096
call Inserir_Saque(500, '2020-10-10', 'Lotérica', '22:00', 2);#1500
call Inserir_Saque(12, '2020-08-24', 'Lotérica', '15:27', 3);#512
call Inserir_Saque(548, '2020-01-09', 'Lotérica', '12:03', 4);#2048
call Inserir_Saque(500, '2020-11-13', 'Auto-atendiento', '09:50', 5);#2000



#Tarefa03
drop trigger if exists baixar_transferencia;
DELIMITER $$ 
CREATE TRIGGER baixar_transferencia AFTER INSERT ON transferencia FOR EACH ROW
BEGIN 
UPDATE conta_corrente
SET saldo_cc = saldo_cc - NEW.valor_trans
WHERE cod_cc = NEW.cod_cc_origem_fk;

UPDATE conta_corrente
SET saldo_cc = saldo_cc + NEW.valor_trans
WHERE cod_cc = NEW.cod_cc_destino_fk;
END;
$$ DELIMITER ;

drop procedure if exists Inserir_Transferencia;
DELIMITER $$
CREATE PROCEDURE Inserir_Transferencia (valor_trans float, data_trans date, descricao_trans varchar(100), cod_origem int, cod_destino int)
BEGIN
declare saldo float;
select saldo_cc into saldo from conta_corrente where cod_cc = cod_origem;

if (saldo >= valor_trans) then
	if (cod_origem <> cod_destino) then
        insert into transferencia values(null, valor_trans, data_trans, descricao_trans, cod_origem, cod_destino);
        select concat('Transferência realizada com sucesso!') as Msg;
	else select concat('Contas de Origem e Destino DEVEM ser diferentes!') as Msg;
	end if;
else select concat('Saldo insuficiente!') as Msg;
end if;
END;
$$ DELIMITER ;

call Inserir_Transferencia(500, '2020-12-21', 'Comun', 1, 3);



#Tarefa04
drop trigger if exists baixar_pagamento;
DELIMITER $$ 
CREATE TRIGGER baixar_pagamento AFTER INSERT ON pagamento FOR EACH ROW
BEGIN 
UPDATE conta_corrente
SET saldo_cc = saldo_cc - NEW.valor_pag
WHERE cod_cc = NEW.cod_cc_fk;
END;
$$ DELIMITER ;

drop procedure if exists Inserir_Pagamento;
DELIMITER $$
CREATE PROCEDURE Inserir_Pagamento (valor_pag float, data_pag date, tipo_pag varchar(100), hora_pag time, dataVencimento_pag date, codigoBarras_pag varchar(300), cod_cc_fk int)
BEGIN
declare saldo float;
select saldo_cc into saldo from conta_corrente where cod_cc = cod_cc_fk;

if (saldo >= valor_pag) then
	if (hora_pag BETWEEN '09:00' AND '21:00') then
            if (length(codigoBarras_pag) = 10) then
                insert into pagamento values(null, valor_pag, data_pag, tipo_pag, hora_pag, dataVencimento_pag, codigoBarras_pag, cod_cc_fk);
				select concat('Pagamento realizado com sucesso!') as Msg;
			else select concat('Código de barras inválido!') as Msg;
            end if;          
		else 
			select concat('Saques só podem ser realizados entre 09:00 e 21:00!') as Msg;
        end if;
else select concat('Saldo insuficiente!') as Msg;
end if;
END;
$$ DELIMITER ;

select * from pagamento;
select * from conta_corrente;
call Inserir_Pagamento(500, curdate(), 'Dinheiro', '09:00', '2020-12-31', '1234567890', 1);
call Inserir_Pagamento(500, curdate(), 'Dinheiro', '12:17', '2020-12-31', '1942754361', 4);
call Inserir_Pagamento(500, curdate(), 'Dinheiro', '19:25', '2020-12-31', '2048243561', 5);