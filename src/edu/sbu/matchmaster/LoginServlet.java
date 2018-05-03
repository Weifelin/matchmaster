package edu.sbu.matchmaster;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//redirect to webinf login
		request.setAttribute("err", "");
		getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Get fields from login.html
		String err = "";
		request.setAttribute("err", err);
		
		try {

				HttpSession session = request.getSession();
				
				String email = request.getParameter("user");
				String pwd = request.getParameter("pwd");
				int ssn = 0;
				UserBean.Type type = null;
				Connection con = ConnectionUtils.getConnection();

				String query = "SELECT SSN FROM Person P WHERE P.Email = ? AND P.Password = ?";
				System.out.println(query);

			System.out.println(111111);

				

				PreparedStatement stat = con.prepareStatement(query);
				
				stat.setString(1, email);
				stat.setString(2, pwd);
				//should return a single SSN
				System.out.println(query);
				ResultSet res = stat.executeQuery();

				System.out.println("After executeQuery");

				if(res.next()) {	//ssn was found, search in User

					ssn = res.getInt("SSN");
					String query2 = "SELECT * FROM User U WHERE U.SSN = ?";
					PreparedStatement ps = con.prepareStatement(query2);
					ps.setInt(1, ssn);
					ResultSet res2 = ps.executeQuery();
					if(res2.next()) {	//Person is a User
						type = UserBean.Type.CUST;
						UserBean user = new UserBean(ssn, type);
						session.setAttribute("user",user);
						response.sendRedirect("/user/dash");
					}
					else {
						//get the role of this employee
						String query3 = "SELECT Role FROM Employee E WHERE E.SSN = ?";
						PreparedStatement ps3 = con.prepareStatement(query3);
						ps3.setInt(1, ssn);
						ResultSet res3 = ps3.executeQuery();
						
						if(res3.next()){
							//get the roll of this employee
							
							if(res3.getString("Role").equals("EMP")){
								type = UserBean.Type.EMP;
								UserBean user = new UserBean(ssn, type);
								session.setAttribute("user",user);
								response.sendRedirect(request.getContextPath()+"/emp/dash");
							}
							else{
								type = UserBean.Type.MNG;
								UserBean user = new UserBean(ssn, type);
								session.setAttribute("user",user);
								response.sendRedirect(request.getContextPath()+"/manage/dash");
							}
						}
					}
				}
				else{	//no credentials were found
					//set string to say invalid credentials in jsp
					System.out.println("invalid!!!!!");
					err = "Invalid Email or Password";
					request.setAttribute("err", err);
					request.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp");
				}
			}
		catch(Exception ex) {
			System.out.println("SQL Error");
		}
		
		
	}
}

