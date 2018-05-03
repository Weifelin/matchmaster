package edu.sbu.matchmaster;

import com.mysql.jdbc.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.util.Arrays;
import java.util.Collections;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ProfileBean newProfile = new ProfileBean((String)request.getAttribute("pid"),
                Integer.parseInt((String)request.getAttribute("age")),
                Integer.parseInt((String)request.getAttribute("ageRangeStart")),
                Integer.parseInt((String)request.getAttribute("ageRangeEnd")),
                Integer.parseInt((String)request.getAttribute("geoRange")),
                ProfileBean.Gender.valueOf((String)request.getAttribute("gender")),
                Arrays.asList(((String)request.getAttribute("hobbies")).split(", ")),
                Double.parseDouble((String))
                )
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String pid = (String) request.getAttribute("pid");
        if(pid == null){
            pid = request.getParameter("pid");
        }
        String ssn = ((UserBean) request.getSession().getAttribute("user")).getSsn();
        if(pid == null || pid == ""){
            ProfileBean newProfile = new ProfileBean("New Profile",
                    ssn,
                    17,
                    17,
                    99,
                    20,
                    ProfileBean.Gender.Other,
                    Arrays.asList(""),
                    60,
                    130,
                    ProfileBean.HairColor.Brown,
                    new Date(System.currentTimeMillis()),
                    new Date(System.currentTimeMillis()));
            request.setAttribute("profile", newProfile);
            request.setAttribute("pid", newProfile.getID());

        }else{
            try{
                Connection conn = ConnectionUtils.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(
                        "select * from Profile P where P.ProfileID = ?"
                );
                pstmt.setString(1, pid);
                ResultSet rs = pstmt.executeQuery();
                if(rs.next()){
                    ProfileBean profileBean = new ProfileBean(
                            pid,
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
                    rs.close();
                    pstmt.close();
                    request.setAttribute("profile", profileBean);
                }
            }catch(Exception e){
                //die
            }
        }
        request.getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp").forward(request,response);
    }
}
