<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/image/Kanha Inn2.png">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/SignUp.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Log_In/Sign_Up</title>
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
                <a href="./gallery.jsp">Gallery</a>
                <a href="./contact.jsp">Contact</a>
            </div>
        
        </div>

        <div class="login">
            <h1>
                <marquee scrolldelay="500">Login</marquee>
            </h1>
         <form action="signup" method="post" onsubmit="return setAction(event)"> 
    <input type="hidden" name="action" id="action" value="signup"> <!-- Default action set to signup -->

    <label for="username">Username</label>
    <input type="text" id="username" name="username" placeholder="Enter your username" required>
    <i class='bx bxs-user'></i>
    <br>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="Enter your password" required><br>

    <button type="submit" id="Signbtn" value="signup">Sign Up</button><br>
    <button type="submit" id="a" value="login">Log In</button><br>
    <button type="submit" id="b">Forgot Password</button><br>
</form>

<script>
	function setAction(event) {
    const clickedButton = event.submitter;
    if (clickedButton && clickedButton.value) {
        document.getElementById('action').value = clickedButton.value;
    }
    return validateForm(); // Run validation and return result (true = submit, false = prevent submit)
	}
		
	function validateForm() {
	    let username = document.getElementById("username").value;
	    let password = document.getElementById("password").value;

	    let usernameRegex = /^[a-zA-Z0-9]{5,}$/; // Min 5 chars, letters & numbers only
	    let passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/; // Min 8 chars, 1 uppercase, 1 lowercase, 1 number, 1 special char

	    // Username validation
	    if (!usernameRegex.test(username)) {
	        alert("Username must be at least 5 characters long and contain only letters and numbers.");
	        return false; // Prevent form submission
	    }

	    // Password validation
	    if (!passwordRegex.test(password)) {
	        alert("Password must be at least 8 characters long and include:\n- At least one uppercase letter\n- At least one lowercase letter\n- At least one number\n- At least one special character (@$!%*?&)");
	        return false; // Prevent form submission
	    }

	    return true; // Allow form submission if both validations pass
	}
</script>
         </div>
    </div>
</body>
</html>