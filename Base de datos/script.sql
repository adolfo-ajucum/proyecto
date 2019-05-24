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

create trigger bancos before delete on bancos
    for each row
     insert into infobase(usuario,descripcion,tabla, fecha) values (user(),"Banco eliminado","Bancos",now());  

//