<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            max-width: 500px;
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

<body>
    <div class="welcome-bar" >
        <h3>WELCOME TO EMPLOYEE MANAGEMENT SYSTEM</h3>
    </div>

    <nav>
        <a href="/">Home</a>
        <a href="findAll">view All Employees</a>
        <a href="search">Search Employee</a>
        <a href="logoutreq">Logout</a>
    </nav>

    <div id="home" class="container">
      <h2>Welcome to  <%= session.getAttribute("email") %></h2>  
      <form action = "edituser">
		<% if(request.getAttribute("status") != null) { %>
            <h1 style="text-align: center;"><%= request.getAttribute("status")%></h1>
            <% } %>
              <label for="id">ID</label>
            <input type="number" name="id" value="<%= request.getParameter("id") %>" readonly />
            
            <label for="name">Name</label>
            <input type="text" name="name" value="<%= request.getParameter("name") %>" required />

            <label for="email">Email</label>
            <input type="text" name="email" value="<%= request.getParameter("email") %>"required />

            <label for="password">Password</label>
            <input type="password" name="password" value="<%= request.getParameter("password") %>" required />

            <label for="age">Enter Age</label>
            <input type="text" name="age" value="<%= request.getParameter("age") %>" required />


			<label>Gender</label>
            <div class="gender">
                <label><input type="radio" name="gender" value="male" required /> Male</label>
                <label><input type="radio" name="gender" value="female" required /> Female</label>
                <label><input type="radio" name="gender" value="others" required /> Others</label>
            </div>

            <label for="mobile">Mobile</label>
            <input type="text" name="mobile" value="<%= request.getParameter("mobile") %>" pattern="[0-9]{10}" required />


            <label for="department">Department</label>
            <input type="text" name="department" value="<%= request.getParameter("department") %>"required />

            <label for="address">Address</label>
            <textarea name="address" rows="3" required><%= request.getParameter("address") %></textarea>

            <button type="submit">Edit</button>
        </form>
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