package edu.sbu.matchmaster;

import com.mysql.jdbc.StringUtils;
import sun.java2d.cmm.Profile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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

            String sql = "SELECT P.* FROM Profile P WHERE 1 = 1 " +
                    "AND P.ProfileID LIKE ? "+
                    "AND P.Height <= ? " +
                    "AND P.Height >= ? " +
                    "AND P.Weight <= ? " +
                    "AND P.Weight >= ? ";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "%" + profileID + "%");
            ps.setInt(2,maxHint);
            ps.setInt(3,minHint);
            ps.setInt(4,maxWint);
            ps.setInt(5,minWint);
            System.out.println(sql);
            ResultSet rs = ps.executeQuery();
            //from the resulting profiles, prepare a list of ProfileBeans
            List<ProfileBean> resultProfileList = new ArrayList<>();

            while(rs.next()){
                ProfileBean p = new ProfileBean(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        ProfileBean.Gender.valueOf(rs.getString(7)),
                        Arrays.asList(rs.getString(8).split(", ")),
                        rs.getInt(9),
                        rs.getInt(10),
                        ProfileBean.HairColor.valueOf(rs.getString(11)),
                        rs.getDate(12),
                        rs.getDate(13)
                );

                resultProfileList.add(p);
            }
            rs.close();
            ps.close();

            request.setAttribute("resultProfileList", resultProfileList);

        }
        catch(Exception e){
            System.out.println("SQL Error");
        }

        getServletContext().getRequestDispatcher("/WEB-INF/advancedSearch.jsp").forward(request,response);
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
