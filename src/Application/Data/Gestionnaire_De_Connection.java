package Application.Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Gestionnaire_De_Connection {

    private Connection connection;
    public static int personnel_connecte;//= -1;
    public static String etudiant_connecte;//= "H1897";
    public static String prof_connecte;//= "P1";

    public static String nom_connecte;//= "null";

    public Connection getConnection() {

        String nom_BD = "system_scolarite";
        String userName = "sa";
        String password = "@*9292";
        String database_path = "";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();

//            jdbc:sqlserver://localhost:1433;databaseName=system_scolarite;
//            jdbc:sqlserver://localhost;user=MyUserName;password=*****;
            connection = DriverManager.getConnection("jdbc:sqlite:" + database_path);


        } catch (Exception e) {
            e.printStackTrace();
        }


        return connection;
    }


}
