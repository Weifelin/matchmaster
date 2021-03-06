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
        System.out.println("worked");
        //Make a list of employees to display in the jsp manageemp.js[
        //query the databse for all employees
        List<EmployeeBean> employees = new ArrayList<>();

        try{
            Connection con = ConnectionUtils.getConnection();

            String sql = "SELECT E.SSN, E.StartDate, E.HourlyRate, P.FirstName, P.LastName FROM Employee E, Person P WHERE E.SSN = P.SSN AND E.Role = 'CustRep'";

            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery(sql);

            while(rs.next()){
                System.out.println("worked");
                EmployeeBean eb = new EmployeeBean(
                        rs.getString(1),
                        rs.getDate(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5)
                );
                employees.add(eb);
                System.out.println(eb.getSsn());
            }
            rs.close();
            stat.close();

            request.setAttribute("emplist", employees);
        }
        catch(Exception e){
            System.out.println("SQL error");
        }

        getServletContext().getRequestDispatcher("/WEB-INF/manageemp.jsp").forward(request,response);
    }
}
