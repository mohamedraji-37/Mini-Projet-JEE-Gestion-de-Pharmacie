<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Medicament" %>

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
        <a href="Ajouter_medicament.jsp">Ajouter</a>
        <a href="ModifierServlet">Modifier</a>
        <a href="javascript:void(0)" onclick="ouvrirPopup()">Supprimer</a>
        <a href="RechercherServlet">Rechercher</a>
        <a href="ConsulterStockServlet">Stock</a>
    </div>

    <div class="header-right">
        <i class="fas fa-user"></i>
 <span><%= session.getAttribute("nomAdmin") != null ? session.getAttribute("nomAdmin") : "Admin" %></span>
  <a href="Logout" title="Déconnexion" style="margin-left:10px; color:white;">
        <i class="fas fa-sign-out-alt"></i>
    </a>
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
            <div class="description">Ajouter un nouveau médicament au stock</div>
        </div>

        <div class="card">
            <form action="ModifierServlet">
                <button class="btn update" type="submit">
                    <i class="fas fa-edit"></i> Modifier
                </button>
            </form>
            <div class="description">Modifier les informations d’un médicament</div>
        </div>

        <div class="card">
            <button type="button" class="btn delete" onclick="ouvrirPopup()">
                <i class="fas fa-trash"></i> Supprimer
            </button>
            <div class="description">Supprimer un médicament existant</div>
        </div>

        <div class="card">
            <form action="RechercherServlet">
                <button class="btn search" type="submit">
                    <i class="fas fa-search"></i> Rechercher
                </button>
            </form>
            <div class="description">Rechercher un médicament dans la base</div>
        </div>
    </div>

    <div class="right-space">
        <img src="Images/adminpharmacie.jpg" alt="Pharmacie">
    </div>

</main>


<div id="popupSupprimer" class="popup">
    <div class="popup-content">
        <h2>Supprimer un médicament</h2>

        <form action="verifierSuppression" method="post">
            <input type="number" name="id" placeholder="ID du médicament" required>
            <br><br>
            <button class="btn-confirm" type="submit">Supprimer</button>
        </form>

        <button class="close-btn" onclick="fermerPopup()">X</button>
    </div>
</div>


<%
Medicament med = (Medicament) request.getAttribute("medicament");
if(med != null){
%>

<div id="popupConfirmation" class="popup" style="display:flex;">
    <div class="popup-content">

        <h2>Confirmer la suppression</h2>

        <img src="Images/<%= med.getImage() %>" width="150">
         <p><strong>Nom :</strong> <%= med.getNom() %></p>
<p><strong>Prix :</strong> <%= med.getPrix() %></p>
<p><strong>Quantité :</strong> <%= med.getQuantite() %></p>

        <form action="supprimerMedicament" method="post">
            <input type="hidden" name="id" value="<%= med.getId() %>">
            <button class="btn-confirm" type="submit">Confirmer</button>
        </form>

        <button class="btn-retour" onclick="window.location.href='adminDashboard.jsp'">Retour</button>
        

    </div>
</div>

<% } %>
<%
String succes = (String) request.getAttribute("succes");
if(succes != null){
%>

<div class="popup" style="display:flex;">
    <div class="popup-content">

        <h2 style="color:#27ae60;">✔ Suppression réussie</h2>

        <p>Le médicament a été supprimé avec succès.</p>

        <div style="display:flex; justify-content:center; gap:15px; margin-top:15px;">

        <button class="btn-confirm"
        onclick="window.location.href='ConsulterStockServlet'">
        Consulter le Stock
        </button>

        <button class="btn-retour"
        onclick="window.location.href='adminDashboard.jsp'">
        Retour
        </button>

        </div>

    </div>
</div>

<% } %>



<script>
function ouvrirPopup(){
    document.getElementById("popupSupprimer").style.display = "flex";
}
function fermerPopup(){
    document.getElementById("popupSupprimer").style.display = "none";

    var confirmPopup = document.getElementById("popupConfirmation");
    if(confirmPopup){
        confirmPopup.style.display = "none";
    }
}
</script>
</body>
</html>