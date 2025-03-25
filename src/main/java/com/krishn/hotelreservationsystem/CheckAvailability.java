package com.krishn.hotelreservationsystem;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/CheckAvailability")
public class CheckAvailability extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// Get user input from request
        String checkIn = request.getParameter("check-in");
        String checkOut = request.getParameter("check-out");
        String adults = request.getParameter("adult");
        String children = request.getParameter("child");
        
        // If session data is missing, redirect to homepage
        if (checkIn == null || checkOut == null || adults==null || children==null) {
            response.sendRedirect("./hotel.jsp");
            return;
        }


        // Store data in session
        HttpSession session = request.getSession();
        session.setAttribute("check-in", checkIn);
        session.setAttribute("check-out", checkOut);
        session.setAttribute("adult", adults);
        session.setAttribute("child", children);

        // Redirect to room.jsp
        response.sendRedirect("./room.jsp");
	}
}
