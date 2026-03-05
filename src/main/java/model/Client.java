package model;
public class Client{
	
	private int id;
	private String nom;
	private String telephone;
	private String email;
	private String password;
	
	
	public Client() {
		
	}
	
	public int getId() {
		return id;
	}
	public String getNom() {
		return nom;
	}
	public String getTelephone() {
		return telephone;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	
	
	public void setId(int id) {
		this.id = id;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}




