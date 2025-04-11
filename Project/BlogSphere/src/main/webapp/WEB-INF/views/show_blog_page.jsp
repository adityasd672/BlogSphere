<%@page import="com.adi.pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.adi.pojo.Post"%>
<%@page import="com.adi.pojo.UserInfo"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="errorpage" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
		
	
	}
	
	.card-img-top {
    width: 100%; /* Makes sure the image takes full width of the card */
    height: 300px; /* Set a fixed height */
    object-fit: cover; /* Ensures the image covers the area without distortion */
   /*  border-radius: 5px; */ /* Optional: Adds rounded corners */
}
	
</style>



</head>
<body>

<!-- navbar -->

	<%@include file="main_navbar.jsp" %>

	<!-- 	end of navbar -->
	
	<!-- main content fo body -->
	
	<div class="container-fluid">
	
		<div class="row my-4">
			
			<div class="col-md-8 offset-md-2">	
				
				<div class="card">
					
					<div class="card-header primary-background text-white">
						<h4 class="post-title"><%= p.getpTitle() %></h4>
					</div>
					
					<div class="card-body">
						 
						 <%-- <%
							String videoId = "";
						 	if(!p.getYoutubeUrl().equals("")) {
							if(p.getYoutubeUrl().contains("https://www.youtube.com/watch?v=")) {
								videoId = p.getYoutubeUrl().replace("https://www.youtube.com/watch?v=", "").split("&")[0].split("\\?")[0];
							} else if(p.getYoutubeUrl().contains("https://youtu.be/")) {
								videoId = p.getYoutubeUrl().replace("https://youtu.be/", "").split("\\?")[0].split("&")[0];
							} %>
							 <div class="embed-responsive embed-responsive-16by9">
			  					<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<%= videoId %>?rel=0" allowfullscreen></iframe>
							</div>
							<%
						 	} else if(!p.getpPic().equals("")) {
						 		%>
						 		<img src="images/blog_pics/<%= p.getpPic() %>" class="card-img-top my-2" alt="...">
						 		<%
						 	}
						 	else if(!p.getpVideo().equals("")) {
						 		%>
						 		<video width="100%" controls>
						 			<source src="videos/<%= p.getpVideo() %>" class="card-img-top my-2" type="video/mp4">
						 		</video>
						 		<%
						 	}
						%> --%>
					
							
							
						 
						 <div class="row row-user">
						 	<div class="col-md-8">
						 		<p class="post-user-info"> <a href="#!"> <%= p.getUser().getName() %>  </a> has posted: </p>
						 	</div>
						 	<div class="col-md-4">
						 		<p class="post-date"> <%= p.getpDate() %> </p>
							</div>
						 </div>
						<p class="post-content">
    <%
        String content = p.getpContent();
        content = content.replace("\n", "<br>"); // Convert new lines to <br>

        // Replace image placeholders with actual <img> tags
        if (!p.getpPic().equals("")) {
            content = content.replace("[image]", "<img src='images/blog_pics/" + p.getpPic() + "' width='100%' alt='Blog Image'>");
        }

        // Replace video placeholders with actual <video> tags
        if (!p.getpVideo().equals("")) {
            content = content.replace("[video]", 
                "<video width='100%' controls>" +
                "<source src='videos/" + p.getpVideo() + "' type='video/mp4'>" +
                "Your browser does not support the video tag." +
                "</video>");
        }

        // Replace YouTube URLs (if embedded)
        String videoId = "";
        if (!p.getYoutubeUrl().equals("")) {
        	if(p.getYoutubeUrl().contains("https://www.youtube.com/watch?v=")) {
				videoId = p.getYoutubeUrl().replace("https://www.youtube.com/watch?v=", "").split("&")[0].split("\\?")[0];
			} else if(p.getYoutubeUrl().contains("https://youtu.be/")) {
				videoId = p.getYoutubeUrl().replace("https://youtu.be/", "").split("\\?")[0].split("&")[0];
			} 
        	content = content.replace("[youtube]", 
                "<div class='embed-responsive embed-responsive-16by9'> <iframe class='embed-responsive-item' src='https://www.youtube.com/embed/"+videoId+"?rel=0' allowfullscreen></iframe></div>");
        }

        out.print(content); // Render the modified content
    %>
</p>

						<br>
						<br>
						<div class="post-code">
							<pre><%= p.getpCode().replace("\n", "<br>") %></pre>
						</div>
						
					
					</div>
					<div class="card-footer primary-background">
					
						
						<a href="#!" onClick="doLike(<%= p.getPid() %>, <%= user.getId() %>)" class="btn btn-outline-light btn-sm"> <i class="fa-solid fa-thumbs-up"> <span class="like-counter-<%= p.getPid() %>"><%= request.getAttribute("likeCount") %></span></i></a>
						<% if(p.getUser().getId() == user.getId() || user.getRole().equals("admin")) { 
							if(p.getUser().getId() == user.getId()) {
						%> 
							
							<a href="editpost?pid=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Edit</a>
							<% } %>
						<a href="deletepost?pid=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Delete</a>
						<% } %>
					</div>
					
					
				
					
				
				</div>
					
			</div>
		
		</div>
	
	
	</div>
	<!-- end of main content fo body -->
	<div class="container-fluid">
		<div class="row my-4">
			
			<div class="col-md-8 offset-md-2">
				<h1 style="color: #fff">Add a comment</h1>
				<form action="addcomment" method="post">
					<div class="form-group">
							<input type="hidden" name="postId" value="<%= p.getPid() %>">
							<input name="cContent" type="text"
								placeholder="Enter comment " class="form-control">
								

						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			
			</div>
		</div>
	</div>
	<hr>
	<!-- Comment body -->
	<div class="container-fluid">
		<div class="row my-4">
			
			<div class="col-md-8 offset-md-2">
				<!-- comments -->
					
					<div class="container text-center" id="loader" >
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>
					
					<div class="container-fluid" id="comments-container">
						
					</div>
			</div>
			
		</div>
	</div>
	
	<!-- end of Comment body -->
	
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
	
	<!-- loading comments using ajax -->
	<script>
		function getComments(postId, temp) {

			$("#loader").show();
			$("#comments-container").hide();

			$(".c-link").removeClass('active');
			$.ajax({
				url : "loadcomments",
				data : {
					pid : postId
				},
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$("#loader").hide();
					$("#comments-container").show();
					$("#comments-container").html(data);
					$(temp).addClass('active');
				}
			})
		}
		$(document).ready(function(e) {
			let allCommentsRef = $('.c-link')[0];
			getComments(<%= p.getPid() %>, allCommentsRef);

		})
	</script>

	
</body>
</html>