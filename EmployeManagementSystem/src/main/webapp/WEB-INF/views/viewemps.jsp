<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

       body {
		    min-height: 100vh;
		    padding-top: 150px;
		    background-size: cover;
		    background-position: center;
		    background-repeat: no-repeat;
		    position: relative;
            transition: background-image 0.5s ease;
        }
        body::before {
			    content: "";
			    position: fixed;
			    top: 0;
			    left: 0;
			    width: 100%;
			    height: 100%;
			    background-image: inherit;
			    background-size: cover;
			    background-position: center;
			    filter: blur(3px);
			    z-index: -1;
			}

        .welcome-bar {
            position: fixed;
            top: 0;
            width: 100%;
            text-align: center;
            padding: 15px 0;
            font-size: 24px;
            font-weight: bold;
            color: whitesmoke;
            z-index: 1000;
        }
        .welcome-bar:hover{
            text-decoration: none;
            color: beige;
        }

        nav {
            position: fixed;
            top: 55px;
            width: 100%;
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 15px 0;
            z-index: 999;
            background-color: transparent;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
            cursor: pointer;
        }

        nav a:hover {
            text-decoration: underline;
            color: bisque;
        }

        .container,
        .section-content,
        .home-content {
            max-width: 1200px;
            margin: 30px auto;
            background: rgba(255, 255, 255, 0.6);
            padding: 30px;
            border-radius: 25px;
            border: 2px solid #444;
            display: none;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .home-content:hover{
            text-decoration: none;
            color: black;
        }


        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 12px;
            font-weight: bold;
        }

        input,
        select,
        textarea {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #aaa;
            border-radius: 5px;
        }

        .gender {
            display: flex;
            justify-content: space-around;
            margin-top: 5px;
        }

        .gender label {
            font-weight: normal;
        }

        button {
            margin-top: 20px;
            padding: 12px;
            background-color: lightblue;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #005f9e;
        }

        .home-content {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: darkslategray;
        }
    </style>
</head>

<body >
    <div class="welcome-bar" >
        <h3>WELCOME TO EMPLOYEE MANAGEMENT SYSTEM</h3>
    </div>

    <nav>
        <a href="/">Home</a>
        <a href="viewAll">view All Employees</a>
        <a href="search">Search Employee</a>
        <a href="logoutreq">Logout</a>
    </nav>

    <div id="home" class="container">
      <h2>Welcome to  <%= session.getAttribute("email") %></h2>  
           <table border="1">
         <tr>
      <th>Id</th>
      <th>Name</th>
      <th>Email</th>
      <th>Password</th>
      <th>Age</th>
      <th>Department</th>
      <th>Mobile</th>
      <th>Gender</th>
      <th>Address</th>
      <th>Update</th>
      <th>Delete</th>
      </tr>
      <c:forEach var="employee" items="${emplist}">
      <tr>
      <td>${employee.id}</td>
      <td>${employee.name}</td>
      <td>${employee.email}</td>
      <td>${employee.password}</td>
      <td>${employee.age}</td>
      <td>${employee.department}</td>
      <td>${employee.mobile}</td>
      <td>${employee.gender}</td>
      <td>${employee.address}</td>
      <td><a href = 'edit?id=${employee.id}&name=${employee.name}&email=${employee.email}&password=${employee.password}&age=${employee.age}&department=${employee.department}&mobile=${employee.mobile}&gender=${employee.gender}&address=${employee.address}'>Edit</a></td>
      <td><a href= 'delete?id=${employee.id}'>Delete</a></td>
      </tr>
      </c:forEach>
      </table>
 
    </div>
    <div id="registration" class="container">
        
    </div>
    <div id="login" class="container">
     
    </div>

    <div id="admin" class="section-content">
        
    </div>

    <div id="about" class="section-content">
        
    </div>

    <div id="contact" class="section-content">
        
    </div>

    <script>
        function showSection(sectionId) {
            const sections = ['home', 'registration', 'login', 'admin', 'about', 'contact'];
            const backgrounds = {
            	    home: 'url("https://images.pexels.com/photos/3183197/pexels-photo-3183197.jpeg")',

            	    registration: 'url("https://images.pexels.com/photos/1181406/pexels-photo-1181406.jpeg")',

            	    login: 'url("https://images.unsplash.com/photo-1593642532400-2682810df593")',

            	    admin: 'url("https://images.pexels.com/photos/3184360/pexels-photo-3184360.jpeg")',

            	    about: 'url("https://images.unsplash.com/photo-1598257006455-0270f1f2b459")',

            	    contact: 'url("https://images.pexels.com/photos/5668859/pexels-photo-5668859.jpeg")'
            	};



            sections.forEach(id => {
                document.getElementById(id).style.display = (id === sectionId) ? 'block' : 'none';
            });

            document.body.style.backgroundImage = backgrounds[sectionId] || '';
        }

        showSection('home');
    </script>

</body>

</html>