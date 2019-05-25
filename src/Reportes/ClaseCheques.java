/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

/**
 *
 * @author LENOVO
 */
public class ClaseCheques {
    
 public SimpleIntegerProperty idchequera = new SimpleIntegerProperty();
 public SimpleIntegerProperty idcuentas = new SimpleIntegerProperty();
 public SimpleStringProperty nombrecuenta = new SimpleStringProperty();
 public SimpleDoubleProperty saldo=new SimpleDoubleProperty();
 public SimpleIntegerProperty idbanco = new SimpleIntegerProperty();
 public SimpleStringProperty nombrebanco = new SimpleStringProperty();
 public SimpleStringProperty decripcion = new SimpleStringProperty();

    public String getDecripcion() {
        return decripcion.get();
    }
    public Integer getIdchequera() {
        return idchequera.get();
    }

    public Integer getIdcuentas() {
        return idcuentas.get();
    }

    public String getNombrecuenta() {
        return nombrecuenta.get();
    }

    public Double getSaldo() {
        return saldo.get();
    }

    public Integer getIdbanco() {
        return idbanco.get();
    }

    //
    public String getNombrebanco() {    
        return nombrebanco.get();
    }

    //
    public void setDecripcion(SimpleStringProperty decripcion) {
        this.decripcion = decripcion;
    }

    public void setIdchequera(SimpleIntegerProperty idchequera) {
        this.idchequera = idchequera;
    }

    public void setIdcuentas(SimpleIntegerProperty idcuentas) {
        this.idcuentas = idcuentas;
    }

    public void setNombrecuenta(SimpleStringProperty nombrecuenta) {
        this.nombrecuenta = nombrecuenta;
    }

    public void setSaldo(SimpleDoubleProperty saldo) {
        this.saldo = saldo;
    }

    public void setIdbanco(SimpleIntegerProperty idbanco) {
        this.idbanco = idbanco;
    }

    public void setNombrebanco(SimpleStringProperty nombrebanco) {
        this.nombrebanco = nombrebanco;
    }

  

   
 
}
