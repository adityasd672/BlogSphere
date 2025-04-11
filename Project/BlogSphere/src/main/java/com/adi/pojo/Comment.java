package com.adi.pojo;

import jakarta.persistence.Column;
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
@Table(name = "comments")
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int comId;
	
	@Column(length=200)
	private String cContent;
	
	@ManyToOne
	@JoinColumn(name = "uid", nullable = false, foreignKey = @ForeignKey(name = "FK_USER_COMMENT", value = ConstraintMode.CONSTRAINT))
	private UserInfo user;
	
	@ManyToOne
	@JoinColumn(name = "pid", nullable = false, foreignKey = @ForeignKey(name = "FK_POST_COMMENT", value = ConstraintMode.CONSTRAINT))
	private Post post;

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int comId, String cContent, UserInfo user, Post post) {
		super();
		this.comId = comId;
		this.cContent = cContent;
		this.user = user;
		this.post = post;
	}

	public Comment(String cContent, UserInfo user, Post post) {
		super();
		this.cContent = cContent;
		this.user = user;
		this.post = post;
	}

	public int getComId() {
		return comId;
	}

	public void setComId(int comId) {
		this.comId = comId;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
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

	@Override
	public String toString() {
		return "Comment [comId=" + comId + ", cContent=" + cContent + ", user=" + user + ", post=" + post + "]";
	}
	
}
