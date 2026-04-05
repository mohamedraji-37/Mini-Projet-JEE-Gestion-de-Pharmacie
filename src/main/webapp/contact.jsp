<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f8f4;
        }

        .contact-container {
            width: 80%;
            margin: 50px auto;
            display: flex;
            gap: 40px;
            flex-wrap: wrap;
        }

        .contact-info, .contact-form {
            flex: 1;
            min-width: 300px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #1b5e20;
        }

        p {
            color: #444;
        }

        .info-item {
            margin-bottom: 15px;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .contact-form button {
            background-color: #2e7d32;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .contact-form button:hover {
            background-color: #1b5e20;
        }

        .success {
            color: green;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<jsp:include page="Nave.jsp" />

<div class="contact-container">

  
    <div class="contact-info">
        <h2>Contactez-nous</h2>

        <div class="info-item">
            <strong>Adresse :</strong><br>
            Maroc, Beni Mellal, Mghila
        </div>

        <div class="info-item">
            <strong>Téléphone :</strong><br>
            +212 632446156
        </div>

        <div class="info-item">
            <strong>Email :</strong><br>
            contact@pharmaciemghila.com
        </div>
    </div>

 
    <div class="contact-form">
        <h2>Envoyer un message</h2>

        <% if(request.getAttribute("success") != null) { %>
            <p class="success"><%= request.getAttribute("success") %></p>
        <% } %>

        <form action="contact" method="post">
            <input type="text" name="nom" placeholder="Votre nom" required>
            <input type="email" name="email" placeholder="Votre email" required>
            <textarea name="message" rows="5" placeholder="Votre message" required></textarea>
            <button type="submit">Envoyer</button>
        </form>
    </div>
    <% if(request.getAttribute("error") != null) { %>
    <p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>