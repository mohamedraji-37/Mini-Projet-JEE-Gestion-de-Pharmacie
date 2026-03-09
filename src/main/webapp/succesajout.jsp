<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Succès</title>

<style>
body{
    font-family: Arial, sans-serif;
    background-color:#f4f4f4;
    text-align:center;
    margin-top:100px;
}

.box{
    background:white;
    width:400px;
    margin:auto;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.2);
}

h2{
    color:green;
}

a{
    display:inline-block;
    margin-top:20px;
    padding:10px 20px;
    background-color:#2e8b57;
    color:white;
    text-decoration:none;
    border-radius:5px;
}

a:hover{
    background-color:#246b45;
}
</style>

</head>

<body>

<div class="box">

<h2>✅ Médicament ajouté avec succès</h2>

<p>L'opération a été effectuée correctement.</p>

<a href="Ajouter_medicament.jsp">Ajouter un autre médicament</a>
<br><br>

<a href="listeMedicaments">Voir la liste des médicaments</a>

</div>

</body>
</html>