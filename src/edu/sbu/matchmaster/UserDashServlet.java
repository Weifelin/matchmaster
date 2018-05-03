package edu.sbu.matchmaster;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "UserDashServlet",urlPatterns = {"/userdash"})
public class UserDashServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try{
            Connection conn = ConnectionUtils.getConnection();
            //First get profiles belonging to current user
            String ssn = ((UserBean)request.getSession().getAttribute("user")).getSsn();
            PreparedStatement pstmt = conn.prepareStatement("select P.* from Profile P where P.OwnerSSN = ?");
            pstmt.setString(1, ssn);
            ResultSet rs = pstmt.executeQuery();
            List<ProfileBean> profileList = new ArrayList<>();
            while(rs.next()){
                ProfileBean prof = new ProfileBean(
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
                profileList.add(prof);
            }
            rs.close();
            pstmt.close();
            request.setAttribute("profileList", profileList);


            //Get the list of upcoming dates for this user
            PreparedStatement pstmt2 = conn.prepareStatement("select D.* from Date D,Profile P where P.OwnerSSN = ? " +
                                                        " AND (D.Profile1 = P.ProfileID OR D.Profile2 = P.ProfileID)");//+
                                                        //"AND D.Date_Time < CURRENT_TIMESTAMP()");
            pstmt2.setString(1,ssn);
            ResultSet rs2 = pstmt2.executeQuery();
            System.out.println("Query2 Success");
            List<UpcomingDateBean> upcomingDateList = new ArrayList<>();
            while(rs2.next()){
                UpcomingDateBean ud = new UpcomingDateBean(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(5),
                        rs.getDate(4)
                );
                upcomingDateList.add(ud);
            }
            rs2.close();
            pstmt2.close();
            request.setAttribute("upcomingDateList", upcomingDateList);



        }catch(SQLException e){
            e.printStackTrace();
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }


        getServletContext().getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(request, response);

    }
}
