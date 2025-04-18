

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index"><span style="color:#FF0000"> <i class="fa-solid fa-earth-americas"></i></span>
			BlogSphere
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="profile"> <i class="fa-solid fa-magnifying-glass"></i> Explore Blogs <span class="sr-only">(current)</span></a></li>

				

				<li class="nav-item"><a class="nav-link" href="#"> <i class="fa-solid fa-address-card"></i> Contact
				</a></li>

				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#add-post-modal"> <span
						class="	fa fa-asterisk"></span> Do Post
				</a></li>



			</ul>

			<ul class="navbar-nav mr-right">

				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"> <span
						class="fa fa-user-circle "></span> <%=user.getName()%> 
						<% 
						if(user.isSysAdmin()) {
							out.print(" (System Administrator)");
						}
						else if(user.getRole().equals("admin")) {
							out.print(" (Admin)");}%>
						
				</a></li>
				<li class="nav-item"><a class="nav-link" href="logout"> <span
						class="fa fa-user-plus "></span> Logout
				</a></li>
			</ul>

		</div>
	</nav>