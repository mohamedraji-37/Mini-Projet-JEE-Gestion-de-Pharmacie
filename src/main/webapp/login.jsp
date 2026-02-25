<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Connexion Client</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
    <div class="container">
        <form action="LoginServlet" method="post">
            <h2>Authentification Client</h2>

            <label>Email :</label>
            <input type="text" name="email" placeholder="Veuillez entrer votre adresse email" required>

            <label>Mot de passe :</label>
            <input type="password" name="password" placeholder="Veuillez entrer votre mot de passe" required>
            <!-- Affichage message d'erreur -->
<%
    String error = (String) request.getAttribute("error");
    if(error != null){
%>
    <p style="color:red;"><%= error %></p>
<%
    }
%>

            <button type="submit">Se connecter</button>
            <p class="register-link">
    Vous n'avez pas de compte ?
    <a href="register.jsp">Créer un compte</a>
</p>

        </form>
    </div>




</body>
</html>