<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Medicament" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/adminDashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<header>
    <div class="header-left" style="display: flex; align-items: center;">
        <a href="adminDashboard.jsp" style="margin-right: 20px;">
            <img src="Images/pngtree-medical-cross-and-health-pharmacy-logo-vector-template-image_148831.jpg" 
                 alt="Logo Pharmacie" 
                 style="height: 45px; border-radius: 5px;">
        </a>

        <a href="Ajouter_medicament.jsp">Ajouter</a>
        <a href="javascript:void(0)" onclick="ouvrirPopupModif()">Modifier</a>
        <a href="javascript:void(0)" onclick="ouvrirPopup()">Supprimer</a>
        <a href="javascript:void(0)" onclick="ouvrirPopupRecherche()">Rechercher</a>
        <a href="medicaments">Voir le Stock</a>
        <a href="traitementCommande">Voir les Commandes</a>
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
            <form action="Ajouter_medicament.jsp">
                <button class="btn add" type="submit"><i class="fas fa-plus"></i> Ajouter</button>
            </form>
            <div class="description">Ajouter un nouveau médicament</div>
        </div>
        <div class="card">
            <button type="button" class="btn update" onclick="ouvrirPopupModif()">
                <i class="fas fa-edit"></i> Modifier
            </button>
            <div class="description">Modifier un médicament</div>
        </div>
        <div class="card">
            <button type="button" class="btn delete" onclick="ouvrirPopup()">
                <i class="fas fa-trash"></i> Supprimer
            </button>
            <div class="description">Supprimer un médicament</div>
        </div>
        <div class="card">
            <button class="btn search" type="button" onclick="ouvrirPopupRecherche()">
                <i class="fas fa-search"></i> Rechercher
            </button>
            <div class="description">Rechercher dans la base</div>
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

<div id="popupRecherche" class="popup">
    <div class="popup-content">
        <h2 style="color: #3498db;">Rechercher un médicament</h2>
        <form action="rechercherMedicament" method="get">
            <input type="number" name="idMedicament" placeholder="ID à rechercher" required>
            <br><br>
            <button class="btn-confirm" style="background-color: #3498db;" type="submit">Chercher</button>
        </form>
        <button class="close-btn" onclick="fermerPopupRecherche()">X</button>
    </div>
</div>

<div id="popupModifierID" class="popup">
    <div class="popup-content">
        <h2 style="color: #f39c12;">Modifier un médicament</h2>
        <form action="modifierMedicament" method="get">
            <input type="number" name="id" placeholder="ID du médicament" required>
            <br><br>
            <button class="btn-confirm" style="background-color: #f39c12;" type="submit">Charger les infos</button>
        </form>
        <button class="close-btn" onclick="fermerPopupModif()">X</button>
    </div>
</div>

<% Medicament medMod = (Medicament) request.getAttribute("medAModifier");
   if(medMod != null) { %>
<div class="popup" style="display:flex;">
    <div class="popup-content" style="width: 550px; border-top: 5px solid #f39c12; text-align: left;">
        <h2 style="text-align: center;">Editer Médicament #<%= medMod.getId() %></h2>
        
        <div style="text-align: center; margin-bottom: 20px;">
            <img src="Images/<%= medMod.getImage() %>" alt="Aperçu actuel" 
                 style="max-width: 130px; border-radius: 5px; border: 1px solid #ddd;"
                 onerror="this.src='Images/default.png'">
            <p style="font-size: 0.8em; color: #666;">Image actuelle : <%= medMod.getImage() %></p>
        </div>

        <form action="modifierMedicament" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= medMod.getId() %>">
            <input type="hidden" name="imageActuelle" value="<%= medMod.getImage() %>">
            
            <div style="margin-bottom: 12px; display: flex; align-items: center;">
                <label style="width: 140px; font-weight: bold;">Nom :</label>
                <input type="text" name="nom" value="<%= medMod.getNom() %>" style="flex: 1;" required>
            </div>
            
            <div style="margin-bottom: 12px; display: flex; align-items: center;">
                <label style="width: 140px; font-weight: bold;">Prix (DH) :</label>
                <input type="number" step="0.01" name="prix" value="<%= medMod.getPrix() %>" style="flex: 1;" required>
            </div>
            
            <div style="margin-bottom: 12px; display: flex; align-items: center;">
                <label style="width: 140px; font-weight: bold;">Quantité :</label>
                <input type="number" name="quantite" value="<%= medMod.getQuantite() %>" style="flex: 1;" required>
            </div>

            <div style="margin-bottom: 12px; display: flex; align-items: center;">
                <label style="width: 140px; font-weight: bold;">Date d'expiration:</label>
                <input type="date" name="dateAjout" value="<%= medMod.getDateExpiration() %>" style="flex: 1;" required>
            </div>
            
            <div style="margin-bottom: 12px; display: flex; align-items: flex-start;">
                <label style="width: 140px; font-weight: bold;">Description :</label>
                <textarea name="description" style="flex: 1; height: 60px;"><%= medMod.getDescription() %></textarea>
            </div>
            
            <div style="margin-bottom: 12px; display: flex; align-items: center;">
                <label style="width: 140px; font-weight: bold;">Nouvelle Image :</label>
                <input type="file" name="imageFichier" accept="image/*" style="flex: 1;">
            </div>
            
            
            <div style="text-align: center; margin-top: 20px;">
                <button class="btn-confirm" style="background-color: #f39c12;" type="submit">Enregistrer</button>
                <button type="button" class="btn-retour" onclick="window.location.href='adminDashboard.jsp'">Annuler</button>
            </div>
        </form>
    </div>
</div>
<% } %>

