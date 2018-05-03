package edu.sbu.matchmaster;

import com.mysql.jdbc.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet({"/search"})
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get values from the fields, the query the database
        HttpSession session = request.getSession(false);
        UserBean currentUser= (UserBean)session.getAttribute("user");
        if(currentUser != null)
            System.out.println(currentUser.getSsn());
        String profileID = request.getParameter("profileID");
        String minHeight = request.getParameter("minHeight");
        String maxHeight = request.getParameter("maxHeight");
        String minWeight = request.getParameter("minWeight");
        String maxWeight = request.getParameter("maxWeight");


        int minHint = this.getInteger(minHeight);
        int maxHint = this.getInteger(maxHeight);
        int minWint = this.getInteger(minWeight);
        int maxWint = this.getInteger(maxWeight);

        if(maxHint < 0){
            maxHint = 999999;
        }

        if(maxWint < 0){
            maxWint = 999999;
        }
        System.out.println(maxWint);
        System.out.println(minWint);
        System.out.println(maxHint);
        System.out.println(minHint);
        try {
            Connection con = ConnectionUtils.getConnection();

            String sql = "SELECT * FROM Profile P WHERE 1 = 1" +
                    "AND ProfileID LIKE ?" +
                    "AND Height <= ?" +
                    "AND Height >= ?" +
                    "AND Weight <= ?" +
                    "AND Weight >= ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, profileID);
            ps.setInt(2,maxHint);
            ps.setInt(3,minHint);
            ps.setInt(4,maxWint);
            ps.setInt(5,minWint);

            //from the resulting profiles, prepare a list of ProfileBeans
            

        }
        catch(Exception e){
            System.out.println("SQL Error");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        //UserBean currentUser= (UserBean)session.getAttribute("user");
        if(session == null) {
            System.out.println("null!!!");
        }
        getServletContext().getRequestDispatcher("/WEB-INF/advancedSearch.jsp").forward(request,response);
    }

    private int getInteger(String s){
        try {
            return Integer.parseInt(s);
        } catch(NumberFormatException e) {
            return -1;
        } catch(NullPointerException e) {
            return -1;
        }
    }
}
