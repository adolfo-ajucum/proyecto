delimiter //
 create procedure insertarcheque(in idx int, idcuenta int, descripcion varchar(45))
 begin
 insert into chequeras( idx , idcuenta, descripcion)) values(idx , idcuenta, descripcion);
   end
  

delimiter //
create procedure actualizarcheque(in idx int, idcuenta int, descripcion varchar(45))
    begin
    update chequeras set idcuenta=idcuenta, descripcion=descripcion where idchequeras=idx;
     end
 //

delimiter //
 create procedure borrarcheque(in idx int)
   begin
     delete from chequeras where idchequeras=idx;
    end
     //