-- PRACTICA SQL NAJLI YAYA ESTEVEZ (BOOTCAMP BIG DATA)

create schema practica_sql_nye authorization oyfwluka;

-- Creacion de Tablas (DDL)

--Tablas de referencia

create table practica_sql_nye.gruposempresariales(
	idgempresarial varchar(100) not null, --PK
	nombre_grupoempresarial varchar(200) not null

);

create table practica_sql_nye.marcas(
	idmarca varchar(100) not null, --PK
	nombre_marca varchar(200) not null,
	idgempresarial varchar(100) not null --FK

);

create table practica_sql_nye.modelos(
	idmodelo varchar(100) not null, --PK
	nombre_modelo varchar(200) not null,
	idmarca varchar(100) not null --FK

);

create table practica_sql_nye.moneda(
	idmoneda varchar(10) not null, --PK
	nombre_moneda varchar(100) not null

);

create table practica_sql_nye.colores(
	idcolor varchar(100) not null, --PK
	nombre_color varchar(200) not null

);

create table practica_sql_nye.combustible(
	idcombustible varchar(10) not null, --PK
	nombre_combustible varchar(200) not null

);

create table practica_sql_nye.companiasaseguradoras(
	idaseguradora varchar(10) not null, --PK
	nombre_aseguradora varchar(200) not null

);



-- Crear tabla Revisiones Vehiculos

create table practica_sql_nye.revisionesvehiculos(
	idrevision varchar(10) not null, --PK 
	idvehiculo varchar(100) not null, --PK , FK
	kilometraje_revision int not null,
	fecha_revision date not null,
	importe_revision numeric (12,3) not null,
	idmoneda varchar(10) not null --FK

);


-- Crear tabla Vehiculos

create table practica_sql_nye.vehiculos(
	idvehiculo varchar(100) not null, --PK
	idmodelo varchar(100) not null, --FK
	matricula varchar(10) not null,
	fecha_compra date not null,
	idcolor varchar(100) not null, --FK
	idcombustible varchar(10) not null, --FK
	idaseguradora varchar(10) not null, --FK
	num_poliza varchar(200) not null,
	kilometraje integer not null,
	fecha_baja date not null default '4000-01-01'
);



-- Creacion de las PKs
alter table practica_sql_nye.vehiculos
add constraint vehiculos_PK primary key(idvehiculo);

alter table practica_sql_nye.modelos
add constraint modelos_PK primary key(idmodelo);

alter table practica_sql_nye.marcas
add constraint marcas_PK primary key(idmarca);

alter table practica_sql_nye.gruposempresariales
add constraint gruposempresariales_PK primary key(idgempresarial);

alter table practica_sql_nye.colores
add constraint colores_PK primary key(idcolor);

alter table practica_sql_nye.combustible
add constraint combustible_PK primary key(idcombustible);

alter table practica_sql_nye.companiasaseguradoras
add constraint companiasaseguradoras_PK primary key(idaseguradora);

alter table practica_sql_nye.moneda
add constraint moneda_PK primary key(idmoneda);

alter table practica_sql_nye.revisionesvehiculos
add constraint revisionesvehiculos_PK primary key(idrevision, idvehiculo);



-- Creacion de las FKs
alter table practica_sql_nye.vehiculos
add constraint vehiculos_modelos_FK foreign key(idmodelo)
references practica_sql_nye.modelos (idmodelo);

alter table practica_sql_nye.vehiculos
add constraint vehiculos_color_FK foreign key(idcolor)
references practica_sql_nye.colores (idcolor);

alter table practica_sql_nye.vehiculos
add constraint vehiculos_combustible_FK foreign key(idcombustible)
references practica_sql_nye.combustible (idcombustible);

alter table practica_sql_nye.vehiculos
add constraint vehiculos_companiasaseguradoras_FK foreign key(idaseguradora)
references practica_sql_nye.companiasaseguradoras (idaseguradora);

alter table practica_sql_nye.revisionesvehiculos
add constraint revisionesvehiculos_moneda_FK foreign key(idmoneda)
references practica_sql_nye.moneda (idmoneda);

alter table practica_sql_nye.revisionesvehiculos
add constraint revisionesvehiculos_vehiculos_FK foreign key(idvehiculo)
references practica_sql_nye.vehiculos (idvehiculo); 

alter table practica_sql_nye.modelos
add constraint modelos_marcas_FK foreign key(idmarca)
references practica_sql_nye.marcas (idmarca);

alter table practica_sql_nye.marcas
add constraint marcas_gruposempresariales_FK foreign key(idgempresarial)
references practica_sql_nye.gruposempresariales (idgempresarial);


