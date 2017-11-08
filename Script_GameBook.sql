drop database if exists gamebook;
create database gamebook;
use gamebook ;

####################TABELAS####################
create table jogador(
idjogador int not null primary key auto_increment,
nome VARCHAR(45),
energia_inicial INT NULL,
energia_atual INT NULL,
habilidade_inicial INT NULL,
habilidade_atual INT NULL,
sorte_inicial INT NULL,
sorte_atual INT NULL,
magia_inicial INT NULL,
pag_atual INT NULL
);

create table itens (
item_id int not null primary key auto_increment,
item_nome varchar(50),
item_desc varchar(100),
id_player int not null,
Foreign Key (id_player) REFERENCES jogador(idjogador)
);

create table magias (
id_magia int not null primary key auto_increment,
magia_nome varchar(50),
magia_desc varchar(750)
);

create table magia_has_jogador(
id int not null primary key auto_increment,
id_player int not null,
id_magia int not null,
Foreign Key (id_player) REFERENCES jogador(idjogador),
Foreign Key (id_magia) REFERENCES magias(id_magia)
);


select  jogador.nome, magias.magia_nome from jogador 
inner join magia_has_jogador on jogador.idjogador = magia_has_jogador.id_player
inner join magias on magia_has_jogador.id_magia = magias.id_magia
where jogador.idjogador = 2;


select * from itens;
select * from magia_has_jogador;
select * from magias;
select * from jogador;


####################INSERTS#########################
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Cópia de Criatura", "Este encanto permitirá que você faça aparecer uma réplica perfeita de qualquer criatura contra a qual você esteja lutando. A réplica terá os mesmos índices de HABILIDADE e ENERGIA e os mesmos poderes do original. Mas a réplica estará sob seu controle, e você poderá, por exemplo, instruí-la para que ataque a criatura original e ficar assistindo a batalha de camarote!");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Percepção Extra-Sensorial", "Com este encanto, você poderá sintonizar comprimentos de ondas psíquicas. Isso poderá ajudá-lo a ler a mente de uma criatura ou descobrir o que está por trás de uma porta trancada. Porém, às vezes, este encanto pode dar informações equivocadas, se houver mais de uma fonte psíquica perto de uma outra.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Fogo", "Todas as criaturas têm medo do fogo, e este encanto dá o poder de fazer aparecer fogo segundo a sua vontade. Você poderá causar uma pequena explosão no chão que queimará por vários segundos ou criar uma barreira de fogo para manter criaturas à distância.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Ouro dos Tolos", "Este encanto transformará pedra comum em uma pilha do que parece ser ouro. Contudo, o encanto é apenas uma forma de encanto da ilusão - embora mais confiável do que o Encanto da ilusão abaixo - e a pilha de ouro logo voltará a ser pedra.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Ilusão", "Este é um encanto poderoso, mas que não é muito confiável. Através deste encanto, você poderá criar uma ilusão convincente (por exemplo, que você se transformou em serpente, ou que o chão está coberto de carvão em brasa) para enganar uma criatura. O encanto ficará imediatamente sem efeito se acontecer qualquer coisa que desfaça a ilusão (por exemplo, você convence uma criatura que se transformou em uma serpente e então imediatamente atinge sua cabeça com um golpe de espada!). É eficiente sobre tudo com criaturas inteligentes.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Levitação", "Você pode lançar este encanto sobre objetos, adversários ou até sobre você mesmo. Livra quem o recebe dos efeitos da gravidade e assim fará com que tudo que esteja sob a sua influência flutue livremente no ar, sob o seu controle.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Sorte", "Este encanto, juntamente com os encantos de Habilidade e Energia, é especial porque pode ser lançado a qualquer momento durante a sua aventura, a não ser durante uma batalha. Você não precisa esperar que apareça a opção em uma página. Uma vez lançado, recuperará o seu índice de SORTE em metade de seu índice de SORTE Inicial (se a sua SORTE inicial for um número ímpar, subtraia o 1⁄2 de sobra). Este encanto nunca levará o seu índice de SORTE a um número superior a seu nível Inicial Portanto, se você lançar dois encantos da SORTE juntos, o seu índice de SORTE voltará apenas a ser igual a seu nível Inicial.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Escudo", "Ao lançar este encanto, você cria um escudo invisível à sua frente que o protegerá de objetos físicos, por exemplo flechas, espadas ou criaturas. O escudo não tem efeito contra a magia e, evidentemente, se nada fora dele pode tocar em você, você também não poderá tocar em nada fora dele.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Habilidade", "Este encanto restabelecerá o seu índice de HABILIDADE, aumentando-o em metade de seu valor Inicial, e pode ser lançado a qualquer momento durante a sua aventura, a não ser em uma batalha. Para conhecer todas as regras, veja o Encanto da Sorte acima. O Encanto da Habilidade funciona exatamente da mesma maneira.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Energia", "Este encanto recuperará o seu índice de Energia, aumentando-o em metade de seu valor Inicial, e pode ser lançado a qualquer momento durante a sua aventura. Veja o Encanto da Sorte para conhecer as regras completas.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Força", "Este encanto tem o efeito de aumentar muito a sua força, e é muito útil quando se luta contra criaturas fortes. Porem, deve ser utilizado com cautela, já que é difícil controlar a sua própria força quando ela aumenta demais!");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Fraqueza", "Criaturas fortes são reduzidas por este encanto a miseráveis fracotes. Não tem efeito contra todas as criaturas, mas, quando tem efeito, a criatura se torna frágil e muito menos perigosa em uma batalha.");

INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('1', '3');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('1', '7');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('1', '7');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('1', '8');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('1', '10');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('2', '4');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('2', '7');





####################PROCEDURES####################
#verifica se o joador tem a magia e a exclui de positivo
DROP PROCEDURE IF EXISTS VerificarMagia;
DELIMITER $$
CREATE PROCEDURE VerificarMagia (id_JOG INT, id_SPEEL INT)
BEGIN

declare contagem INT;

select  count(magia_has_jogador.id_magia) INTO contagem from magia_has_jogador
where magia_has_jogador.id_magia = id_SPEEL AND magia_has_jogador.id_player = id_JOG;

if(contagem >0) then
	delete from magia_has_jogador where magia_has_jogador.id_magia = id_SPEEL AND magia_has_jogador.id_player = id_JOG LIMIT 1;
else select 'Favor informar o Função' as Msg;
end if;

END;
$$ DELIMITER ;

call VerificarMagia(2,4);

select * from magia_has_jogador;

select  jogador.nome, magias.magia_nome, magias.id_magia from jogador 
inner join magia_has_jogador on jogador.idjogador = magia_has_jogador.id_player
inner join magias on magia_has_jogador.id_magia = magias.id_magia
where jogador.idjogador = 2;




#####verifica se o joador tem o iten e o exclui de positivo
DROP PROCEDURE IF EXISTS VerificarIten;
DELIMITER $$
CREATE PROCEDURE VerificarIten (id_JOG INT, itenDC VARCHAR(45))
BEGIN

declare contagem INT;

select  count(itens.item_nome) INTO contagem from itens
where itens.item_nome = itenDC AND itens.id_player = id_JOG;

if(contagem >0) then
	delete from itens where itens.item_nome = itenDC AND itens.id_player = id_JOG LIMIT 1;
else select 'Favor informar o Função' as Msg;
end if;

END;
$$ DELIMITER ;




####################FUNÇÕES####################

drop function if exists VerificarHP;
DELIMITER $$
CREATE FUNCTION VerificarHP (cod_jog int)
RETURNS integer
BEGIN

DECLARE hp integer;

select jogador.energia_atual into hp from jogador where jogador.idjogador = cod_jog;

return hp;
END;
$$ DELIMITER ;


select VerificarHP(1);



####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################