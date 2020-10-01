package com.danielnamur.javaexamsimulator.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table( name="courses" )
public class Course {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Size( min=1, max=200, message="Curso debe tener nombre.")
	private String name;
	
	@Size( min=1, max=200, message="Instructor debe tener nombre.")
	private String instructor;
	
	@NotNull(message="Capacidad no puede estar vacia.")
	@Range(min=1, max=100)
	private Integer capacity;
	
	@Column(updatable=false)
	@DateTimeFormat( pattern="MM/dd/yyyy HH:mm:ss" )
	private Date createdAt;
	
	@DateTimeFormat( pattern="MM/dd/yy HH:mm:ss" )
	private Date updateAt;
	
	@ManyToMany
	@JoinTable(
			name = "users_courses",
			joinColumns = @JoinColumn( name="course_id" ),
			inverseJoinColumns = @JoinColumn( name="user_id ")
			)
	private List<User> users;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updateAt = new Date();
	}
	
	public Course() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	
	
}
