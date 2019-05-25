#INSERT INTO bitacora(host, usuario, operacion, modificado, tabla)
#CREATE TABLE infobase (usuario varchar (50), descripcion varchar (50),fecha TIMESTAMP default now());

#================BANCOS=========================

 delimiter //
 create procedure insertarb(in idbancos int, nombreb varchar(45), decripcionb varchar(45))
 begin
 insert into bancos(idbancos,nombreb,descripcion) values(idbancos,nombreb,descripcion);
   end
  

delimiter //
create procedure actualizarb(in idx int, nombreb varchar(45), decripcionb varchar(45))
    begin
    update bacos set nombrebanco=nombreb, descipcion=descripcionb where idbancos=idx;
     end
 //

delimiter //
 create procedure borrarb(in idx int)
   begin
     delete from bancos where idbancos=idx;
    end
     //

create trigger tr_insercion before insert on bancos
   for each row
      insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Banco creado","Bancos",now());
     //

create trigger tr_actualizacion
    before update on bancos
   for each row
    insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Banco actualizado","Bancos",now());
   //

create trigger tr_eliminacion
before delete on bancos
    for each row
     insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Banco eliminado","Bancos",now());  

//

#================cuentas=========================

 delimiter //
 create procedure insertarcuentas(in idx int, nombrecuenta varchar(45), saldo double,fechac date, idbanco int)
 begin
 insert into cuentas(idx, nombrecuenta, saldo,fechac, idbanco) values(idx, nombrecuenta, saldo,fechac, idbanco);
   end
  

delimiter //
create procedure actualizarcuentas(in idx int, nombrex varchar(45), saldo double,fechac date, idbanco int)
    begin
    update cuentas set nombrecuenta=nombrex, saldo=saldo, fechacreacion=fechac, idbanco=idbanco where idbancos=idx;
     end
 //

delimiter //
 create procedure borrarcuentas(in idx int)
   begin
     delete from cuentas where idcuentas=idx;
    end
     //

create trigger tr_insercionc
 before insert on cuentas
   for each row
      insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cuenta creada","Cuentas",now());
     //

create trigger tr_actualizacionc
    before update on cuentas
   for each row
    insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cuenta actualizada","Cuentas",now());
   //

create trigger tr_eliminacionc
before delete on cuentas
    for each row
     insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cuenta Eliminada","Cuentas",now());  s

//

#================CHEQUERAS=========================

 delimiter //
 create procedure insertarchequeras(in idx int, idcuenta int, descripcion varchar(45))
 begin
 insert into chequeras( idx , idcuenta, descripcion)) values(idx , idcuenta, descripcion);
   end
  

delimiter //
create procedure actualizarchequeras(in idx int, idcuenta int, descripcion varchar(45))
    begin
    update chequeras set idcuenta=idcuenta, descripcion=descripcion where idchequeras=idx;
     end
 //

delimiter //
 create procedure borrarchequera(in idx int)
   begin
     delete from chequeras where idchequeras=idx;
    end
     //

create trigger tr_insercionch
 before insert on chequeras
   for each row
      insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Chequera creada","Chequeras",now());
     //

create trigger tr_actualizacionch
    before update on chequeras
   for each row
    insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Chequera actualizada","Chequeras",now());
   //

create trigger tr_eliminacionch
before delete on chequeras
    for each row
     insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Chequera eliminada","Chequeras",now());  

//

#================CHEQUES=========================
delimiter //
 create procedure insertarCHQ(in importe double,estado varchar(20),usuario varchar(50),idchequera int)
 begin
 insert into cheques(importe ,estado,usuario,idchquera) values(importe ,estado,usuario,idchequera);
   end
  
  delimiter //
create procedure LiberarCheque(in idx int, estadox varchar(20))
    begin
    update cheques set estado=estadox where idcheques=idx;
     end
 //
 
 

create trigger tr_insercionchq
 before insert on cheques
   for each row
      insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cheque creado","Cheques",now());
     //

create trigger tr_actualizacionchq
    before update on cheques
   for each row
    insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cheque actualizado","Cheques",now());
   //

create trigger tr_eliminacionchq
before delete on cheques
    for each row
     insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cheque eliminado","Cheques",now());  

//

insert into usuarios values ('user1', '123', 1);
insert into autoridad values ('user1', 'ADMIN');

insert into usuarios values ('user2', '456', 1);
insert into autoridad values ('user2', 'USER');
insert into autoridad values ('user2', 'STANDAR');

