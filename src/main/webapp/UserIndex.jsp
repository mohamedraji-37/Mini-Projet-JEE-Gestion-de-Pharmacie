<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="css/UserIndex.css">
</head>
<body>
    <%@ include file="Nave.jsp" %>
<div class="container">
    <div class="Card" style="width: 35rem;"> <div class="card-body">
            <h1 class="card-title display-5 fw-bold">Bienvenue dans notre pharmacie</h1>
            <p class="card-text fs-5 mt-3">
                Nous sommes à votre service pour vous offrir des médicaments de qualité, 
                des conseils professionnels et un accompagnement personnalisé pour votre santé et votre bien-être. 
                Votre confiance est notre priorité.
            </p>
            <div class="mt-4">
                <a class="btn btn-custom" href="commande" role="button">Commander</a>
                <a class="btn btn-custom ms-2" href="medicaments" role="button">Médicaments</a>
            </div>
        </div>
    </div>
    <div class="logo">
        <img src="Images/download.png" width="350px"> </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<%@ include file="footer.jsp" %>
</body>
</html>