<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Pharmacy Admin Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
   <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, Helvetica, sans-serif;
    }

    body {
      height: 100vh;
      background: linear-gradient(135deg, #e8f5e9, #ffffff);
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .login-container {
      background: white;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 8px 25px rgba(0, 128, 0, 0.15);
      width: 350px;
      text-align: center;
      border-top: 6px solid #2e7d32;
    }

    .login-container h2 {
      color: #2e7d32;
      margin-bottom: 10px;
    }

    .login-container p {
      color: #666;
      margin-bottom: 25px;
      font-size: 14px;
    }

    .input-group {
      margin-bottom: 18px;
      text-align: left;
    }

    .input-group label {
      display: block;
      margin-bottom: 5px;
      color: #2e7d32;
      font-weight: bold;
      font-size: 14px;
    }

    .input-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #c8e6c9;
      border-radius: 6px;
      outline: none;
      transition: 0.3s;
    }

    .input-group input:focus {
      border-color: #2e7d32;
      box-shadow: 0 0 5px rgba(46, 125, 50, 0.3);
    }

    .login-btn {
      width: 100%;
      padding: 12px;
      background: #2e7d32;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
      transition: 0.3s;
      margin-top: 10px;
    }

    .login-btn:hover {
      background: #1b5e20;
    }

    .footer {
      margin-top: 20px;
      font-size: 12px;
      color: #888;
    }

    .logo {
      font-size: 40px;
      margin-bottom: 10px;
    }

  </style>
  </head>
<body>  <div class="login-container"><div class="logo">💊</div>

<h2>Pharmacy Admin</h2>
<p>Secure Login Panel</p>

<form action="Poweradmin" method="post">
  
  <div class="input-group">
    <label>Username</label>
    <input type="text" placeholder="Enter admin username" required name="user">
  </div>

  <div class="input-group">
    <label>Password</label>
    <input type="password" placeholder="Enter password" required name="pass">
  </div>
<%
String err= (String) request.getAttribute("error");
if (err != null){
%>
<br><p style = "color:red;"><%=err%></p>
<%}err=null; %>
  <button type="submit" class="login-btn">Login</button>

</form>

<div class="footer">
  Pharmacy Management System
</div>

  </div></body>
</html>