-- Insercion de Datos (DML)

-- 1) Tabla de Grupos Empresariales de Vehiculos
insert into practica_sql_nye.gruposempresariales
(idgempresarial,nombre_grupoempresarial)
values('GE001', 'FORD');

insert into practica_sql_nye.gruposempresariales
(idgempresarial,nombre_grupoempresarial)
values('GE002', 'VOLKSWAGEN_GROUP');

insert into practica_sql_nye.gruposempresariales
(idgempresarial,nombre_grupoempresarial)
values('GE003', 'STELLANTIS');

insert into practica_sql_nye.gruposempresariales
(idgempresarial,nombre_grupoempresarial)
values('GE004', 'TOYOTA_CORP');

insert into practica_sql_nye.gruposempresariales
(idgempresarial,nombre_grupoempresarial)
values('GE005', 'RENAULT_NISSAN_MITSUBISHI');



--2) Tabla de Marcas de Vehiculos
insert into practica_sql_nye.marcas
(idmarca,nombre_marca,idgempresarial)
values('MC001', 'FORD', 'GE001');

insert into practica_sql_nye.marcas
(idmarca,nombre_marca,idgempresarial)
values('MC002', 'SEAT', 'GE002');

insert into practica_sql_nye.marcas
(idmarca,nombre_marca,idgempresarial)
values('MC003', 'OPEL', 'GE003');

insert into practica_sql_nye.marcas
(idmarca,nombre_marca,idgempresarial)
values('MC004', 'RENAULT', 'GE005');

insert into practica_sql_nye.marcas
(idmarca,nombre_marca,idgempresarial)
values('MC005', 'TOYOTA', 'GE004');



--3) Tabla de Modelos de Vehiculos
insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M001', 'FOCUS', 'MC001');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M002', 'MONDEO', 'MC001');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M003', 'IBIZA', 'MC002');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M004', 'ASTRA', 'MC003');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M005', 'CORSA', 'MC003');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M006', 'LEON', 'MC002');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M007', 'LAGUNA', 'MC004');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M008', 'AURIS', 'MC005');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M009', 'PRIUS', 'MC005');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M010', 'COROLLA', 'MC005');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M011', 'YARIS', 'MC005');

insert into practica_sql_nye.modelos
(idmodelo, nombre_modelo, idmarca)
values ('M012', 'ZOE', 'MC004');


--4) Tabla de Colores
insert into practica_sql_nye.colores
(idcolor,nombre_color)
values ('COL01', 'ROJO');

insert into practica_sql_nye.colores
(idcolor,nombre_color)
values ('COL02', 'NEGRO');

insert into practica_sql_nye.colores
(idcolor,nombre_color)
values ('COL03', 'BLANCO');

insert into practica_sql_nye.colores
(idcolor,nombre_color)
values ('COL04', 'AZUL');


--5) Tabla de Tipos de Combustible
insert into practica_sql_nye.combustible
(idcombustible,nombre_combustible)
values ('COMB01', 'GASOLINA');

insert into practica_sql_nye.combustible
(idcombustible,nombre_combustible)
values ('COMB02', 'DIESEL');

insert into practica_sql_nye.combustible
(idcombustible,nombre_combustible)
values ('COMB03', '100_ELECTRICO');


--6) Tabla de Companias aseguradoras
insert into practica_sql_nye.companiasaseguradoras
(idaseguradora,nombre_aseguradora)
values ('ASE01', 'MUTUA_MADRILENA');

insert into practica_sql_nye.companiasaseguradoras
(idaseguradora,nombre_aseguradora)
values ('ASE02', 'AXA');

insert into practica_sql_nye.companiasaseguradoras
(idaseguradora,nombre_aseguradora)
values ('ASE03', 'MAPFRE');


--7) Tabla de Monedas
insert into practica_sql_nye.moneda
(idmoneda,nombre_moneda)
values ('01', 'EURO');

insert into practica_sql_nye.moneda
(idmoneda,nombre_moneda)
values ('02', 'DOLAR');



----------_________---------


