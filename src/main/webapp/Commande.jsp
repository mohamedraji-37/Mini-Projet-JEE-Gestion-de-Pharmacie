<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Pharmacie - Gestion des Commandes</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', sans-serif; background-color: #f8faf9; padding: 20px; color: #333; }
        .container { max-width: 1200px; margin: 0 auto; }
        header { background: white; border-bottom: 3px solid #2e7d32; padding: 20px; border-radius: 8px; text-align: center; margin-bottom: 30px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        h1 { color: #2e7d32; }
        .flex-layout { display: flex; gap: 20px; flex-wrap: wrap; }
        .products-section { flex: 2; min-width: 600px; }
        .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(230px, 1fr)); gap: 20px; }
        .card { background: white; border: 1px solid #e0e0e0; border-radius: 12px; padding: 15px; text-align: center; transition: 0.3s; }
        .card:hover { transform: translateY(-5px); border-color: #2e7d32; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        .img-container { height: 130px; display: flex; align-items: center; justify-content: center; margin-bottom: 10px; }
        .img-container img { max-height: 100%; max-width: 100%; object-fit: contain; }
        .cart-section { flex: 1; background: white; border-radius: 12px; padding: 20px; border-top: 5px solid #2e7d32; box-shadow: 0 4px 15px rgba(0,0,0,0.05); height: fit-content; }
        .cart-item { display: flex; align-items: center; gap: 15px; padding: 15px 0; border-bottom: 1px solid #eee; }
        .cart-img { width: 60px; height: 60px; object-fit: contain; background: #fff; border: 1px solid #eee; border-radius: 4px; }
        .btn-add { background: #2e7d32; color: white; border: none; padding: 10px; border-radius: 6px; cursor: pointer; width: 100%; font-weight: bold; }
        .btn-valider { background: #2e7d32; color: white; border: none; width: 100%; padding: 12px; border-radius: 6px; font-weight: bold; cursor: pointer; margin-top: 15px; }
        .btn-remove { background: #ff5252; color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 0.8rem; font-weight: bold; margin-top: 5px; }
        .btn-remove:hover { background: #d32f2f; }
    </style>
</head>
<body>
    <%@ include file="Nave.jsp" %>
<div class="container">
    <header>
        <h1>PASSER COMMANDE</h1>
        <p>Commande Client</p>
    </header>

    <div class="flex-layout">
        <section class="products-section">
            <div class="grid">
                <c:forEach var="med" items="${listeMedicaments}">
                    <div class="card">
                        <div class="img-container">
                            <img src="Images/${med.image}" alt="${med.nom}">
                        </div>
                        <h3>${med.nom}</h3>
                        <div style="font-weight: bold; color: #1b5e20; font-size: 1.2rem;">${med.prix} DH</div>
                        <div style="font-size: 0.8rem; color: #777; margin-bottom: 10px;">Stock: ${med.quantite}</div>
                        
                        <form action="commande" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="id" value="${med.id}">
                            <input type="hidden" name="nom" value="${med.nom}">
                            <input type="hidden" name="prix" value="${med.prix}">
                            <input type="hidden" name="image" value="${med.image}">
                            <input type="number" name="quantite" value="1" min="1" max="${med.quantite}" style="width: 100%; padding: 5px; margin-bottom: 10px;">
                            <button type="submit" class="btn-add">Ajouter au panier</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </section>

        <aside class="cart-section">
            <h2 style="color: #2e7d32; margin-bottom: 15px;">Votre Panier</h2>
            <c:choose>
                <c:when test="${empty sessionScope.panier or sessionScope.panier.size() == 0}">
                    <p style="text-align: center; color: #999; padding: 40px 20px;">Le panier est vide.</p>
                </c:when>
                <c:otherwise>
                    <c:set var="totalFinal" value="0" />
                    <c:forEach var="item" items="${sessionScope.panier}" varStatus="status">
                        <c:set var="totalFinal" value="${totalFinal + (item.prix * item.quantite)}" />
                        <div class="cart-item">
                            <img src="Images/${item.image}" class="cart-img" onerror="this.src='Images/default_med.jpg'">
                            <div style="flex-grow: 1;">
                                <div style="font-weight: bold; font-size: 0.9rem;">${item.nom}</div>
                                <small>${item.quantite} x ${item.prix} DH</small>
                                <form action="commande" method="post">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="index" value="${status.index}">
                                    <button type="submit" class="btn-remove">Supprimer</button>
                                </form>
                            </div>
                            <div style="font-weight: bold; color: #2e7d32; font-size: 1rem;">${item.prix * item.quantite} DH</div>
                        </div>
                    </c:forEach>

                    <div style="margin-top: 20px; text-align: right;">
                        <p style="font-size: 0.8rem; color: #666;">Total à régler</p>
                        <div style="font-size: 1.4rem; font-weight: bold; color: #2e7d32;">${totalFinal} DH</div>
                    </div>

                    <form action="commande" method="post">
                        <input type="hidden" name="action" value="valider">
                        <input type="hidden" name="total" value="${totalFinal}">
                        <button type="submit" class="btn-valider">Confirmer la Commande</button>
                    </form>
                    
                    <form action="commande" method="post" style="text-align: center; margin-top: 15px;">
                        <input type="hidden" name="action" value="clear">
                        <button type="submit" style="background: none; border: none; color: #d32f2f; cursor: pointer; text-decoration: underline; font-size: 0.75rem;">Vider le panier</button>
                    </form>
                </c:otherwise>
            </c:choose>
        </aside>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>