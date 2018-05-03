package edu.sbu.matchmaster;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/search"})
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get values from the fields, the query the database
        UserBean currentUser= (UserBean)request.getAttribute("user");
        String ssn = currentUser.getSsn();
        System.out.println(ssn);
        String profileID = request.getParameter("profileID");
        String minHeight = request.getParameter("minHeight");
        String maxHeight = request.getParameter("maxHeight");
        String minWeight = request.getParameter("minWeight");
        String maxWeight = request.getParameter("maxWeight");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/WEB-INF/advancedSearch.jsp").forward(request,response);
    }
}
