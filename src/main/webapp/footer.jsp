<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

.improved-footer ul, .improved-footer p {
    margin: 0;
    padding: 0;
    list-style: none;
}


.improved-footer {
    background-color: #1a5a25;
    background-image: repeating-linear-gradient(
        45deg,
        rgba(255,255,255,0.02) 0px,
        rgba(255,255,255,0.02) 1px,
        transparent 1px,
        transparent 10px
    );
    color: rgba(255, 255, 255, 0.9);
    font-family: 'Segoe UI', Arial, sans-serif;
    padding: 60px 8% 25px;
    margin-top: 60px;
}


.footer-container {
    display: flex;
    justify-content: space-between;
    gap: 40px;
    flex-wrap: wrap;
    max-width: 1200px;
    margin: 0 auto;
}

.footer-col {
    flex: 1;
    min-width: 250px;
}


.footer-col h3 {
    color: white;
    font-size: 1.3rem;
    margin-bottom: 20px;
    position: relative;
    padding-bottom: 10px;
}

.footer-col h3::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 40px;
    height: 2px;
    background-color: white;
}


.footer-links li {
    margin-bottom: 10px;
}

.footer-links a {
    color: rgba(255, 255, 255, 0.85);
    text-decoration: none;
    transition: 0.3s;
}

.footer-links a:hover {
    color: white;
    padding-left: 5px;
}


.contact-item {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 15px;
    font-size: 0.95rem;
}

.contact-icon {
    width: 18px;
    height: 18px;
    opacity: 0.7;
}


.social-btns {
    display: flex;
    gap: 10px;
    margin-top: 20px;
}

.social-link {
    color: white;
    text-decoration: none;
    border: 1px solid rgba(255,255,255,0.4);
    padding: 5px 15px;
    border-radius: 20px;
    font-size: 0.85rem;
}

.social-link:hover {
    background-color: rgba(255,255,255,0.1);
}


.hours-text p {
    margin-bottom: 5px;
}

.hours-highlight {
    font-weight: bold;
    font-size: 1.1rem;
    color: white;
}


.footer-bottom {
    margin-top: 40px;
    padding-top: 15px;
    border-top: 1px dashed rgba(255,255,255,0.2);
    text-align: center;
    font-size: 0.85rem;
    opacity: 0.8;
}

.micro-logo {
    width: 14px;
    vertical-align: middle;
    margin-right: 5px;
}
</style>

<footer class="improved-footer">

    <div class="footer-container">

    
        <div class="footer-col">
            <h3>Liens utiles</h3>
            <ul class="footer-links">
                <li><a href="apropos.jsp">À propos</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="suiviCommande.jsp">Suivi de commande</a></li>
                
            </ul>
        </div>

        <div class="footer-col">
            <h3>Contact</h3>

            <div class="contact-item">
                Maroc, Beni Mellal, Mghila
            </div>

            <div class="contact-item">
                +212 632446156
            </div>

            <div class="contact-item">
                contact@pharmaciemghila.com
            </div>

            <div class="social-btns">
                <a href="#" class="social-link">Instagram</a>
                <a href="#" class="social-link">Facebook</a>
            </div>
        </div>


        <div class="footer-col">
            <h3>Heures d'ouvertures</h3>

            <div class="hours-text">
                <p>Lundi au Vendredi :</p>
                <span class="hours-highlight">09h - 20h</span>

                <p style="margin-top:10px; opacity:0.6;">
                    Samedi & Dimanche : Fermé
                </p>
            </div>
        </div>

    </div>

  
    <div class="footer-bottom">
        <span>
            &copy; 2026 Pharmacie de Garde — Tous droits réservés.
        </span>
    </div>

</footer>