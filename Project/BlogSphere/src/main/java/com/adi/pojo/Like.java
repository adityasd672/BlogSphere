package com.adi.pojo;

import jakarta.persistence.ConstraintMode;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.ForeignKey;

@Entity
@Table(name = "likes")
public class Like {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int lid;
	
	@ManyToOne
	@JoinColumn(name = "uid", nullable = false, foreignKey = @ForeignKey(name = "FK_USER_LIKE", value = ConstraintMode.CONSTRAINT))
	private UserInfo user;
	
	@ManyToOne
	@JoinColumn(name = "pid", nullable = false, foreignKey = @ForeignKey(name = "FK_POST_LIKE", value = ConstraintMode.CONSTRAINT))
	private Post post;

	public Like(UserInfo user, Post post) {
		super();
		this.user = user;
		this.post = post;
	}

	public Like(int lid, UserInfo user, Post post) {
		super();
		this.lid = lid;
		this.user = user;
		this.post = post;
	}

	public Like() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	
	
}
