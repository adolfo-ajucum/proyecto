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
 * @author DAVID
 */
public class MCheques {    
    
    
public  SimpleIntegerProperty idcheque = new SimpleIntegerProperty();
public SimpleDoubleProperty importe=new SimpleDoubleProperty();
public SimpleStringProperty estado = new SimpleStringProperty();
public SimpleStringProperty usuario= new SimpleStringProperty();
public  SimpleIntegerProperty idchquera = new SimpleIntegerProperty();

    public Integer getIdcheque() {
        return idcheque.get();
    }

    public void setIdcheque(Integer idcheque) {
        this.idcheque = new SimpleIntegerProperty (idcheque);
    }

    public SimpleDoubleProperty getImporte() {
        return importe;
    }

    public void setImporte(SimpleDoubleProperty importe) {
        this.importe = importe;
    }

    public SimpleStringProperty getEstado() {
        return estado;
    }

    public void setEstado(SimpleStringProperty estado) {
        this.estado = estado;
    }

    public SimpleStringProperty getUsuario() {
        return usuario;
    }

    public void setUsuario(SimpleStringProperty usuario) {
        this.usuario = usuario;
    }

    public SimpleIntegerProperty getIdchquera() {
        return idchquera;
    }

    public void setIdchquera(SimpleIntegerProperty idchquera) {
        this.idchquera = idchquera;
    }

   
}
