package edu.sbu.matchmaster;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtils{
    private static final String username = "weifeng"; //"tomcat";
    private static final String password = "305Lin!";//"matchthis";
    private static final String host = "andrewjaffie.me";//"127.0.0.1";
    private static final String port = "15264";//"15264";

    //private static ConnectionUtils instance;

    /**
     * Implements singleton functionality.
     * @return instance of this class.
     */
    /*public static ConnectionUtils getInstance(){
        if(instance != null)
            return instance;
        else {
            instance = new ConnectionUtils();
            return getInstance();
        }
    }*/

    /**
     * @return Initialized connection to the database either from a pool of established connections
     * or a new one if pool is empty.
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static /*synchronized*/ Connection getConnection() throws SQLException, ClassNotFoundException{

        Class.forName("com.mysql.jdbc.Driver");
        String connURL = "jdbc:mysql://" + host + ":" + port + "/matchmaster?allowMultiQueries=true";
        Connection conn = DriverManager.getConnection(connURL, username, password);
        return conn;
    }

    /**
     * Returns a connection to the pool for reuse.
     *
     * @param conn
     */
    /*public synchronized void returnConnection(Connection conn){
        try{
            if(!conn.isClosed())
                connPool.push(conn);
        }catch(SQLException sqle){
            System.out.println(sqle.getMessage());
        }
    }*/
}
