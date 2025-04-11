package com.adi.pojo;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;


@Entity
@Table(name = "category")
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cid;
	private String name;
	private String description;
	
	@OneToMany(mappedBy = "category", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Post> posts;
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public Category(int cid, String name, String description, List<Post> posts) {
		super();
		this.cid = cid;
		this.name = name;
		this.description = description;
		this.posts = posts;
	}




	public Category(String name, String description, List<Post> posts) {
		super();
		this.name = name;
		this.description = description;
		this.posts = posts;
	}




	public List<Post> getPosts() {
		return posts;
	}




	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}




	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Category [cid=" + cid + ", name=" + name + ", description=" + description + "]";
	}
	
	

}
