<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.Medicament" %>

<%
List<Medicament> list = (List<Medicament>) request.getAttribute("medicaments");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Liste des Médicaments</title>

   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

   
    <link rel="stylesheet" href="css/listemed.css">
</head>

<body>

<div class="container mt-5">

    <h2 class="text-center mb-4">Liste des Médicaments</h2>

    <div class="row justify-content-center">

        <% if(list != null && !list.isEmpty()) { 
            for(Medicament m : list){ %>

        <div class="col-lg-2 col-md-3 col-sm-6 mb-4">

            <div class="card h-100 shadow-sm">

               
                <img src="Images/<%= m.getImage() %>" 
                     class="card-img-top"
                     style="height:150px; object-fit:cover;">

               
                <div class="card-body text-center">

                    <h6 class="card-title"><%= m.getNom() %></h6>

                    <p class="card-text text-muted">
                        <%= m.getDescription() %>
                    </p>

                    <p class="fw-bold text-primary">
                        <%= m.getPrix() %> 
                    </p>

                    <p class="<%= m.getQuantite() > 0 ? "text-success" : "text-danger" %>">
                        Stock: <%= m.getQuantite() %>
                    </p>

                </div>

            </div>

        </div>

        <%  } 
        } else { %>

       
        <div class="col-12 text-center">
            <p class="text-muted">Aucun médicament disponible.</p>
        </div>

        <% } %>

    </div>

</div>

</body>
</html>