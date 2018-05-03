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
import java.util.List;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        String delete = request.getParameter("delete");
        if(delete!=null && delete.equals("true")){
            try{
                Connection conn = ConnectionUtils.getConnection();
                PreparedStatement pstmt = conn.prepareStatement("delete from Profile where ProfileID=?");
                pstmt.setString(1, request.getParameter("pid"));
                pstmt.execute();
                pstmt.close();
                conn.close();
                response.sendRedirect(getServletContext().getContextPath()+"/userdash");
                return;
            }catch(Exception e){
            }
        }
        ProfileBean newProfile = new ProfileBean(request.getParameter("newpid"),
                ((UserBean) request.getSession().getAttribute("user")).getSsn(),
                Integer.parseInt(request.getParameter("age")),
                Integer.parseInt(request.getParameter("ageRangeStart")),
                Integer.parseInt(request.getParameter("ageRangeEnd")),
                Integer.parseInt(request.getParameter("geoRange")),
                ProfileBean.Gender.valueOf(request.getParameter("gender")),
                Arrays.asList(request.getParameter("hobbies").split(", ")),
                Double.parseDouble(request.getParameter("height")),
                Double.parseDouble(request.getParameter("weight")),
                ProfileBean.HairColor.valueOf(request.getParameter("hairColor")),
                Date.valueOf((request.getParameter("creationDate"))),
                new Date(System.currentTimeMillis())
        );

        if(newProfile.getID().equals("")){
            request.setAttribute("err", "Invalid Profile ID!");
            request.setAttribute("profile", newProfile);
            request.getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp");
        }else{
            try{
                Connection conn = ConnectionUtils.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(
                        "select OwnerSSN from Profile P where P.ProfileID=?");
                pstmt.setString(1, newProfile.getID());
                ResultSet rs = pstmt.executeQuery();

                if(rs.next()){
                    if(rs.getString(1).equals(newProfile.getSSN())){
                        pstmt = conn.prepareStatement(
                                "update Profile set Age=?, DatingAgeRangeStart=?, DatingAgeRangeEnd=?, DatingGeoRange=?, M_F=?, Hobbies=?, Height=?, Weight=?, HairColor=?, LastModDate=? where ProfileID=?");
                        // pstmt.setString(1, newProfile.getID());
                        pstmt.setInt(1, newProfile.getAge());
                        pstmt.setInt(2, newProfile.getAgeRangeStart());
                        pstmt.setInt(3, newProfile.getAgeRangeEnd());
                        pstmt.setInt(4, newProfile.getGeoRange());
                        pstmt.setString(5, newProfile.getGender().toString());
                        pstmt.setString(6, String.join(", ", newProfile.getHobbies()));
                        pstmt.setDouble(7, newProfile.getHeight());
                        pstmt.setDouble(8, newProfile.getWeight());
                        pstmt.setString(9, newProfile.getHairColor().toString());
                        pstmt.setDate(10, newProfile.getLastModDate());
                        pstmt.setString(11, newProfile.getID());
                        pstmt.executeUpdate();
                        conn.commit();
                        pstmt.close();
                    }else{
                        newProfile.setID("Invalid Profile ID--Please Change");
                        request.setAttribute("profile", newProfile);
                        request.getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
                    }
                }else{
                    pstmt = conn.prepareStatement(
                            "insert into Profile VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)"
                    );
                    pstmt.setString(1, newProfile.getID());
                    pstmt.setString(2, newProfile.getSSN());
                    pstmt.setInt(3, newProfile.getAge());
                    pstmt.setInt(4, newProfile.getAgeRangeStart());
                    pstmt.setInt(5, newProfile.getAgeRangeEnd());
                    pstmt.setInt(6, newProfile.getGeoRange());
                    pstmt.setString(7, newProfile.getGender().toString());
                    pstmt.setString(8, String.join(", ", newProfile.getHobbies()));
                    pstmt.setDouble(9, newProfile.getHeight());
                    pstmt.setDouble(10, newProfile.getWeight());
                    pstmt.setString(11, newProfile.getHairColor().toString());
                    pstmt.setDate(12, newProfile.getCreationDate());
                    pstmt.setDate(13, newProfile.getLastModDate());
                    pstmt.execute();
                    pstmt.close();
                    request.setAttribute("pid", newProfile.getID());
                    doGet(request, response);

                }

            }catch(Exception e){

            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String pid = (String) request.getAttribute("pid");
        if(pid == null){
            pid = request.getParameter("pid");
        }
        String ssn = ((UserBean) request.getSession().getAttribute("user")).getSsn();
        if(pid == null || pid == ""){
            ProfileBean newProfile = new ProfileBean("",
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
        request.getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
}
