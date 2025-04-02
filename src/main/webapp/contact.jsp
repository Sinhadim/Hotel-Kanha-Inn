<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/contact.css">

</head>
<body>

    <div class="main">
        
        <div class="nav">
            <a href="./hotel.jsp">Home</a>
            <a href="./gallery.jsp">Gallery</a>
            <a href="./about.jsp">AboutUs</a>
            <a href="contact.jsp">Contact</a>
        </div>

    <h2>Contact Us</h2>

    <!-- Basic Hotel Information -->
    <h3>Hotel Information</h3>
    <p><strong>Hotel Name:</strong> Krishna Inn</p>
    <p><strong>Address:</strong> 123 Krishna Inn- Bangalore india</p>
    <p><strong>Phone Number:</strong>+91 98649XXXXX</p>
    <p><strong>Email:</strong> abc12@gmail.com</p>
    <p><strong>Operating Hours:</strong> Available 24/7</p>

    <!-- Contact Form -->
    <h3>Send Us a Message</h3>
    <form action="#" method="POST">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="subject">Subject (Optional):</label><br>
        <input type="text" id="subject" name="subject"><br><br>

        <label for="message">Message:</label><br>
        <textarea id="message" name="message" rows="5" required></textarea><br><br>

        <button type="submit">Submit</button>
    </form>

    <!-- Location & Map -->
    <h3>Find Us Here</h3>
    <iframe 
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.835434509364!2d144.95373531531593!3d-37.81720997975192!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzfCsDQ5JzAyLjAiUyAxNDTCsDU3JzEzLjQiRQ!5e0!3m2!1sen!2sus!4v1630928627089!5m2!1sen!2sus" 
        width="400" height="300" allowfullscreen="" loading="lazy">
    </iframe>

    <!-- Customer Support & Reservations -->
    <h3>Customer Support & Reservations</h3>
    <p><strong>Reservation Contact:</strong> +91 70042XXXX</p>
    <p><strong>WhatsApp Support:</strong> +91 74563XXXX</p>

    </div>
</body>
</html>
