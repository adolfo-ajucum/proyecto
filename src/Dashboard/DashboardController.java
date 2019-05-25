/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dashboard;

import com.jfoenix.controls.JFXButton;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author LENOVO
 */
public class DashboardController implements Initializable {

    @FXML
    private JFXButton btnUsuarios;
    @FXML
    private JFXButton btnCTAS;
    @FXML
    private JFXButton btnCheques;
    @FXML
    private JFXButton btnLiberacion;
    @FXML
    private JFXButton btnSeguridad;
    @FXML
    private JFXButton btnImprimir;
    @FXML
    private JFXButton btnReportes;
    @FXML
    private JFXButton btnSalir;
    @FXML
    private Pane pane;
    //Variables para Cambio de escenas
    Node node;
    Stage stage;
    Parent parent;
    Scene root;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    @FXML
    private void btnUsuarios(ActionEvent event) {

    }

    @FXML
    private void btnCTAS(ActionEvent event) {
    }

    @FXML
    private void btnCheques(ActionEvent event) {
        node = (Node) event.getSource();
        stage = (Stage) node.getScene().getWindow();

        try {
            parent = FXMLLoader.load(getClass().getResource("/cheques/puntodeventa.fxml"));
        } catch (IOException ex) {
            System.out.println("Error"+ex);
        }

        Scene scene = new Scene(parent);
        stage.setScene(scene);
        stage.centerOnScreen();
        stage.setTitle("Ventas");
        stage.show();
    }

    @FXML
    private void btnLiberacion(ActionEvent event) {
    }

    @FXML
    private void btnSeguridad(ActionEvent event) {
    }

    @FXML
    private void btnImprimir(ActionEvent event) {
    }

    @FXML
    private void btnReportes(ActionEvent event) throws IOException {
        node=(Node) event.getSource();
        stage=(Stage) node.getScene().getWindow();
        
        parent=FXMLLoader.load(getClass().getResource("/Reportes/Reportes.fxml"));
        
        Scene scene = new Scene(parent);
        stage.setScene(scene);
        stage.centerOnScreen();
        stage.setTitle("Reportes");
        stage.show();
    }

    @FXML
    private void btnSalir(ActionEvent event) throws IOException {
        node=(Node) event.getSource();
        stage=(Stage) node.getScene().getWindow();
        
        parent=FXMLLoader.load(getClass().getResource("/Login/F_Login.fxml"));
        
        Scene scene = new Scene(parent);
        stage.setScene(scene);
        stage.centerOnScreen();

        stage.setTitle("Login");
        stage.show();
    }

}
