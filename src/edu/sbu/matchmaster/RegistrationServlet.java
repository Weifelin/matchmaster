package edu.sbu.matchmaster;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/register"})
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("err", "");
		getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd;
		request.setAttribute("err", "");
		
		//Get information from the form, and attempt to insert the new person into the DB
		//firstname, lastname, email, pwd, SSN, street, city, state, zip
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String ssn = request.getParameter("ssn");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		String phone = request.getParameter("phone");
		String credit = request.getParameter("credit");
		String ppp = request.getParameter("ppp");
		
		
		//scrub ssn and zip
		int zipInt = 0;
		try {
			zipInt = Integer.parseInt(zip);
		}
		catch(NumberFormatException e) {
			System.out.println("invlaid numbers");
			request.setAttribute("err", "invalid ZIP code");
		}
		if(zipInt < 1) {
				
				request.setAttribute("err", "invalid ZIP code");
		}
		Map params = request.getParameterMap();
		Iterator i = params.keySet().iterator();
		while(i.hasNext()) {
			String key = (String) i.next();	
		
			String value = ((String[]) params.get(key)) [0];
			
			if(value == null || value.trim().equals("")) {	//value is empty or nonexistent
				request.setAttribute("err", "please supply " + key +"");;
				System.out.println("string value invalid");
			}
		}
		
		ArrayList<String> parameters = new ArrayList<String>();
		
		//try to put everything in the DB
		try {
			 ;
			Connection con = ConnectionUtils.getConnection();
			
			String sql = "INSERT INTO Person"+
						"VALUES(?,?,?,?,?,?,?,?,?,?)";
		
			String sql2 = "INSERT INTO Account"+
						"VALUES(?,?,?)";
			String sql3 = "INSERT INTO User"+
						"VALUES(?,?,?,CURRENT_TIMESTAMP)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			PreparedStatement ps2 = con.prepareStatement(sql2);
			PreparedStatement ps3 = con.prepareStatement(sql3);
			//put in values for the "Person" table
			ps.setString(1,ssn);
			ps.setString(2,pwd);
			ps.setString(3,firstname);
			ps.setString(4,lastname);
			ps.setString(5,street);
			ps.setString(6,city);
			ps.setString(7,state);
			ps.setInt(8,zipInt);
			ps.setString(9,email);
			ps.setString(10,phone);
			
			ps2.setString(1, ssn);
			ps2.setString(2, credit);
			ps2.setString(3, "Primary Account");
			
			ps3.setString(1, ssn);
			ps3.setString(2, ppp);
			ps3.setInt(3, 0);
			ps3.setDate(4, new java.sql.Date(System.currentTimeMillis()));
			
			ps.executeUpdate();
			ps2.executeUpdate();
			ps3.executeUpdate();
			
			System.out.println("Records inserted");
		}
		catch(SQLException | ClassNotFoundException e) {
			request.setAttribute("err", "you must supply a unique email and SSN");
		}
		
		
		if(request.getAttribute("err").equals("")) {
			rd = request.getRequestDispatcher("login.html");
			rd.forward(request, response);
		}
		else {
			rd = request.getRequestDispatcher("/WEB-INF/register.jsp");
			rd.forward(request, response);
		}
			
		
		
	}

}
