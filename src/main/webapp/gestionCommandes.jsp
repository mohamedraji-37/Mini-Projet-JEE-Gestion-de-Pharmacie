<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Commande" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Commandes</title>
    <link rel="stylesheet" href="css/adminDashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background-color: #f4f7f6; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .container-gestion { width: 90%; max-width: 1200px; margin: 50px auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        h2.titre-centre { text-align: center; color: #2c3e50; margin-bottom: 30px; font-size: 2em; }
        .status-badge { padding: 6px 12px; border-radius: 20px; font-size: 0.85em; font-weight: bold; display: inline-block; }
        .etat-validee { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .etat-annulee { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .etat-en-attente { background: #fff3cd; color: #856404; border: 1px solid #ffeeba; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 30px; }
        th, td { padding: 15px; border-bottom: 1px solid #eee; text-align: center; }
        th { background-color: #f8f9fa; color: #333; text-transform: uppercase; font-size: 0.85em; letter-spacing: 1px; }
        .btn-action { padding: 8px 15px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; transition: 0.3s; }
        .btn-valider { background-color: #27ae60; color: white; margin-right: 5px; }
        .btn-annuler { background-color: #e74c3c; color: white; }
        .btn-action:hover { opacity: 0.8; transform: translateY(-1px); }
        .retour-container { text-align: center; margin-top: 20px; border-top: 1px solid #eee; padding-top: 20px; }
        .btn-retour-centre { display: inline-block; padding: 12px 25px; background-color: #34495e; color: white; text-decoration: none; border-radius: 5px; font-weight: bold; transition: 0.3s; }
        .btn-retour-centre:hover { background-color: #2c3e50; box-shadow: 0 2px 10px rgba(0,0,0,0.2); }
    </style>
</head>
<body>

    <div class="container-gestion">
        <h2 class="titre-centre"><i class="fas fa-shopping-cart"></i> Gestion des Commandes</h2>
        
        <table>
            <thead>
                <tr>
                    <th>ID Commande</th>
                    <th>ID Client</th>
                    <th>Code Suivi</th>
                    <th>Date</th>
                    <th>Total</th>
                    <th>État Actuel</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Commande> commandes = (List<Commande>) request.getAttribute("listeCommandes");
                if(commandes != null && !commandes.isEmpty()) {
                    for(Commande c : commandes) { 
                        
                        String etatBrut = (c.getEtat() != null) ? c.getEtat() : "En attente";
                        String classeEtat = "etat-" + etatBrut.toLowerCase().replace(" ", "-");
                %>
                <tr>
                    <td><strong>#<%= c.getIdCommande() %></strong></td>
                    <td><%= c.getIdClient() %></td>
                    <td><code style="background: #f1f1f1; padding: 3px 6px; border-radius: 3px;"><%= c.getCodeSuivi() %></code></td>
                    <td><%= c.getDateCommande() %></td>
                    <td><%= c.getTotal() %> DH</td>
                    <td><span class="status-badge <%= classeEtat %>"><%= etatBrut %></span></td>
                    <td>
                        <form action="traitementCommande" method="post" style="display:inline;">
                            <input type="hidden" name="idCmd" value="<%= c.getIdCommande() %>">
                            <button name="nouvelEtat" value="Validée" class="btn-action btn-valider">Valider</button>
                            <button name="nouvelEtat" value="Annulée" class="btn-action btn-annuler">Annuler</button>
                        </form>
                    </td>
                </tr>
                <%  } 
                } else { %>
                <tr><td colspan="7" style="padding: 40px; color: #999;">Aucune commande enregistrée dans la base.</td></tr>
                <% } %>
            </tbody>
        </table>

        <div class="retour-container">
            <a href="adminDashboard.jsp" class="btn-retour-centre">
                <i class="fas fa-chevron-left"></i> Retour à la page d'accueil
            </a>
        </div>
    </div>

</body>
</html>