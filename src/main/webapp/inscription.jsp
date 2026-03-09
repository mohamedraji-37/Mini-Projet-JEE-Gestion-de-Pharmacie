<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription Client</title>
    <link rel="stylesheet" type="text/css" href="css/inscription.css">
</head>
<body>
    <div class="container">
        <form action="InscriptionServlet" method="post">
            <h2>Créer un compte</h2>
            
        
            <% if(request.getAttribute("error") != null) { %>
                <p class="error-message"><%= request.getAttribute("error") %></p>
            <% } %>
            <% if(request.getAttribute("success") != null) { %>
                <p class="success-message"><%= request.getAttribute("success") %></p>
            <% } %>

            <label>Nom :</label>
            <input type="text" name="nom" placeholder="Votre nom complet" required>

            <label>Téléphone :</label>
            <input type="text" name="telephone" placeholder="Votre numéro de téléphone">

            <label>Email :</label>
            <input type="email" name="email" placeholder="username@email.com" required>

            <label>Mot de passe :</label>
            <input type="password" name="password" placeholder="Choisissez un mot de passe" required>

            <button type="submit">S'inscrire</button>

            <p class="login-link">
                Déjà un compte ? 
                <a href="Login.jsp">Se connecter</a>
            </p>
        </form>
    </div>
</body>
</html>