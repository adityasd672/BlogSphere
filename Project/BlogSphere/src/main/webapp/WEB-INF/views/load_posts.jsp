<%@page import="com.adi.pojo.UserInfo"%>
<%@page import="com.adi.pojo.Post"%>
<%@page import="java.util.List"%>
<%@page import= "java.io.File"%>

<% 
	UserInfo u1 = (UserInfo) session.getAttribute("currentUser");

%>


<div class="row">

<%
	
	List<Post> posts = (List) request.getAttribute("posts");
	
	if(posts.isEmpty()) {
		out.println("<h3 class='display-3 text-center' style='color: #eee'>No post available.</h3>");
		return;
	}
	
	/* for(Post p: posts) { */
		for(int i = posts.size()-1; i>=0; i--) {
			Post p = posts.get(i);
		
		
		%>
		
		<div class="col-md-6 mt-2">
			<div class="card" style="background-color: #282828; color: #eee">
				 <%
							String videoId = "";
						 	if(!p.getYoutubeUrl().equals("")) {
							if(p.getYoutubeUrl().contains("https://www.youtube.com/watch?v=")) {
								videoId = p.getYoutubeUrl().replace("https://www.youtube.com/watch?v=", "").split("&")[0].split("\\?")[0];
							} else if(p.getYoutubeUrl().contains("https://youtu.be/")) {
								videoId = p.getYoutubeUrl().replace("https://youtu.be/", "").split("\\?")[0].split("&")[0];
							 }%>
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
						%>
				
				<div class="card-body">
					<b><%= p.getpTitle() %></b>
					<%
						int wordLimit = 20;
						String content = p.getpContent();
						String [] words = content.split("\\s+");
						String shortContent = content;
						if(words.length > wordLimit) {
							shortContent = String.join(" ", java.util.Arrays.copyOfRange(words, 0, wordLimit)) + "...";
						}
					%>
					<p > <%= shortContent %></p>
				</div>
				
				<div class="card-footer primary-background text-center">
					
					
					<% if(u1 != null) {%>
					<a href="#!" onClick="doLike(<%= p.getPid() %>, <%= u1.getId() %>)" class="btn btn-outline-light btn-sm"> <i class="fa-solid fa-thumbs-up"> <span class="like-counter-<%= p.getPid() %>"><%= request.getAttribute("likeCount_"+p.getPid()) %></span></i></a>
					<a href="blogpage?pid=<%= p.getPid() %>" class="btn btn-outline-light btn-sm"> Read More..</a>
					<a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa-solid fa-comment"> <span><%= request.getAttribute("commentCount_"+p.getPid()) %></span></i></a>				
					<% } else { %>
						<a href="login" class="btn btn-outline-light btn-sm">Login to read this post...</a>
					<% }
					%>
				
				</div>
			
			
			</div>
		
		</div>
		
		
		<%
		
	}



%>

</div>