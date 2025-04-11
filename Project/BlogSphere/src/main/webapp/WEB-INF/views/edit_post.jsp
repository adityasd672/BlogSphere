<%@page import="com.adi.pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.adi.pojo.Post"%>
<%@page import="com.adi.pojo.UserInfo"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="error_page.jsp" %>
<%
UserInfo user = (UserInfo) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login");
}
%>

<% 
	
	
	Post p = (Post) request.getAttribute("post");


%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title><%= p.getpTitle()  %> || BlogSphere</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">


	
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 69% 85%, 35% 95%, 0 91%, 0 0);
}

	.post-title {
		font-weight: 100;
		font-size: 30px;
	
	}
	
	.post-content {
		font-weight: 100;
		font-size: 25px;
	}
	
	.post-date {
		font-style:italic;
		font-weight: bold;
	}
	
	.post-user-info {
		font-size: 20px;
	}
	
	.row-user {
		border: 1px solid #e2e2e2;
		padding-top: 15px;
	}
	
	body {
		background:url(images/bg-img.jpg);
		background-size: cover;
		background-attachment:fixed;
	
	}
</style>



</head>
<body>

<!-- navbar -->

	<%@include file="main_navbar.jsp" %>

	<!-- 	end of navbar -->
	
	<!-- main content fo body -->
	
	<div class="container">
	
		<div class="row my-4">
			
			<div class="col-md-8 offset-md-2">	
				
				<div class="card">
					
					<div class="card-header primary-background text-white">
						<h4 class="post-title"><%= p.getpTitle() %></h4>
					</div>
					
					<div class="card-body">
						 
					
			
				
						 
						 <div class="row row-user">
						 	<div class="col-md-8">
						 		<p class="post-user-info"> <a href="#!"> <%= p.getUser().getName() %>  </a> has posted: </p>
						 	</div>
						 	<div class="col-md-4">
						 		<p class="post-date"> <%= p.getpDate() %> </p>
							</div>
						 </div>
						
						<!-- edit form -->
						
						<form action="editpost" method="post">
					<div class="form-group">
							<input type="hidden" name="postId" value="<%= p.getPid() %>">
							<input name="pTitle" type="text"
								class="form-control" value="<%= p.getpTitle() %>">
								

						</div>
					<div class="form-group">

							<textarea name="pContent" class="form-control"
								style="height: 200px" rows="" cols=""
								placeholder="Enter your content"><%= p.getpContent() %></textarea>
						</div>

						<div class="form-group">

							<textarea name="pCode" class="form-control" style="height: 100px"
								rows="" cols="" placeholder="Enter your program (if any)"><%= p.getpCode() %></textarea>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
				</form>
						
						<!-- end of edit form -->
						
					
					</div>
					
					
					
				
					
				
				</div>
					
			</div>
		
		</div>
	
	
	</div>
	<!-- end of main content fo body -->
	
	
	<!-- profile modal -->
<%@include file="profile_modal.jsp" %>
	

	<!-- end of profile modal -->

	<!-- add post modal -->
<%@include file="add_post_modal.jsp" %>

	<!-- end post modal -->


	<!-- javascripts -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
		integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="js/myjs.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;

			$("#edit-profile-button").click(function() {

				// Toggle logic
				if (editStatus == false) {
					$("#profile-details").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$("#profile-details").show();
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("EDIT");
				}

			})
		})
	</script>

	<!-- now add post js -->

	<script src="js/addpost.js" type="text/javascript"></script>
	
	

	
</body>
</html>