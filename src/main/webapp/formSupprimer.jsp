<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Supprimer un médicament</h2>

<form action="verifierSuppression" method="post">

ID du médicament :
<input type="number" name="id" required>

<br><br>

<button type="submit">Supprimer</button>

</form>

</body>
</html>