<!DOCTYPE html>
<%@page import="org.jsp.entity.Hotel"%>
<%@page import="org.jsp.entity.Admin"%>
<%@page import="java.util.List"%>
<%@page import="org.jsp.dao.AdminDaoImpl"%>
<%@page import="org.jsp.dao.AdminDao"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hotel</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-image:
		url("http://localhost:8080/Hotel_Booking_System/Images/Owall-Hotel-Seoul-Exterior.jpeg");
	background-repeat: no-repeat;
	background-position: inherit;
	/* background-size: cover; */
	background-attachment: fixed;
	background-size: 100% 100%;
	/* height: 300px; */
	/* position: absolute; */
}

a {
	color: white;
}

.navbar {
	background-color: rgba(0, 0, 0, 0.5);
	/* Use RGBA with alpha value less than 1 for transparency */
}

.navbar-nav .nav-item a.nav-link {
	color: white; /* Set the text color to white */
}

#btn {
	color: white;
}

label, h1, th, td {
	color: white;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light navbar-expand-md">
		<a href="" class="navbar-brand" style="color: white;"> <img
			src="https://w7.pngwing.com/pngs/927/770/png-transparent-hotel-logo-resort-suite-investment-banking-letter-b-angle-company-text.png"
			width="50px" style="border-radius: 10px;" alt="No img"> Hotel
			Booking System
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link "
					href="/Hotel_Booking_System/admin/Home.jsp">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Hotels </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item"
							href="http://localhost:8080/Hotel_Booking_System/admin/AddHotel.jsp">Add
								Hotel</a></li>
						<li><a class="dropdown-item"
							href="http://localhost:8080/Hotel_Booking_System/admin/HotelList.jsp">Hotel
								List</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Users </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item"
							href="/Hotel_Booking_System/admin/AddUser.jsp">Add Users</a></li>
						<li><a class="dropdown-item"
							href="/Hotel_Booking_System/admin/UserList.jsp">User List</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Booking </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item"
							href="/Hotel_Booking_System/admin/BookingList.jsp">Booking
								List</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link "
					href="PaymentList.html">Payment</a></li>
			</ul>
		</div>
		<ul class="navbar-nav ml-auto">
			<!-- Add ml-auto class to push "Contact" to the right -->
			<li class="nav-item"><a class="nav-link"
				href="/Hotel_Booking_System/logout">LogOut</a></li>
		</ul>
	</nav>

	<%  
    	String msg = request.getParameter("msg");
    	if(msg != null){
    		if(msg.equals("added")){
    %>

	<center>
		<h2 style="color: green";>Admin Registred Sucessfully!!!</h2>
	</center>

	<%} else if(msg.equals("update")){ %>

	<center>
		<h2 style="color: green;";>Admin Updated Sucessfully!!!</h2>
	</center>

	<%    }
    	}	
    	
        AdminDao dao = new AdminDaoImpl();
        List<Admin> admins = dao.getAllUserDetails();
        
        if(admins != null){
    	
    	%>

<nav class="navbar navbar-dark justify-content-center">
		<form class="form-inline" action=" ">
			<div class="row mb-3">
				<div class="col">
					<h1 class="navbar-brand">SEARCH ADMIN</h1>
				</div>
				<div class="col">
					<input class="form-control " type="search" placeholder="Search"
						aria-label="Search" name="keyword">
				</div>
				<div class="col">
					<button class="btn btn-outline-success " type="submit">Search</button>
				</div>
			</div>
		</form>
	</nav>
	<%
		String keyword = request.getParameter("keyword");
		if(keyword != null){
		admins = dao.getAdminByKeyword(keyword);
		}
	%>

	<div class="container">
		<h1>Admins List</h1>
		<form action="">
			<table class="table ">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<!--  <th scope="col">DOB</th>
                    <th scope="col">Gender</th> -->
						<th scope="col">Email</th>
						<th scope="col">Mobile</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>

					<%
                for(Admin admin:admins){
                %>
					<tr>
						<th scope="row"><%= admin.getAdminId() %></th>
						<td><%= admin.getFirstName() %></td>
						<td><%= admin.getLastName() %></td>
						<!--  <td>Otto</td>
                    <td>@mdo</td> -->
						<td><%= admin.getEmail() %></td>
						<td><%= admin.getMobile() %></td>
						<td><a
							href="/Hotel_Booking_System/admin/EditAdmin.jsp?adminId=<%=admin.getAdminId()%>"
							id="btn" class="button btn btn-outline-dark">Update</a> &nbsp; <a
							href="/Hotel_Booking_System/DeleteAdmin?adminId=<%=admin.getAdminId()%>" id="btn" class="button btn btn-outline-dark">Delete</a>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</form>
	</div>
	<%}
        else{%>
        
        <center> <h2 style="color: red;">Record Not Found</h2></center>
      <%} %>  

</body>
</html>