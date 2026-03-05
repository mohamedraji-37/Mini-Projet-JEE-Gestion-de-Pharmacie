<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Ajouter.css">
</head>
<body>
<div class="container">
     <h2>Ajouter Médicament</h2>
     <div class="form-container">
     <form action="ajouterMedicament" method="post" enctype="multipart/form-data">
     
     <label for="nom">Nom:</label>
     <input type="text" name="nom" id="nom" placeholder="Veuillez entrez le nom de medicament" size="30" required>
     
     <label for="description" >Description: </label>
     <input type="text" name="description" id="description" placeholder="Veuillez entrez une description de medicament" size="30" required>
     <label for="prix">Prix: </label>
     
     <input type="number" name="prix"  step="any" id="prix" placeholder="Veuillez entrez le prix de medicament" size="30" required>
     <label for="quantite">Quantité: </label>
     
     <input type="number" name="quantite" id="quantite" placeholder="Veuillez entrez la quantite  de medicament" size="30" required>
     <label for="date_exp">Date d'Expiration: </label>
     
     <input type="date" name="date_expiration"  id="date_exp" size="30" required>

     <label for="image">Image :</label>
     <input type="file" name="image" id="image" accept="image/*" required>
     
     <input type="submit" value="Ajouter">
    
     
     
     
     
     
     </form>
     
     
     
     </div>
     
</div>

</body>
</html>