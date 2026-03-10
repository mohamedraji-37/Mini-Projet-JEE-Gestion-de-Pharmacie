<%@ page import="model.Medicament" %>

<%
Medicament m = (Medicament) request.getAttribute("med");
%>

<html>
<head>
<title>Resultat Recherche</title>

<style>

body{
font-family: Arial;
background:#f4f4f4;
}

.card{
width:400px;
margin:50px auto;
background:white;
padding:20px;
border-radius:10px;
box-shadow:0px 0px 10px gray;
}

img{
width:120px;
height:120px;
display:block;
margin:auto;
}

h2{
text-align:center;
color:#27ae60;
}

p{
font-size:16px;
}

</style>

</head>

<body>

<div class="card">

<%
if(m == null){
%>

<h2>Medicament introuvable</h2>

<%
}else{
%>

<h2>Medicament Trouvé</h2>

<img src="Images/<%= m.getImage() %>">

<p><b>ID :</b> <%= m.getId() %></p>

<p><b>Nom :</b> <%= m.getNom() %></p>

<p><b>Description :</b> <%= m.getDescription() %></p>

<p><b>Prix :</b> <%= m.getPrix() %> DH</p>

<p><b>Quantité :</b> <%= m.getQuantite() %></p>

<p><b>Date Expiration :</b> <%= m.getDateExpiration() %></p>

<%
}
%>
<br>
<a href="search.jsp">Retour</a>

</div>

</body>
</html>