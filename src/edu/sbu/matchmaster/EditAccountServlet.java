package edu.sbu.matchmaster;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.time.Instant;

@WebServlet(name = "EditAccountServlet", urlPatterns = {"/editAccount"})
public class EditAccountServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String verb = request.getParameter("verb");
        if(verb!=null && verb.equals("delete")){
            AccountBean acct = (AccountBean)request.getAttribute("thisAccount");
            try{
                Connection conn = ConnectionUtils.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(
                        "delete from Account where (OwnerSSN, CardNumber, AcctNum)=(?,?,?)"
                );
                pstmt.setString(1, request.getParameter("ssn"));
                pstmt.setString(2, request.getParameter("cardNum"));
                pstmt.setString(3, request.getParameter("acctNum"));
                pstmt.execute();
                conn.close();
                pstmt.close();
            }catch(SQLException e){
                e.printStackTrace();
            }catch(ClassNotFoundException e){
                e.printStackTrace();
            }
        } else {
            try{
                Connection conn = ConnectionUtils.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(
                        "select * from Account where AcctNum=? and OwnerSSN=?"
                );
                pstmt.setString(1, request.getParameter("acctNum"));
                pstmt.setString(2, request.getParameter("ssn"));
                ResultSet rs = pstmt.executeQuery();
                if(rs.next()){
                    pstmt = conn.prepareStatement("update Account set CardNumber=? where OwnerSSN=? and AcctNum=?");
                    pstmt.setLong(1, Long.parseLong(request.getParameter("cardNum")));
                    pstmt.setString(2, request.getParameter("ssn"));
                    pstmt.setString(3, request.getParameter("acctNum"));
                } else {
                    pstmt = conn.prepareStatement("insert into Account VALUES(?,?,?,?)");
                    pstmt.setString(2, request.getParameter("cardNum"));
                    pstmt.setString(1, request.getParameter("ssn"));
                    pstmt.setString(3, request.getParameter("acctNum"));
                    pstmt.setDate(4, new Date(System.currentTimeMillis()));
                }
                pstmt.execute();
                conn.close();
                pstmt.close();

            }catch(SQLException e){
                e.printStackTrace();
            }catch(ClassNotFoundException e){
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getServletContext().getContextPath()+"/userdash");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setAttribute("thisAccount", new AccountBean(request.getParameter("ssn"), 0L, Math.floor(Math.random()*99999)+""));
        request.getServletContext().getRequestDispatcher("/WEB-INF/editAccount.jsp").forward(request,response);
    }
}
