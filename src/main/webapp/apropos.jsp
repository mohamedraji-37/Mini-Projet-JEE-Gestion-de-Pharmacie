<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>À propos</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f8f4;
        }

        .about {
            background-color: white;
            margin: 40px auto;
            width: 80%;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .about h1 {
            color: #1b5e20;
        }

        .about h2 {
            color: #2e7d32;
            margin-top: 20px;
        }

        .about p {
            color: #444;
            line-height: 1.6;
        }

        .section {
            border-left: 5px solid #4caf50;
            padding-left: 15px;
            margin-bottom: 20px;
        }
    </style>

</head>

<body>


<jsp:include page="Nave.jsp" />


<div class="about">

    <h1>À propos de notre pharmacie</h1>

    <p>
        Bienvenue dans notre pharmacie en ligne, votre partenaire de confiance pour votre santé et votre bien-être.
    </p>

    <div class="section">
        <h2>Notre mission</h2>
        <p>
            Offrir des médicaments de qualité avec un service rapide et sécurisé,
            tout en vous accompagnant avec des conseils professionnels adaptés.
        </p>
    </div>

    <div class="section">
        <h2>Nos valeurs</h2>
        <p>
            Qualité des produits<br>
            Confiance et sécurité<br>
            Proximité avec nos clients<br>
            Innovation digitale
        </p>
    </div>

    <div class="section">
        <h2>Nos services</h2>
        <p>
            Commande en ligne simple<br>
            Suivi de commande<br>
            Assistance client<br>
            Livraison rapide
        </p>
    </div>

    <div class="section">
        <h2>Pourquoi nous choisir ?</h2>
        <p>
            Parce que votre santé est notre priorité, nous vous garantissons
            un service fiable, moderne et sécurisé.
        </p>
    </div>

    <div class="section">
        <h2>Contact</h2>
        <p>
            Notre équipe est disponible pour répondre à toutes vos questions.
        </p>
    </div>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>