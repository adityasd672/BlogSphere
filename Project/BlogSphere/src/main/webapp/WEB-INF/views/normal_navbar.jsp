<%@page import="com.adi.pojo.UserInfo"%>
<%
UserInfo uuu = (UserInfo) session.getAttribute("currentUser");
%>

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
			<li class="nav-item active"><a class="nav-link" href="profile">
					<i class="fa-solid fa-magnifying-glass"></i> Explore Blogs <span
					class="sr-only">(current)</span>
			</a></li>



			<li class="nav-item"><a class="nav-link" href="#"> <i class="fa-solid fa-address-card"></i> Contact
			</a></li>
		</ul>
		<ul class="navbar-nav mr-right">
			<%
			if (uuu == null) {
			%>
			<li class="nav-item"><a class="nav-link" href="login"> <span
					class="fa fa-user-circle "></span> Login
			</a></li>
			<li class="nav-item"><a class="nav-link" href="register"> <span
					class="fa fa-user-plus "></span> Sign up
			</a></li>

			<%
			}
			%>
			<%
			if (uuu != null) {
			%>
			<li class="nav-item"><a class="nav-link" href="openprofile">
					<span class="fa fa-user-circle "></span> <%=uuu.getName()%> <%
							if(uuu.isSysAdmin()) {
								out.print(" (System Administrator)");
							}
					else if (uuu.getRole().equals("admin")) {
 	out.print(" (Admin)");
 }
 %>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="logout"> <span
					class="fa fa-user-plus "></span> Logout
			</a></li>

			<%
			}
			%>

		</ul>

	</div>
</nav>