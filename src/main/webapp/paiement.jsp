<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacie - Paiement Sécurisé</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, sans-serif; background-color: #f8faf9; color: #333; padding: 20px; }
        .container { max-width: 1100px; margin: 30px auto; display: flex; gap: 30px; align-items: flex-start; }
        .order-summary { flex: 1; background: white; border-radius: 12px; padding: 25px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); border-top: 5px solid #2e7d32; }
        .order-summary h2 { color: #2e7d32; margin-bottom: 20px; font-size: 1.3rem; border-bottom: 1px solid #eee; padding-bottom: 10px; }
        .summary-item { display: flex; align-items: center; gap: 15px; padding: 12px 0; border-bottom: 1px solid #eee; }
        .summary-img { width: 45px; height: 45px; object-fit: contain; border: 1px solid #f0f0f0; border-radius: 4px; }
        .item-info b { font-size: 0.9rem; display: block; }
        .item-info small { color: #777; }
        .total-box { margin-top: 25px; padding: 20px; background: #f1f8e9; border-radius: 10px; border: 1px solid #c5e1a5; text-align: center; }
        .amount { font-size: 2rem; font-weight: bold; color: #2e7d32; display: block; }
        .payment-card { flex: 1.3; background: white; border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.08); border-top: 5px solid #2e7d32; overflow: hidden; }
        .header { padding: 25px; text-align: center; border-bottom: 1px solid #eee; }
        .header h1 { color: #2e7d32; font-size: 1.5rem; text-transform: uppercase; margin-bottom: 5px; }
        .header p { color: #888; font-size: 0.85rem; }
        .form-body { padding: 30px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 6px; font-weight: 600; font-size: 0.85rem; color: #444; }
        input { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 8px; font-size: 1rem; transition: 0.3s; }
        input:focus { outline: none; border-color: #2e7d32; box-shadow: 0 0 0 3px rgba(46,125,50,0.1); }
        .method-container { display: flex; gap: 15px; margin-top: 8px; }
        .method-option { flex: 1; border: 2px solid #eee; border-radius: 10px; padding: 15px; text-align: center; cursor: pointer; transition: 0.3s; position: relative; }
        .method-option img { height: 30px; margin-bottom: 8px; }
        .method-option span { display: block; font-size: 0.8rem; font-weight: bold; color: #666; }
        .method-option.selected { border-color: #2e7d32; background-color: #f1f8e9; }
        .method-option.selected span { color: #2e7d32; }
        .method-option input[type="radio"] { display: none; }
        .btn-submit { width: 100%; background: #2e7d32; color: white; border: none; padding: 16px; border-radius: 8px; font-weight: bold; cursor: pointer; font-size: 1.1rem; transition: 0.3s; margin-top: 10px; }
        .btn-submit:hover { background: #1b5e20; transform: translateY(-1px); }
    </style>
    <script>
        function updateSelection(element) {
            document.querySelectorAll('.method-option').forEach(opt => opt.classList.remove('selected'));
            element.classList.add('selected');
            element.querySelector('input[type="radio"]').checked = true;
        }
    </script>
</head>
<body>
  <%@ include file="Nave.jsp" %>
<div class="container">
    <aside class="order-summary">
        <h2>Votre Commande</h2>
        <div class="item-list">
            <c:forEach var="item" items="${sessionScope.panier}">
                <div class="summary-item">
                    <img src="Images/${item.image}" class="summary-img" onerror="this.src='Images/default_med.png'">
                    <div class="item-info">
                        <b>${item.nom}</b>
                        <small>${item.quantite} x ${item.prix} DH</small>
                    </div>
                    <div style="margin-left: auto; font-weight: bold; color: #2e7d32;">${item.prix * item.quantite} DH</div>
                </div>
            </c:forEach>
        </div>
        <div class="total-box">
            <span style="color: #666; font-size: 0.85rem;">Total à régler</span>
            <span class="amount">${totalFinal} DH</span>
        </div>
    </aside>

    <main class="payment-card">
        <div class="header">
            <h1>Paiement Sécurisé</h1>
            <p>Espace de Commande Professionnel</p>
        </div>
        <div class="form-body">
            <form action="paiement" method="post">
                <input type="hidden" name="totalFinal" value="${totalFinal}">
                
                <div class="form-group">
                    <label>Nom sur la carte</label>
                    <input type="text" name="nomCarte" placeholder="M. NOM Prénom" required>
                </div>
                <div class="form-group">
                    <label>Numéro de carte</label>
                    <input type="text" name="numeroCarte" placeholder="4500 0000 0000 0000" maxlength="19" required>
                </div>
                <div style="display: flex; gap: 15px;">
                    <div class="form-group" style="flex: 2;"><label>Date d'expiration</label><input type="text" name="expiration" placeholder="MM/AA" required></div>
                    <div class="form-group" style="flex: 1;"><label>CVV</label><input type="password" name="cvv" placeholder="123" maxlength="3" required></div>
                </div>
                <div class="form-group">
                    <label>Méthode de paiement</label>
                    <div class="method-container">
                        <div class="method-option selected" onclick="updateSelection(this)">
                            <img src="Images/visa_logo.png" alt="Visa"><span>VISA</span>
                            <input type="radio" name="methode" value="visa" checked>
                        </div>
                        <div class="method-option" onclick="updateSelection(this)">
                            <img src="Images/mastercard_logo.png" alt="Mastercard"><span>MASTERCARD</span>
                            <input type="radio" name="methode" value="mastercard">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn-submit">Confirmer le Paiement</button>
            </form>
        </div>
    </main>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>