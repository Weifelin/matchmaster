package edu.sbu.matchmaster;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
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
		getServletContext().getRequestDispatcher("register.html").forward(request,response);
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
//		String firstname = request.getParameter("firstname");
//		String lastnamee = request.getParameter("lastname");
//		String email = request.getParameter("email");
//		String pwd = request.getParameter("pwd");
//		String ssn = request.getParameter("ssn");
//		String street = request.getParameter("street");
//		String city = request.getParameter("city");
//		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
//		String phone = request.getParameter("phone");
		
		
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
		
		
		
		//try to put everything in the DB
		try {
			//ConnectionUtils cu = ConnectionUtils.getInstance();
			Connection con = ConnectionUtils.getConnection();
			
			String sql = "INSERT INTO Person"+
						"VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		
			PreparedStatement ps = con.prepareStatement(sql);
			int n = 1;
			Map param = request.getParameterMap();
			Iterator it = param.keySet().iterator();
			while(it.hasNext()) {
				String key = (String) it.next();	
				String value = ((String[]) param.get(key)) [0];
				ps.setString(n, value);
				n++;
				System.out.println(n);
				}
		}
		catch(SQLException | ClassNotFoundException e) {
			request.setAttribute("err", "you must supply a unique email and SSN");
		}
		
		
		if(request.getAttribute("err").equals("")) {
			rd = request.getRequestDispatcher("login.html");
			rd.forward(request, response);
		}
		else {
			rd = request.getRequestDispatcher("register.html");
			rd.forward(request, response);
		}
			
		
		
	}

}
