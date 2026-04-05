<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Suivre ma Commande - Pharmacie</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', sans-serif; background-color: #f8faf9; padding: 40px; }
        .container { max-width: 700px; margin: 0 auto; }
        
  
        .search-box { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); border-top: 5px solid #2e7d32; margin-bottom: 30px; text-align: center; }
        .search-box h2 { color: #2e7d32; margin-bottom: 20px; }
        .input-group { display: flex; gap: 10px; justify-content: center; }
        input[type="text"] { padding: 12px; border: 1px solid #ddd; border-radius: 8px; width: 60%; font-size: 1rem; }
        .btn-search { background: #2e7d32; color: white; border: none; padding: 0 25px; border-radius: 8px; cursor: pointer; font-weight: bold; }
    
        .result-card { background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 10px 30px rgba(0,0,0,0.08); animation: fadeIn 0.5s; }
        .result-header { background: #2e7d32; color: white; padding: 20px; display: flex; justify-content: space-between; align-items: center; }
        .result-body { padding: 30px; }
        
        
        .status-badge { padding: 8px 16px; border-radius: 20px; font-weight: bold; font-size: 0.9rem; text-transform: uppercase; }
        .status-attente { background: #fff9c4; color: #f57f17; }
        .status-valide { background: #c8e6c9; color: #2e7d32; }
        .status-annule { background: #ffcdd2; color: #c62828; }
        
        .info-row { display: flex; justify-content: space-between; padding: 12px 0; border-bottom: 1px solid #f0f0f0; }
        .info-row:last-child { border-bottom: none; }
        .label { color: #888; font-size: 0.9rem; }
        .value { font-weight: bold; color: #333; }

        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
    </style>
</head>
<body>
  <%@ include file="Nave.jsp" %>
<div class="container">
    <div class="search-box">
        <h2>Suivi de commande</h2>
        <p style="color: #888; margin-bottom: 20px; font-size: 0.9rem;">Saisissez votre code (ex: PHAR-XXXX) pour connaître l'état de votre livraison.</p>
        <form action="suivi" method="get" class="input-group">
            <input type="text" name="code" placeholder="Votre code de suivi..." required>
            <button type="submit" class="btn-search">Rechercher</button>
        </form>
        <c:if test="${not empty msg}">
            <p style="color: #d32f2f; margin-top: 15px; font-size: 0.9rem;">${msg}</p>
        </c:if>
    </div>

    <c:if test="${not empty maCommande}">
        <div class="result-card">
            <div class="result-header">
                <span>Détails de la commande</span>
                <span class="status-badge 
                    ${maCommande.etat == 'En attente' ? 'status-attente' : ''}
                    ${maCommande.etat == 'Validé' ? 'status-valide' : ''}
                    ${maCommande.etat == 'Annulé' ? 'status-annule' : ''}">
                    ${maCommande.etat}
                </span>
            </div>
            <div class="result-body">
                <div class="info-row">
                    <span class="label">Code de suivi</span>
                    <span class="value">${maCommande.codeSuivi}</span>
                </div>
                <div class="info-row">
                    <span class="label">Date de commande</span>
                    <span class="value">${maCommande.dateCommande}</span>
                </div>
                <div class="info-row">
                    <span class="label">Montant Total</span>
                    <span class="value" style="color: #2e7d32; font-size: 1.2rem;">${maCommande.total} DH</span>
                </div>
                
               
            </div>
        </div>
    </c:if>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>