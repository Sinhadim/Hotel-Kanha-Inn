<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./image/Kanha Inn2.png">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/hotel.css">
    <title>Kanha INN</title>
</head>
<body>
    <div class="main">
        <div class="firstpage">

            <div class="slider">
                <img src="https://images.unsplash.com/photo-1445019980597-93fa8acb246c?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                alt="booking page">
            </div>

            <div class="nav1">

                <div class="logo">
                    <img src="./image/Kanha Inn.png">
                    <h1>Kanha INN</h1>
                </div>

                <div class="content">
                    <a href="./hotel.jsp">Home</a>
                    <a href="./about.jsp">About_Us</a>
                    <a href="./gallery.jsp">Gallery</a>
                    <a href="./contact.jsp">Contact</a>
                </div>

            </div>

		<form action="CheckAvailability" method="post"  onsubmit="return validateForm()">
            <div class="BookingBox">
            
                <div class="check1">
                    <label for="checkIn">
                        <h3>Check In</h3>
                    </label>
                    <input type="date" id="checkIn" name="check-in" required>
                </div>
            
                <div class="check2">
                    <h3>Check Out</h3>
                    <input type="date" id="checkOut" name="check-out" required>
                </div>
            
                <div class="adult">
                    <h3>Adult</h3>
                    <select name="adult" id="adult" required>
                        <option value="" disabled selected>Adult</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                    </select>
                </div>
            
                <div class="child">
                    <h3>child</h3>
                    <select name="child" id="child" required>
                        <option value="" disabled selected >child</option>
                        <option>0</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select>
                </div>
            
                <div class="checkAvailablity">
                  <button type="submit"><h3>CheckAvailablity</h3></button>
                </div>
            </div>

            <div class="btn1"><h3>Book now</h3></div>
        </div>
</form>

		<script>
