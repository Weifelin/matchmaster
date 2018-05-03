package edu.sbu.matchmaster;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(/*name = "ManagerDashServlet", urlPatterns = */{"/manageemployees"})
public class ManageEmpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //nothing
        getServletContext().getRequestDispatcher("/WEB-INF/manageemp.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Make a list of employees to display in the jsp manageemp.js[
        //query the databse for all employees
        List<EmployeeBean> employees = new ArrayList<>();

        try{
            Connection con = ConnectionUtils.getConnection();

            String sql = "SELECT E.SSN, E.StartDate FROM Employee E, Person P WHERE E.SSN = P.SSN AND E.Role LIKE CustRep";

            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(sql);

            while(rs.next()){
                EmployeeBean eb = new EmployeeBean(
                        rs.getString(1),
                        rs.getDate(3),
                        rs.getInt(4)
                );

            }
        }
        catch(Exception e){

        }

        getServletContext().getRequestDispatcher("/WEB-INF/manageemp.jsp").forward(request,response);
    }
}
