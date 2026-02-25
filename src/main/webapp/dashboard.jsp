<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            font-family: Arial, sans-serif;
            background: url('<%= request.getContextPath() %>/Images/Pharmacie3.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            width: 420px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        h1 {
            color: #2f7d32; /* Vert comme ton login */
            margin-bottom: 10px;
        }

        p {
            color: #444;
            margin-bottom: 30px;
        }

        .btn-continuer {
            display: inline-block;
            width: 100%;
            padding: 12px;
            background-color: #2f7d32;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-continuer:hover {
            background-color: #256428;
        }
    </style>
</head>
<body>

    <div class="card">
        <h1>Bienvenue sur Notre Pharmacie </h1>
        <p>Vous êtes connecté !.</p>

        <!-- Bouton Continuer vers index.jsp -->
        <a href="index.jsp" class="btn-continuer">Continuer</a>
    </div>

</body>
</html>