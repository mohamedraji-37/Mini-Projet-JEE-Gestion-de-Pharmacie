<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navbar</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

<link rel="stylesheet" href="css/nave.css">
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark pharmacy-navbar shadow-sm">

<div class="container-fluid">

<a class="navbar-brand" href="#">
<img src="Images/pngtree-medical-cross-and-health-pharmacy-logo-vector-template-image_148831.jpg" height="50px">
</a>

<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarNav">

<ul class="navbar-nav">

<li class="nav-item">
<a class="nav-link active" aria-current="page" href="#">Home</a>
</li>

<li class="nav-item">
<a class="nav-link" href="commande">Comander</a>
</li>

<li class="nav-item">
<a class="nav-link" href="medicaments">Médicaments</a>
</li>

<li class="nav-item">
<a class="nav-link" href="contact.jsp">Contact</a>
</li>
<li class="nav-item">
        <a class="nav-link" href="apropos.jsp">À propos</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="suiviCommande.jsp">Suivi de Commande</a>
    </li>
    

</ul>


<div class="ms-auto d-flex">
    <a href="login.jsp" class="btn logout-btn d-flex align-items-center">

        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="white" class="me-2" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M10 15a1 1 0 0 0 1-1v-3h-1v3H2V2h8v3h1V2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8z"/>
            <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L14.293 7.5H6.5a.5.5 0 0 0 0 1h7.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
        </svg>

        Déconnexion

 

</a>

</div>

</div>

</div>

</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>
</html>