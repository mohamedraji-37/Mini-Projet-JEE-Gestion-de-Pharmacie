package model;

import java.time.LocalDate;

public class Medicament {

    private int id;
    private String nom;
    private String description;
    private double prix;
    private int quantite;
    private LocalDate dateExpiration;
    private String image; 

    public Medicament() {}


    public int getId() { return id; }
    public String getNom() { return nom; }
    public String getDescription() { return description; }
    public double getPrix() { return prix; }
    public int getQuantite() { return quantite; }
    public LocalDate getDateExpiration() { return dateExpiration; }
    public String getImage() { return image; }


    public void setId(int id) { this.id = id; }
    public void setNom(String nom) { this.nom = nom; }
    public void setDescription(String description) { this.description = description; }
    public void setPrix(double prix) { this.prix = prix; }
    public void setQuantite(int quantite) { this.quantite = quantite; }
    public void setDateExpiration(LocalDate dateExpiration) { this.dateExpiration = dateExpiration; }
    public void setImage(String image) { this.image = image; }
}