package com.krishn.hotelreservationsystem;
import java.io.*;
import java.sql.*;
import java.time.LocalDate;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/Booking")
public class BookingServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		PrintWriter out=resp.getWriter();
		//getting session values from hotel.jsp to store 
		HttpSession details=req.getSession();
		String CheckIn=(String)details.getAttribute("check-in");
		String CheckOut=(String)details.getAttribute("check-out");
		String adults=(String)details.getAttribute("adult");
		String Children=(String)details.getAttribute("child");
		
		 // Validate session values before parsing
	    if (CheckIn == null || CheckOut == null) {
	        out.print("<h3 style='color:red'>Session expired or missing check-in/check-out dates.</h3>");
	        return;
	    }

		
		//convert strings to local date
		LocalDate checkInDate = LocalDate.parse(CheckIn);
		LocalDate checkOutDate=LocalDate.parse(CheckOut);
		LocalDate today = LocalDate.now();
				
		//date and details validation
		if (checkInDate.isBefore(today)) {
	    out.print("<h3 style='color:red'>Check-in date cannot be in the past!</h3>");
	   return;
	     }
		if (checkOutDate.isBefore(checkInDate) || checkOutDate.isEqual(checkInDate)) {
				    out.print("<h3 style='color:red'>Check-out date must be after check-in date!</h3>");
				    return;
		   }
		if (adults == null ||adults.equals("Adult")) {
				    out.print("<h3 style='color:red'>Please select the number of adults!</h3>");
				    return;
			}
				if (Children==null||Children.equals("child")) {
				    out.print("<h3 style='color:red'>Please select the number of children!</h3>");
				    return;
			}
				
		//converting  values for database
		Date sqlInDate= Date.valueOf(checkInDate);   
		Date sqlOutDate = Date.valueOf(checkOutDate);   
		int num=Integer.parseInt(adults);
		int total=Integer.parseInt(Children);
				
		//getting values from booking.jsp to store
		String CustomerName=req.getParameter("customer_name");
	    String CustomerContact=req.getParameter("customer_contact");
	    String AadharNumber=req.getParameter("aadhar_number");
        String EmailId=req.getParameter("email_id");
		String Age=req.getParameter("age");
	    //converting values for database
		long contact=Long.parseLong(CustomerContact);
	    long aadhar=Long.parseLong(AadharNumber);
		int age=Integer.parseInt(Age);
		//Storing details in database
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelmangementsystem","root","admin");
			int customer_id = -1; // Default value
			String query="INSERT INTO customer(customer_name,customer_contact,customer_email,customer_aadhar,customer_age,no_of_adults,no_of_children,check_in_date,check_out_date) VALUES(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,CustomerName);
			pstmt.setLong(2,contact);
			pstmt.setString(3,EmailId);
			pstmt.setLong(4,aadhar);
			pstmt.setInt(5, age);
			pstmt.setInt(6,num);
			pstmt.setInt(7,total);
			pstmt.setDate(8,sqlInDate);
			pstmt.setDate(9,sqlOutDate);
			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected == 0) {
			    out.print("<h3 style='color:red'>Customer insertion failed.</h3>");
			    return;
			}
			// Retrieve customer_id
			 rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
			    customer_id = rs.getInt(1);
		}
			
			// Fetch room type from session
			String roomType = (String) details.getAttribute("room_type");
			
//			String roomType = req.getParameter("room_type");

			String roomQuery = "SELECT room_id FROM rooms WHERE room_type = ? AND status = 'available' LIMIT 1";
			PreparedStatement roomStmt = con.prepareStatement(roomQuery);
			roomStmt.setString(1, roomType);
			//roomStmt.setString(1, details.getAttribute("room_type").toString()); 
			ResultSet roomRs = roomStmt.executeQuery();

			int room_id = -1; // Default value
			if (roomRs.next()) {
			    room_id = roomRs.getInt("room_id");
			}
			if (customer_id == -1) {
			    out.print("<h3 style='color:red'>Error: Customer ID not retrieved.</h3>");
			    return;
			}
			if (room_id == -1) {
			    out.print("<h3 style='color:red'>Error: No available room found.</h3>");
			    return;
			}
			if (room_id != -1 && customer_id != -1) { 
			    String bookingQuery = "INSERT INTO bookings (room_id, check_in, check_out,customer_id) VALUES (?, ?, ?, ?)";
			    PreparedStatement bookingStmt = con.prepareStatement(bookingQuery);
			    bookingStmt.setInt(1,room_id );
			    bookingStmt.setDate(2,sqlInDate );
			    bookingStmt.setDate(3,sqlOutDate );
			    bookingStmt.setInt(4,customer_id);
			    int bookingRows = bookingStmt.executeUpdate();

			    if (bookingRows == 0) {
			        out.print("<h3 style='color:red'>Booking insertion failed.</h3>");
			        return;
			    }
			}
			
			String updateRoomQuery = "UPDATE rooms SET status = 'booked' WHERE room_id = ?";
			PreparedStatement updateRoomStmt = con.prepareStatement(updateRoomQuery);
			updateRoomStmt.setInt(1, room_id);
			updateRoomStmt.executeUpdate();
			out.print("<h3 style='color:green'>Booking successful! Redirecting...</h3>");
			resp.sendRedirect("./Confirmed.jsp");
			
						}
		catch(Exception e) {
			e.printStackTrace();
			out.print("<h3 style='color:red'>An error occurred: " + e.getMessage() + "</h3>");
			
		}
		 finally {
	          try {
	              if (rs != null) rs.close();
	              if (pstmt != null) pstmt.close();
	              if (con != null) con.close();
	          } catch (SQLException e) {
	              e.printStackTrace();
	          }
	      }
	}
}
