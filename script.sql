create table tbl_cliente(
	id_cliente integer not null,
	nome_cliente varchar(150) not null,
	cpf_cliente char(14),
	rg_cliente varchar(15),
	data_nascimento_cliente date,
	genero_cliente char(1),
	profissao_cliente varchar(30),
	nacionalidade_cliente varchar(30),
	logradouro_cliente varchar(30),
	numero_cliente varchar(20),
	complemento_cliente varchar(30),
	bairro_cliente varchar(30),
	municipio_cliente varchar(50), 
	uf varchar(30),
	observacoes text,
	
	constraint pk_cln_id_cliente primary key (id_cliente)
	
)


create table tbl_profissao (
	id_profissao integer not null, 
	nome_profissao varchar(150) not null,
	
	constraint pk_prf_id_profissao primary key (id_profissao),
	constraint un_prf_nome_profissao unique (nome_profissao)
)

select profissao_cliente from tbl_cliente

insert into tbl_profissao (id_profissao, nome_profissao) values (1, 'Estudante');
insert into tbl_profissao (id_profissao, nome_profissao) values (2, 'Farmaceudico');
insert into tbl_profissao (id_profissao, nome_profissao) values (3, 'Pedreiro');
insert into tbl_profissao (id_profissao, nome_profissao) values (4, 'Engenheiro');
insert into tbl_profissao (id_profissao, nome_profissao) values (5, 'Professor');
insert into tbl_profissao (id_profissao, nome_profissao) values (6, 'Professora');
insert into tbl_profissao (id_profissao, nome_profissao) values (7, 'Lojista');
insert into tbl_profissao (id_profissao, nome_profissao) values (8, 'Desenvolvedor');

select * from tbl_profissao

create table tbl_nacionalidade (
	id_nacionalidade integer not null,
	nome_nacionalidade varchar(150) not null,
	
	constraint pk_ncn_id_nacionalidade  primary key (id_nacionalidade),
	constraint un_ncn_nome_nacionalidade unique (nome_nacionalidade)
)

insert into tbl_nacionalidade (id_nacionalidade, nome_nacionalidade) values (1, 'Brasileiro');
insert into tbl_nacionalidade (id_nacionalidade, nome_nacionalidade) values (2, 'Alemão');
insert into tbl_nacionalidade (id_nacionalidade, nome_nacionalidade) values (3, 'Austríaco');
insert into tbl_nacionalidade (id_nacionalidade, nome_nacionalidade) values (4, 'Japonês');
insert into tbl_nacionalidade (id_nacionalidade, nome_nacionalidade) values (5, 'Polonês');

select * from tbl_nacionalidade

create table tbl_complemento(
	id_complemento integer not null, 
	nome_complemento varchar(150) not null,
	
	constraint pk_cpm_id_complemento primary key (id_complemento),
	constraint un_cpm_id_complemento unique (nome_complemento)
)

insert into tbl_complemento (id_complemento, nome_complemento) values (1, 'Casa');
insert into tbl_complemento (id_complemento, nome_complemento) values (2, 'Apartamento')

create table tbl_bairro(
	id_bairro integer not null, 
	nome_bairro varchar(150) not null,
	
	constraint pk_brr_id_bairro primary key (id_bairro),
	constraint un_brr_id_bairro unique (nome_bairro)
)

insert into tbl_bairro (id_bairro, nome_bairro) values (1, 'Cristiano de Carvalho');
insert into tbl_bairro (id_bairro, nome_bairro) values (2, 'Nogueira')

alter table tbl_cliente rename column profissao_cliente to id_profissao;

select * from tbl_cliente

alter table tbl_cliente drop id_profissao;
alter table tbl_cliente add id_profissao integer;
alter table tbl_cliente add constraint fk_cln_id_profissao foreign key (id_profissao) references tbl_profissao (id_profissao);

update tbl_cliente set id_profissao = 7 where id_cliente in (3);
update tbl_cliente set id_profissao = 8 where id_cliente in (1);
update tbl_cliente set id_profissao = 6 where id_cliente in (2);

select * from tbl_profissao

select * from tbl_bairro

alter table tbl_cliente drop nacionalidade_cliente

alter table tbl_cliente add id_nacionalidade integer;

alter table tbl_cliente add constraint fk_cln_id_nacionalidade foreign key (id_nacionalidade) references tbl_nacionalidade (id_nacionalidade)

update tbl_cliente set id_nacionalidade = 1 where id_cliente in (1, 2, 3)

select * from tbl_nacionalidade

alter table tbl_cliente drop complemento_cliente

alter table tbl_cliente add id_complemento integer;

alter table tbl_cliente add constraint fk_cln_id_complemento foreign key (id_complemento) references tbl_complemento (id_complemento)

update tbl_cliente set id_complemento = 2 where id_cliente in (2)

select * from tbl_cliente

alter table tbl_cliente drop bairro_cliente;

