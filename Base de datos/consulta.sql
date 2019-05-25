SELECT chequeras.idchequeras, cuentas.idcuentas,cuentas.nombrecuenta,cuentas.saldo,cuentas.idbanco, bancos.nombrebanco, bancos.descripcion
    FROM chequeras
       INNER JOIN cuentas ON chequeras.idcuenta= cuentas.idcuentas
       INNER JOIN bancos ON cuentas.idbanco= bancos.idbancos;