function validateForm() {
    let checkIn = document.getElementById("checkIn").value;
    let checkOut = document.getElementById("checkOut").value;
    let adult = document.getElementById("adult").value;
    let child = document.getElementById("child").value;
    
    let today=new Date(); // Get today's date in YYYY-MM-DD format
    today.setHours(0, 0, 0, 0); 
    let checkInDate = new Date(checkIn);
    let checkOutDate=new Date(checkOut);
    if (checkIn === "") {
        alert("Please select a check-in date.");
        return false;
    }
    
    if (checkOut === "") {
        alert("Please select a check-out date.");
        return false;
    }

    if (checkInDate < today) {
        alert("Check-in date cannot be in the past.");
        return false;
    }

    if (checkOutDate <= checkInDate) {
        alert("Check-out date must be after the check-in date.");
        return false;
    }

    if (adult === "") {
        alert("Please select the number of adults.");
        return false;
    }

    if (child === "") {
        alert("Please select the number of children.");
        return false;
    }

    return true; // Form will be submitted if all conditions pass
}
</script>

        <div class="beforeabout">
            <div class="pic1">
                <img src="https://c4.wallpaperflare.com/wallpaper/686/52/945/luxurious-hotel-room-wallpaper-preview.jpg" alt="image 1">
            </div>
            <div class="pic2">
                <img src="https://cdn.magicdecor.in/com/2023/05/09111835/Untitled-design-13-710x488.jpg" alt="image 2">
            </div>
            <div class="pic3">
                <img src="https://i.pinimg.com/736x/c1/71/52/c17152da9bf2a5f3c2b581fce0e9d74c.jpg" alt="image 3">
            </div>
            <div class="pic4">
                <img src="https://wallpapers.com/images/hd/hotel-room-1920-x-1136-picture-ja7ylrpkgmb7xjyr.jpg" alt="image 4">
            </div>
            <div class="pic5">
                <img src="https://wallpapers.com/images/featured/hotel-room-background-qad26bgd35ll4qv6.jpg" alt="image 5">
            </div>
        </div>
        
        <div class="about">
            <h2>About Hotel Kanha Inn</h2>
            
            <br><br>
            
            <P>Welcome to Hotel Kanha Inn, Best Hotels in Jayanagar Bangalore where comfort and commodity will certainly be found in quality accommodation.
            </P>
            
            <br><br>
            
            <P>Conveniently located in Jayanagar right on Marenahalli road 20 meters from Raggiguda Temple Arch, it’s a
            two-minute walk
            to Bangalore Central Mall Jayanagar and a 10-minute walk to Jayadeva Hospital.Hotel Kanha Inn in Jayanagar is
            your
            perfect choice whether visiting for business or pleasure.
        </P>
        
        <br><br>
        
        <P>International guests arriving in Bangalore Airport can take a taxi which takes about an hour to the hotel. There
            are
            City link buses also from the Airport and the nearest stop is Jayadeva Hospital and its a 5 min drive from
            Jayadeva to
            the hotel.
        </P>
        
        <br><br>
        
        <P>Stay close to the office, Jayanagar is a business belt and home to many multinational companies. Ragigudda temple
            is
            just a 5-minute walk from the hotel.
        </P>
        
        <br><br>
        
        <P>Whether you are traveling for leisure or on business, make the most of your experience in Bangalore with a stay
            at our
            first-class hotel located at the heart of the city center. We love this city and wanted a Boutique hotel that is
            warm
            and inviting with classic design, quirky antiques, delicious locally sourced food menu, and most importantly is
            centrally located. Always stylish but not costing the earth to stay in,
        </P>
        
        <br>
        <h4>****Boutique Hotel on a budget!****</h4>
    </div>
    
    
    <div class="fourbox">
        
        <div class="box1">
            <div class="boxa1">
                <h3>Best Hospitality</h3>
                <p>The hotel is arranged on 5 floors and is equipped with a modern Lift. Rooms are furnished to five star standards. It
                    goes beyond the basics to offer an array of amenities including fully centralized A/C, Double Glazed windows, free wifi
                    and a modern bathroom. The family friendly hotel offers beautifully decorated corridors with Italian marble floors, beds
                    with pocket sprung Mattresses, design airchairs & flat screen LED Smart TV. A restful base to relax in.</p>
                </div>
                <div class="boxa2">
                    <img src="https://c4.wallpaperflare.com/wallpaper/686/52/945/luxurious-hotel-room-wallpaper-preview.jpg" alt="BOX image">
                </div>
            </div>
            
            
            <div class="box2">
                <div class="boxb1">
                    <img src="https://www.gourmetmarketing.net/hs-fs/hubfs/Imported_Blog_Media/Hotel-Location.jpg?width=2400&height=1594&name=Hotel-Location.jpg" alt="BOX image">
                </div>
                <div class="boxb2">
                    <h3>Convenient Location</h3>
                    <p>The hotel is conveniently located in the heart of the business district of Jayanagar with easy access to Shopping Malls,
                        Universities, Hospitals and various business establishments. Bangalore Central mall and Raggiguda Temple is just a 2
                        minute walk away from the hotel. Jain University and Manipal Hospital is a 3 minute walk and Jayadeva hospital is 10 a
                        minute walk.</p>
                    </div>
                </div>
            </div>
            
            <div class="lastcontainer">
                
                <div class="container">
                    <h1>About us</h1>
                    <h4>Kanha Inn, Best Hotels in Jayanagar Bangalore Welcome to Hotel Kanha Inn Jayangar Bangalore
                        where comfort and commodity will certainly be found in a quality accommodation.</h4>
                    </div>
                    
                    <div class="container">
                        <h1>Navigation</h1>
                        <div class="firstcontainer">
                            
                            <ul>
                                <li>Home</li>
                                <li>Rooms</li>
                                <li>From the Griddle</li>
                                <li>Location</li>
                                <li>Contact</li>
                                <li>Terms and Condition</li>
                            </ul>
                            
                            <ul>
                                <li>Abouts</li>
                                <li>Resturant</li>
                                <li>Amenities</li>
                                <li>Gallery</li>
                                <li>offers</li>
                                <li>Careers</li>
                            </ul>
                            
                        </div>
                    </div>
                    
        <div class="container">
            <h1>Lets Connect</h1>
            <div class="lastbox">
                <div class="symbol">
                    <i class='bx bxs-location-plus'></i>
                    <P>1353 South End Main Road 9th Block,
                        Jayanagar Near Ragigudda Temple Arch,
                        Bengaluru, Karnataka 560069</P>
                    </div>
                    
                    <div class="symbol">
                        <i class='bx bx-envelope'></i>
                        <P>shikhakhus123@gmail.com</P>
                    </div>
                    
                    <div class="symbol">
                        <i class='bx bxs-phone'></i>
                        <P>7004557538</P>
                    </div>
                    
                    <div class="symbol">
                        <i class='bx bxs-phone'></i>
                    <P>6209118286</P>
                </div>
                
            </div>
        </div>
        
    </div>

</div>
</body>
</html>
