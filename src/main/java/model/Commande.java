package model;
import java.time.LocalDate;

public class Commande{
	
	private int idCommande;
	private int idClient;
	private double total;
	private LocalDate dateCommande;
	
	
	public Commande() {
		
	}
	
	public int getIdCommande() {return idCommande;}
	public int getIdClient() {return idClient;}
	public double getTotal() {return total;}
	public LocalDate getDateCommande(){return dateCommande;}
	
	
	public void setIdCommande(int id_commande) {
		this.idCommande = id_commande;
	}
	public void setIdClient(int id_client) {
		this.idClient = id_client;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public void setDateCommande(LocalDate date_commande) {
		this.dateCommande = date_commande;
	}
	
}