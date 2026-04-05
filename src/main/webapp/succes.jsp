<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Commande Confirmée - Pharmacie</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
       
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            background-color: #f8faf9; 
            margin: 0; 
            padding: 0;
            display: block;
        }

        
        .main-content {
            min-height: 70vh; 
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .success-card { 
            background: white; 
            padding: 40px; 
            border-radius: 15px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.05); 
            text-align: center; 
            max-width: 500px; 
            width: 100%;
            border-top: 6px solid #2e7d32; 
        }

        
        .top-spacer {
            height: 30px;
        }

        h1 { color: #2e7d32; margin-bottom: 10px; font-size: 1.8rem; }
        p { color: #666; line-height: 1.6; }

        .code-box { 
            background: #f1f8e9; 
            border: 2px dashed #2e7d32; 
            padding: 20px; 
            margin: 25px 0; 
            border-radius: 8px; 
        }

        .code-text { 
            font-size: 1.6rem; 
            font-weight: bold; 
            color: #1b5e20; 
            letter-spacing: 2px; 
            display: block;
            margin-top: 5px;
        }

        .btn-home { 
            display: inline-block; 
            background: #2e7d32; 
            color: white; 
            padding: 14px 30px; 
            border-radius: 8px; 
            text-decoration: none; 
            font-weight: bold; 
            transition: 0.3s; 
            margin-top: 10px;
        }

        .btn-home:hover { 
            background: #1b5e20; 
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

    <%@ include file="Nave.jsp" %>

    <div class="main-content">
        <div class="success-card">
            <div class="top-spacer"></div>
            
            <h1>Paiement Réussi !</h1>
            <p>Merci pour votre confiance. Votre commande a été enregistrée et est en cours de préparation par nos pharmaciens.</p>
            
            <div class="code-box">
                <p style="margin: 0; font-size: 0.75rem; text-transform: uppercase; color: #2e7d32; font-weight: bold;">
                    Votre code de suivi personnel
                </p>
                <span class="code-text">${not empty param.code ? param.code : "PHAR-NON-DEFINI"}</span>
            </div>
            
            <p style="font-size: 0.85rem; color: #7f8c8d; margin-bottom: 25px;">
                Conservez précieusement ce code pour suivre l'état de votre livraison sur notre page de suivi.
            </p>
            
            <a href="UserIndex.jsp" class="btn-home">
                Retour à l'accueil
            </a>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>