<% Medicament medASupprimer = (Medicament) request.getAttribute("medicament");
   if(medASupprimer != null) { %>
<div class="popup" style="display:flex;">
    <div class="popup-content" style="width: 450px; border-top: 5px solid #e74c3c;">
        <h2 style="color: #e74c3c;">Confirmer la suppression ?</h2>
        <div style="text-align: center; margin-bottom: 15px;">
            <img src="Images/<%= medASupprimer.getImage() %>" style="max-width: 100px; border-radius: 5px;" onerror="this.src='Images/default.png'">
            <p><strong>Nom :</strong> <%= medASupprimer.getNom() %></p>
        </div>
        <p style="text-align: center;">Voulez-vous vraiment supprimer ce médicament (ID: <%= medASupprimer.getId() %>) ?</p>
        <form action="supprimerMedicament" method="post">
            <input type="hidden" name="id" value="<%= medASupprimer.getId() %>">
            <div style="text-align: center; margin-top: 20px;">
                <button class="btn-confirm" style="background-color: #e74c3c;" type="submit">Confirmer</button>
                <button type="button" class="btn-retour" onclick="window.location.href='adminDashboard.jsp'">Annuler</button>
            </div>
        </form>
    </div>
</div>
<% } %>

<% Medicament medTrouve = (Medicament) request.getAttribute("medTrouve");
   if(medTrouve != null) { %>
<div class="popup" style="display:flex;">
    <div class="popup-content" style="width: 500px; border-top: 5px solid #3498db; text-align: left;">
        <h2 style="text-align: center; color: #3498db;">Informations du Médicament</h2>
        
        <div style="text-align: center; margin-bottom: 20px;">
            <img src="Images/<%= medTrouve.getImage() %>" style="max-width: 150px; border-radius: 8px; border: 1px solid #ddd;" onerror="this.src='Images/default.png'">
        </div>

        <div style="margin-bottom: 10px;"><span style="font-weight: bold; width: 120px; display: inline-block;">ID :</span> <%= medTrouve.getId() %></div>
        <div style="margin-bottom: 10px;"><span style="font-weight: bold; width: 120px; display: inline-block;">Nom :</span> <%= medTrouve.getNom() %></div>
        <div style="margin-bottom: 10px;"><span style="font-weight: bold; width: 120px; display: inline-block;">Prix :</span> <%= medTrouve.getPrix() %> DH</div>
        <div style="margin-bottom: 10px;"><span style="font-weight: bold; width: 120px; display: inline-block;">Quantité :</span> <%= medTrouve.getQuantite() %></div>
        <div style="margin-bottom: 10px;"><span style="font-weight: bold; width: 120px; display: inline-block;">Description :</span><br>
            <p style="background: #f9f9f9; padding: 10px; border-radius: 5px; margin-top: 5px;"><%= medTrouve.getDescription() %></p>
        </div>

        <div style="text-align: center; margin-top: 20px;">
            <button class="btn-confirm" style="background-color: #3498db;" onclick="window.location.href='adminDashboard.jsp'">Fermer</button>
        </div>
    </div>
</div>
<% } %>

<% String err = (String) request.getAttribute("erreur");
   if(err != null){ %>
<div class="popup" style="display:flex;"><div class="popup-content">
    <h2 style="color:#e74c3c;">Attention</h2><p><%= err %></p>
    <button class="btn-retour" onclick="window.location.href='adminDashboard.jsp'">Fermer</button>
</div></div>
<% } %>

<% String ok = (String) request.getAttribute("succes");
   if(ok != null){ %>
<div class="popup" style="display:flex;"><div class="popup-content">
    <h2 style="color:#27ae60;">Succès</h2><p><%= ok %></p>
    <button class="btn-confirm" onclick="window.location.href='adminDashboard.jsp'">Continuer</button>
</div></div>
<% } %>

<script>
function ouvrirPopup(){ document.getElementById("popupSupprimer").style.display = "flex"; }
function fermerPopup(){ document.getElementById("popupSupprimer").style.display = "none"; }
function ouvrirPopupRecherche(){ document.getElementById("popupRecherche").style.display = "flex"; }
function fermerPopupRecherche(){ document.getElementById("popupRecherche").style.display = "none"; }
function ouvrirPopupModif(){ document.getElementById("popupModifierID").style.display = "flex"; }
function fermerPopupModif(){ document.getElementById("popupModifierID").style.display = "none"; }
</script>
</body>
</html>