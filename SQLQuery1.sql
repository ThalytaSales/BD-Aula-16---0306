create database Recurso_Humano2
go

drop database Recurso_Humano;

Use Recurso_Humano2;



	create table funcionario 
	(codigofunc		int		primary key		not null,
	nome_func		varchar (30)			not null,
	email_func		varchar (40)			not null,
	telefonefunc	numeric (9)				not null);


	create table funcionariobackupinsert 
	(codigofunc		int		primary key		not null,
	nome_func		varchar (30)			not null,
	email_func		varchar (40)			not null,
	telefonefunc	numeric (9)				not null);

	create table funcionariobackupdelete 
	(codigofunc		int		primary key		not null,
	nome_func		varchar (30)			not null,
	email_func		varchar (40)			not null,
	telefonefunc	numeric (9)				not null);


	select * from funcionario
	select * from funcionariobackupinsert 
	select * from funcionariobackupdelete 
	go 

	create trigger trg_funcionariobackupinsert on funcionario 
		after insert 
		as begin 
			insert into funcionariobackupdelete
			select * from deleted
		end 
	go 


	/* fazendo  inserção de dados na tabela funcionario */

	insert into funcionario ( codigofunc, nome_func,email_func,telefonefunc)
	values	(5 , ' Edson Dionisio', 'edson.dionisio@gmail.com', 997402801),
			(8 , ' Maitê Silva', 'maite.silva@gmail.com',997402801),
			(12 , ' Marilia Késsia', 'testeKessia@gmail.com',997402801);
	go 

	/* Verificando o contéudo das tabelas */

select * from funcionario
select * from funcionariobackupinsert
select * from funcionariobackupdelete
go 


delete from funcionario
where codigofunc = 8;
go

select * from funcionario
select * from funcionariobackupinsert
select * from funcionariobackupdelete
go 


Select * from sysobjects where type = 'TR' ;
select OBJECT_NAME 