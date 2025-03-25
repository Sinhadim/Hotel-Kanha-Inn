package com.krishn.hotelreservationsystem;
import java.io.*;
import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/signup")
public class SignUp extends HttpServlet {
		@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			 resp.setContentType("text/html");
			PrintWriter out=resp.getWriter();
		String uname=req.getParameter("username");
		String pass=req.getParameter("password");
		String action = req.getParameter("action"); // Checks if it is signup or login

		if (action == null) {
            out.print("<h3 style='color:red'>Invalid action!</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("/SignUp.jsp");
            rd.include(req, resp);
            return;
        }
		 if(uname.length()<5||uname.length()>15) {
	        	System.out.println("Invalid username,name must be between 3 to 30 characters");
	        }
	         if(pass.length()<8||pass.length()>15) {
		        	System.out.println("invalid password,password must be between 8 to 10 digit");
		        }
		        Connection con = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs = null;

		        try {
		            Class.forName("com.mysql.cj.jdbc.Driver");
		            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelmangementsystem", "root", "admin");

		            if ("signup".equals(action)) {
		                // check if user already exist
		                String checkQuery = "SELECT COUNT(*) FROM signup WHERE username=?";
		                pstmt = con.prepareStatement(checkQuery);
		                pstmt.setString(1, uname);
		                rs = pstmt.executeQuery();
		                rs.next();

		                if (rs.getInt(1) > 0) {
		                	resp.setContentType("text/html");
		                    out.print("<h3 style='color:red'>Username already exists!</h3>");
		                    RequestDispatcher rd = req.getRequestDispatcher("/SignUp.jsp");
		                    rd.include(req, resp);
		                } else {
		                	// Close previous PreparedStatement before creating a new one
		                	try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
				            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		                    //inserting new user
		                    String insertQuery = "INSERT INTO signup (username, password) VALUES (?, ?)";
		                    pstmt = con.prepareStatement(insertQuery);
		                    pstmt.setString(1, uname);
		                    pstmt.setString(2, pass);
		                    int count = pstmt.executeUpdate();

		                    if (count > 0) {
		                    	resp.setContentType("text/html");
		                        out.print("<h3 style='color:green'>Signup successful! You can log in now.</h3>");
		                        RequestDispatcher rd = req.getRequestDispatcher("/SignUp.jsp");
		                        rd.include(req, resp);
		                    }
		                }
		            } 
		            else if ("login".equals(action)) {
		                // Login logic
		                String loginQuery = "SELECT * FROM signup WHERE username=? AND password=?";
		                pstmt = con.prepareStatement(loginQuery);
		                pstmt.setString(1, uname);
		                pstmt.setString(2, pass);
		                rs = pstmt.executeQuery();

		                if (rs.next()) {
		                    HttpSession session = req.getSession();
		                    session.setAttribute("username", uname);
		                    resp.sendRedirect("./Booking.jsp"); // Redirect to booking page after login
		                } else {
		                	resp.setContentType("text/html");
		                    out.print("<h3 style='color:red'>Invalid username or password or SignUp first</h3>");
		                    RequestDispatcher rd = req.getRequestDispatcher("/SignUp.jsp");
		                    rd.include(req, resp);
		                }
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		            resp.setContentType("text/html");
		            out.print("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
		            RequestDispatcher rd = req.getRequestDispatcher("/SignUp.jsp");
                    rd.include(req, resp);
		        } finally {
		            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		            try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
		        }
		}
}