alter table tbl_cliente add id_bairro integer;

alter table tbl_cliente add constraint fk_brr_id_bairro foreign key (id_bairro) references tbl_bairro (id_bairro);

update tbl_cliente set id_bairro = 1 where id_cliente in (2);

update tbl_cliente set id_bairro = 2 where id_cliente in (1, 3);


create table tbl_municipio(
	id_municipio integer not null,
	nome_municipio varchar(150) not null,
	id_uf integer not null,
	
	constraint pk_mnc_id_municipio primary key (id_municipio),
	constraint un_mnc_nome_municipio unique (nome_municipio),
	constraint fk_mnc_id_uf foreign key (id_uf) references uf (id_uf)
);

insert into tbl_municipio (id_municipio, nome_municipio, id_uf) values (1, 'Barretos' , 1);
insert into tbl_municipio (id_municipio, nome_municipio, id_uf) values (2, 'Sacramento' , 2)

select * from tbl_municipio

create table uf(
	id_uf integer not null,
	nome_uf varchar(30) not null,
	sigla_uf char(2) not null,
	
	constraint pk_ufd_id_uf primary key (id_uf),
	constraint un_ufd_nome_uf unique (nome_uf),
	constraint un_ufd_sigla_uf unique (sigla_uf)
);

insert into uf (id_uf, nome_uf, sigla_uf) values (1 , 'São Paulo' , 'SP');
insert into uf (id_uf, nome_uf, sigla_uf) values (2 , 'Minas Gerais' , 'MG')

select * from uf

select * from tbl_cliente

alter table tbl_cliente drop municipio_cliente;

alter table tbl_cliente drop uf;

alter table tbl_cliente add id_municipio integer;

alter table tbl_cliente add constraint fk_cliente_id_municipio foreign key (id_municipio) references tbl_municipio (id_municipio);

update tbl_cliente set id_municipio = 1 where id_cliente in (1, 3);

update tbl_cliente set id_municipio = 2 where id_cliente in (2)

alter table tbl_cliente add id_uf integer;

alter table tbl_cliente add constraint fk_cliente_id_uf foreign key (id_uf) references uf (id_uf);

update tbl_cliente set id_uf = 1 where id_cliente in (1, 3);

update tbl_cliente set id_uf = 2 where id_cliente in (2);

select * from tbl_cliente



create table fornecedor(
	idfornecedor integer not null,
	nome varchar(50) not null,
	
	constraint pk_frn_idfornecedor primary key (idfornecedor),
	constraint un_frn_nome unique (nome)
);

insert into fornecedor (idfornecedor, nome) values (1, 'Cap. Computadores');
insert into fornecedor (idfornecedor, nome) values (2, 'AA. Computadores');
insert into fornecedor (idfornecedor, nome) values (3, 'BB. Maquinas');

select * from fornecedor

create table vendedor(
	idvendedor integer not null,
	nome varchar(150) not null,
	
	constraint pk_vnd_idvendedor primary key (idvendedor),
	constraint pk_vnd_nome unique (nome)
);

insert into vendedor (idvendedor, nome) values (1, 'André');
insert into vendedor (idvendedor, nome) values (2, 'Alisson');
insert into vendedor (idvendedor, nome) values (3, 'Marcos');
insert into vendedor (idvendedor, nome) values (4, 'Xavier');
insert into vendedor (idvendedor, nome) values (5, 'Rodrigo');
insert into vendedor (idvendedor, nome) values (6, 'Kayne');
insert into vendedor (idvendedor, nome) values (7, 'Matheus');
insert into vendedor (idvendedor, nome) values (8, 'Leandro');

select * from vendedor

create table transportadora(
	idtransportadora integer not null,
	id_municipio integer,
	nome varchar(150) not null,
	logradouro varchar(150) not null,
	numero varchar(10) not null,
	
	constraint pk_trn_idtransportadora primary key (idtransportadora),
	constraint fk_trn_idmunicipio foreign key (id_municipio) references tbl_municipio (id_municipio),
	constraint un_trn_nome unique (nome)
);

insert into transportadora (idtransportadora, id_municipio, nome, logradouro, numero) values (1, 1, 'Bs. Transportes' , 'Rua 18' , '369');
insert into transportadora (idtransportadora, id_municipio, nome, logradouro, numero) values (2, 2, 'União Transportes' , 'Rua das Limas' , '68');

select * from transportadora

create table produto(
	idproduto integer not null,
	idfornecedor integer not null,
	nome varchar(150) not null,
	valor float not null,
	
	constraint pk_prd_idproduto primary key (idproduto),
	constraint fk_prd_idfornecedor foreign key (idfornecedor) references fornecedor (idfornecedor)
);

