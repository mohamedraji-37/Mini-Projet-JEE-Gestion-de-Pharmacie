<html>
<head>
<title>Recherche Medicament</title>
<style>
body{font-family: Arial; background:#f4f4f4;}
form{
width:300px; margin:100px auto; padding:20px; background:white; border-radius:10px; box-shadow:0 0 10px gray;
}
input[type="number"]{
width:100%; padding:10px; margin:10px 0; border-radius:5px; border:1px solid #ccc;
}
input[type="submit"]{
width:100%; padding:10px; background:#27ae60; color:white; border:none; border-radius:5px; cursor:pointer;
}
input[type="submit"]:hover{background:#2ecc71;}
</style>
</head>
<body>

<form action="aficheMed" method="get">
<h2>Rechercher par ID</h2>
<input type="number" name="id" placeholder="Entrez ID du medicament" required>
<input type="submit" value="Rechercher">
</form>

</body>
</html>