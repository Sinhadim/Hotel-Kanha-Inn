package com.krishn.hotelreservationsystem;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/RoomSelectionServlet")
public class RoomSelectionServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 HttpSession session = request.getSession(true); // Get existing session if available
		 
		 String roomType = request.getParameter("roomType");
	        System.out.println("Debug: Received roomType = " + roomType); // Debugging output

	        if (roomType == null || roomType.isEmpty()) {
	            response.getWriter().println("<h3 style='color:red'>Error: Room type not received!</h3>");
	            return;
	        }
	        // Store roomType in session
	        session.setAttribute("room_type", roomType);
              
	        // Check if user is logged in
	        if (session != null && session.getAttribute("username") != null) {
	            // User is logged in, redirect to booking page
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("Booking.jsp");
	        	dispatcher.forward(request, response);
	        } else {
	            // User not logged in, redirect to signup/login page
	            response.sendRedirect("SignUp.jsp");
	        }
	}
}
