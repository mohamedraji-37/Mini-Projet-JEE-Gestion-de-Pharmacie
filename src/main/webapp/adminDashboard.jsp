<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/adminDashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<header>
    <div class="header-left">
     
        <a href="AjouterServlet">Ajouter</a>
        <a href="ModifierServlet">Modifier</a>
        <a href="SupprimerServlet">Supprimer</a>
        <a href="RechercherServlet">Rechercher</a>
        <a href="ConsulterStockServlet">Stock</a>
    </div>

    <div class="header-right">
        <i class="fas fa-user"></i>
        <span>Admin1</span>
    </div>
</header>

<main class="main-container">

    <div class="buttons-grid">

        <div class="card">
            <form action="AjouterServlet">
                <button class="btn add" type="submit">
                    <i class="fas fa-plus"></i> Ajouter
                </button>
            </form>
            <div class="description">
                Ajouter un nouveau médicament au stock
            </div>
        </div>

        <div class="card">
            <form action="ModifierServlet">
                <button class="btn update" type="submit">
                    <i class="fas fa-edit"></i> Modifier
                </button>
            </form>
            <div class="description">
                Modifier les informations d’un médicament
            </div>
        </div>

        <div class="card">
            <form action="SupprimerServlet">
                <button class="btn delete" type="submit">
                    <i class="fas fa-trash"></i> Supprimer
                </button>
            </form>
            <div class="description">
                Supprimer un médicament existant
            </div>
        </div>

        <div class="card">
            <form action="RechercherServlet">
                <button class="btn search" type="submit">
                    <i class="fas fa-search"></i> Rechercher
                </button>
            </form>
            <div class="description">
                Rechercher un médicament dans la base
            </div>
        </div>

    </div>

    <div class="right-space">
        <img src="Images/adminpharmacie.jpg" alt="Pharmacie">
    </div>

</main>

</body>
</html>