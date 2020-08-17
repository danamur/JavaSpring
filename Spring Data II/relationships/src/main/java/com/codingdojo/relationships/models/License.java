package com.codingdojo.relationships.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Future;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="licenses")
public class License {
	
	//Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String number;
    
    @Future
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date expirationDate;
    
    private String state;
    
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="person_id")
    private Person person;
    
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
    
    //Constructors
    public License() {
    }
    
    public License(Long id, String number, Date expiration_date, String state, Person person) {
		this.id = id;
		this.number = number;
		this.expirationDate = expiration_date;
		this.state = state;
		this.person = person;
	}
	//Getters
	public Long getId() {
		return id;
	}

	public String getNumber() {
		return number;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public String getState() {
		return state;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public Person getPerson() {
		return person;
	}

	public void setId(Long id) {
		this.id = id;
	}

	//Setters
	public void setNumber(String number) {
		this.number = number;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public void setPerson(Person person) {
		this.person = person;
	}
}