insert into produto (idproduto, idfornecedor, nome, valor) values (1, 1, 'MicroComputador' , '800');
insert into produto (idproduto, idfornecedor, nome, valor) values (2, 1, 'Monitor' , '500');
insert into produto (idproduto, idfornecedor, nome, valor) values (3, 2, 'Placa Mãe' , '200');
insert into produto (idproduto, idfornecedor, nome, valor) values (4, 2, 'HD' , '150');
insert into produto (idproduto, idfornecedor, nome, valor) values (5, 2, 'Placa de Video' , '800');
insert into produto (idproduto, idfornecedor, nome, valor) values (6, 3, 'Processador' , '1.500');
insert into produto (idproduto, idfornecedor, nome, valor) values (7, 1, 'Memoria RAM' , '300');
 
 select * from produto

create table pedido(
	idpedido integer not null,
	id_cliente integer not null,
	idtransportadora integer,
	idvendedor integer not null,
	data_pedido date not null,
	valor float not null,
	
	constraint pk_pdd_idpedido primary key (idpedido),
	constraint fk_pdd_id_cliente foreign key (id_cliente) references tbl_cliente (id_cliente),
	constraint fk_pdd_idtransportadora foreign key (idtransportadora) references transportadora (idtransportadora),
	constraint fk_pdd_idvendedor foreign key (idvendedor) references vendedor (idvendedor)
);

insert into pedido (idpedido, data_pedido, valor, id_cliente, idtransportadora, idvendedor)
values (1, '2023-08-14', 1300, 2, 1, 7 );
insert into pedido (idpedido, data_pedido, valor, id_cliente, idtransportadora, idvendedor)
values (2, '2023-01-09', 4900, 1, 2, 5 );
insert into pedido (idpedido, data_pedido, valor, id_cliente, idtransportadora, idvendedor)
values (3, '2023-12-10', 320, 1, 2, 1 );
insert into pedido (idpedido, data_pedido, valor, id_cliente, idtransportadora, idvendedor)
values (4, '2023-11-14', 2000, 3, 1, 4 );

select * from pedido

create table pedido_produto(
	idpedido integer not null,
	idproduto integer not null,
	quantidade integer not null,
	valor_unitario float not null,
	
	constraint pk_pdp_idpedidoproduto primary key (idpedido, idproduto),
	constraint fk_pdp_idpedido foreign key (idpedido) references pedido(idpedido),
	constraint fk_pdp_idproduto foreign key (idproduto) references produto(idproduto)
);

select * from produto
insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(1, 1, 1, 800 );
insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(1, 2, 1, 500 );
select * from pedido_produto

insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(2, 2, 1, 500 );

insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(3, 4, 2, 150);

insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(4, 1, 1, 800);
insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(4, 3, 1, 200);

insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(5, 3, 1, 200);

insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(6, 1, 2, 800);
insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(6, 7, 1, 300);
insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(6, 5, 1, 800);
insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values(6, 4, 1, 1500);

--EXERCICIOS: 

select nome from vendedor order by nome asc;

select nome, valor from produto where valor > '200' order by valor asc;

select avg(valor) from pedido; --avg é usado para fazer calculo de media de um conjunto de numeros, como exemplo, o valor do pedido

select count(id_municipio) from tbl_municipio --count(+id) é usado para fazer a contagem da quantidade de id's por exemplo 

select count(logradouro) from transportadora

select count(id_municipio) from tbl_municipio where id_uf=1

select max(valor) from pedido --max é usado para mostrar o maior valor de um campo 

select min(valor) from pedido --min é usado para mostrar o menor valor de um campo

select sum(valor) from pedido --sum é usado para somar os valores de todos os campos preenchidos 

select id_cliente, valor from pedido

select id_cliente, sum(valor) from pedido group by id_cliente -- usando o group by, você agrupa os clientes juntamente com os preços dos pedidos, porem precisa usar uma função agregada para isso, como o sum

select id_cliente, sum(valor) from pedido group by id_cliente having sum(valor) > 1500

select tbl_cliente.nome_cliente, tbl_profissao.nome_profissao from tbl_cliente left outer join tbl_profissao on tbl_cliente.id_profissao = tbl_profissao.id_profissao

select tbl_cliente.nome_cliente, tbl_profissao.nome_profissao from tbl_cliente inner join tbl_profissao on tbl_cliente.id_profissao = tbl_profissao.id_profissao

select tbl_cliente.nome_cliente, tbl_profissao.nome_profissao from tbl_cliente right outer join tbl_profissao on tbl_cliente.id_profissao = tbl_profissao.id_profissao
	  
select nome_cliente, id_profissao from tbl_cliente

select * from pedido

select data_pedido, extract(day from data_pedido), extract(month from data_pedido), extract(year from data_pedido) from pedido

select nome_cliente, substring(nome_cliente from 1 for 5), substring(nome_cliente from 2) from tbl_cliente

select nome_cliente, upper(nome_cliente) from tbl_cliente

select nome_cliente, cpf_cliente, coalesce(cpf_cliente, 'Não informado')

select * from tbl_cliente

select * from pedido














