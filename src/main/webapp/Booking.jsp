<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/booking.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/image/Kanha Inn2.png">
    <title>Booking Form</title>
     <script>
        function validateForm() {
            let name = document.getElementById("customer_name").value;
            let contact = document.getElementById("customer_contact").value;
            let aadhar = document.getElementById("aadhar_number").value;
            let email = document.getElementById("email_id").value;
            let age = document.getElementById("age").value;

            let nameRegex = /^[A-Za-z\s]{3,}$/;  // Name: Only letters, min 3 chars
            let contactRegex = /^[0-9]{10}$/;  // Contact: Exactly 10 digits
            let aadharRegex = /^[0-9]{12}$/;  // Aadhar: Exactly 12 digits
            let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;  // Email format
            let ageMin = 18;
            let ageMax = 100;

            if (!nameRegex.test(name)) {
                alert("Name must be at least 3 characters long and contain only letters.");
                return false;
            }
            if (!contactRegex.test(contact)) {
                alert("Contact number must be exactly 10 digits.");
                return false;
            }
            if (!aadharRegex.test(aadhar)) {
                alert("Aadhar number must be exactly 12 digits.");
                return false;
            }
            if (!emailRegex.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }
            if (age < ageMin || age > ageMax) {
                alert("Age must be between 18 and 100.");
                return false;
            }

            return true;
        }
    </script>
    </head>
<body>
    <div class="main">
        <div class="nav1">
        
            <div class="logo">
                <img src="<%=request.getContextPath() %>/image/Kanha Inn.png">
                <h1>Kanha INN</h1>
            </div>
        
            <div class="content">
                <a href="./hotel.jsp">Home</a>
                <a href="./about.jsp">About_Us</a>
                <a href="./room.jsp">Room</a>
                <a href="./contact.jsp">Contact</a>
            </div>
        
        </div>
    <div class="form-container">
        <h2>Customer Details Form</h2>
        <form action="Booking" method="post" onsubmit="return validateForm()">
            <label for="customer_name">Customer Name:</label>
            <input type="text" id="customer_name" name="customer_name" placeholder="Enter your name" required>
            
            <label for="customer_contact">Customer Contact:</label>
            <input type="tel" id="customer_contact" name="customer_contact" placeholder="Enter your Contact number" required>
            
            <label for="aadhar_number">Aadhar Number:</label>
            <input type="text" id="aadhar_number" name="aadhar_number" placeholder="Enter your aadhar number" required>
            
            <label for="email_id">Email ID:</label>
            <input type="email" id="email_id" name="email_id" placeholder="Enter your email id" required>
            
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" placeholder="select your age" required>
            
            <div class="submit-box">
                <button type="submit">Confirm</button>
            </div>
        </form>
    </div>
    </div>
</body>
</html>