--8) Tabla de Vehiculos de KeepCoding

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0001','M001','8855KMG','2019-10-02','COL01','COMB01','ASE01','2587193', 28165,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0002','M002','6256LDV','2020-09-06','COL02','COMB01','ASE02','1567', 45065,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0003','M003','5972KHG','2019-07-06','COL02','COMB01','ASE03','979410', 75015,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0004','M004','6231KCX','2018-03-28','COL03','COMB01','ASE03','1269744', 45879,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0005','M005','4793LMV','2020-11-25','COL03','COMB01','ASE02','12697',58298,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0006','M001','8811LMG','2020-12-19','COL01','COMB02','ASE01','36597',47320,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0007','M006','9953KTR','2019-05-28','COL01','COMB02','ASE01','212687', 60897,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0008','M007','1236JMG','2016-06-26','COL02','COMB01','ASE03','975136', 88978,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0009','M008','6587JMH','2021-04-30','COL03','COMB01','ASE03','16698', 43580,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0010','M009','3658LDM','2020-06-15','COL03','COMB01','ASE02','2265', 75124,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0011','M009','6677LFK','2021-10-29','COL03','COMB01','ASE02','13382', 33587,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0012','M002','3279LMT','2021-07-14','COL02','COMB02','ASE01','1333998', 39000,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0013','M007','8979LMX','2022-10-15','COL04','COMB01','ASE03','136497', 12020,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0014','M010','3648LLT','2022-02-16','COL01','COMB01','ASE02','1264748', 8760,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0015','M005','2697KCM','2021-07-22','COL03','COMB01','ASE02','123499', 25870,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0016','M010','5793LWX','2022-09-24','COL01','COMB01','ASE01','3369881', 6870,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0017','M011','7983LZV','2022-12-19','COL03','COMB01','ASE01','11269', 2001,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0018','M012','9813LVR','2021-07-20','COL03','COMB03','ASE03','11398', 11580,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0019','M012','6513LVZ','2021-07-21','COL03','COMB03','ASE03','3369', 32580,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0020','M009','2365MCK','2023-01-12','COL03','COMB01','ASE01','21658', 987,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje,fecha_baja) 
values('0021','M003','1238JVX','2020-08-23','COL02','COMB02','ASE03','P16887', 35002,'4000-01-01');

insert into practica_sql_nye.vehiculos (idvehiculo,idmodelo,matricula,fecha_compra,idcolor,idcombustible,idaseguradora,num_poliza,kilometraje) 
values('0022','M006','2365MCM','2022-11-25','COL02','COMB01','ASE02','P1684', 1100);



--9) Tabla de Revisiones de Vehículos

insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV001','0001',15000,'2021-02-02',215.12,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV002','0002',20120,'2022-03-14',245,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV003','0002',40500,'2022-10-14',315.25,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV004','0003',35020,'2020-08-07',136,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV005','0003',50600,'2021-08-08',257.36,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV006','0003',61000,'2022-08-10',145.1,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV007','0004',20000,'2020-05-12',250,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV008','0004',35150,'2021-06-13',214.8,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV009','0005',25789,'2021-10-14',321.5,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV010','0005',42089,'2022-11-25',148.87,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV011','0006',23578,'2021-12-16',314.8,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV012','0006',38978,'2022-12-20',134.8,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV013','0007',15987,'2020-05-25',157,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV014','0007',28978,'2021-05-26',215,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV015','0007',45987,'2022-06-01',298,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV016','0008',40200,'2017-02-14',125.87,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV017','0008',55000,'2018-02-16',154.15,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV018','0008',70150,'2020-02-19',254.87,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV019','0009',25000,'2021-05-03',236.48,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV020','0009',35120,'2022-05-05',115.5,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV021','0010',55054,'2021-07-14',265,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV022','0010',68790,'2022-08-01',324.65,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV023','0011',28978,'2022-10-30',124.7,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV024','0012',32001,'2022-08-05',125.87,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV025','0015',21001,'2022-08-03',148.87,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV026','0018',23087,'2022-07-23',157,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV027','0019',22879,'2022-07-23',134.8,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV028','0021',28978,'2021-08-25',115.5,'01');
insert into practica_sql_nye.revisionesvehiculos (idrevision,idvehiculo,kilometraje_revision,fecha_revision,importe_revision,idmoneda) 
values('REV029','0021',32879,'2022-08-27',215,'01');


--10) Actualizamos estado de los vehiculos dados de baja

update practica_sql_nye.vehiculos
set fecha_baja = '2020-12-10'
where idvehiculo = '0008';

update practica_sql_nye.vehiculos
set fecha_baja = '2021-11-16'
where idvehiculo = '0001';

update practica_sql_nye.vehiculos
set fecha_baja = '2022-03-12'
where idvehiculo = '0004';

update practica_sql_nye.vehiculos
set fecha_baja = '2022-09-09'
where idvehiculo = '0009';

update practica_sql_nye.vehiculos
set fecha_baja = '2023-01-20'
where idvehiculo = '0010';

--- FIN SCRIPT ---
