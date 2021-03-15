
package utils;

import java.sql.*;


public class Conexion {


    public static Connection getConexion(){
        
        Connection con=null;
        
        try{
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection
                ("jdbc:mysql://localhost/bdcarrito?user=root&password=");
            System.out.println("Conexión satisfactoria");
        }catch(Exception e){
        System.out.println("Error: "+e);
               }
        
        return con;
        
        
    }
            

    public static void main(String[] args) {
        
        Conexion.getConexion();
        
    }
    
}
