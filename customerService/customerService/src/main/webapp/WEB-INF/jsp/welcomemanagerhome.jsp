<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>WelcomeManagerHome</title>
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/home.css">
<style type="text/css">
form:label {
	display: inline-block;
	width: 200px;
	margin: 5px;
	text-align: left;
}

table td{
  color:#FFFFFF;
}

input {
	width: 200px;
}

input[type="submit"] {
      	background-color: #4CAF50;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }

section {
	padding: 15px;
} 

.hero-table {
	border-collapse: collapse;
	width: 40%;
	text-align: center;
}
</style>
</head>
<body>
	<header>
		<div class="navbar">
			<a href="/welcomemanagerhome">Home</a>
			<a href="/managerreports">Reports</a>
			<a href="/managercreditcard/<%=session.getAttribute("managerId")%>">Credit Cards</a>
			<a href="/managerscheduledpayments">Scheduled Payments</a>
		</div>
	</header>
	<br>
	<main>
		<section class="hero">
		<table style="width:30%" align = "right">
  			<tr>
    			<td><h4 align = "right" style="color: #FFFFFF;">Welcome <%=session.getAttribute("managerName")%>!</h4></td>		
    			<td>
    				<form action="/logout" method="get">
   						<input type="submit" value="Logout">
					</form>
				</td>
  			</tr>
		</table><br><br>
		<h2 style="color: #FFFFFF;">Customer Search</h2>
		<br><br>	
			<form action="/usersearch" method="get">
  			<table style="width:40%" align = "center">
  				<tr>
  					<td><input type="hidden" id="managerId" name="managerId" value = <%=session.getAttribute("managerId")%>>
  					<td><label for="firstName" style="color: #FFFFFF;">User Name: </label></td>
  					<td style="color: #000000;"><input type="text" id="firstName" name="firstName"></td>
  				</tr>
  			</table>
  			<br/><br/>
  			<input type="submit"/>
  			</form>
  			<br/><br/>
  			<table style="width:40%" align = "center">
  				<tr><td>FirstName</td>
  					<td>Last Name</td>
  				    <td>User Name</td>
  					<td>Mobile</td>
  					<td>eMail</td>
  					<td>Zip Code</td>
  					<td>City</td></tr>
  				<c:forEach items="${customers}" var="user">
        			<tr><td><c:out value="${user.firstName}"/></td>
        				<td><c:out value="${user.lastName}"/></td>
        				<td><c:out value="${user.userId}"/></td>
        				<td><c:out value="${user.mobile}"/></td>
        				<td><c:out value="${user.email}"/></td>
        				<td><c:out value="${user.zipCode}"/></td>
        				<td><c:out value="${user.city}"/></td>
    			</c:forEach>
  			</table>
    	</section>
	</main>
	</body>
</html>