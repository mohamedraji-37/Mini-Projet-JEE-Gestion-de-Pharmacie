package model;
public class LigneCommande{
	
	private int idLigne;
	private int idCommande;
	private int idMedicament;
	private int quantite;
	private double prixUnitaire;
	
	public LigneCommande() {
		
	}
	
	public int getIdLigne() {return idLigne;}
	public int getIdCommande() {return idCommande;}
	public int getIdMedicament() {return idMedicament;}
	public int getQuantite() {return quantite;}
	public double getPrixUnitaire() {return prixUnitaire;}
	
	public void setIdLigne(int idLigne) {
		this.idLigne = idLigne;
	}
	public void setIdCommande(int idCommande) {
		this.idCommande = idCommande;
	}
	public void setIdMedicament(int idMedicament) {
		this.idMedicament = idMedicament;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public void setPrixUnitaire(double prixUnitaire) {
		this.prixUnitaire = prixUnitaire;
	}
}