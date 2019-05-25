package cheques;

import Reportes.ClaseChequera;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public interface ProductoInterfaz {
    
    public ObservableList<ClaseChequera> PRODUCTLIST = FXCollections.observableArrayList();   
}
