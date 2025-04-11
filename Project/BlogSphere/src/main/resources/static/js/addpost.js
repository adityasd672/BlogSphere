

		$(document)
				.ready(
						function(e) {
							// 
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												// this code gets called when form is submitted...
												event.preventDefault();
												let form = new FormData(this);

												// now requesting to server
												$
														.ajax({
															url : "addpost",
															type : "POST",
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																// success...
																console
																		.log(data);
																if (data.trim().startsWith("done")) {
																	let postId = data.trim().split(":")[1];
																	swal(
																			"Good job!",
																			"Saved Successfully!",
																			"success").then(() => {
																				window.location.href = "/blogpage?pid=" + postId;
																			});
																}else if (data.trim() === "obscene-content") {
																	swal(
																		"Error!",
																		"Content Policy Violation",
																		"error"
																	);
																} else {
																	swal(
																			"Error!",
																			"Something went wrong try again...",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																// error...
																swal(
																		"Error!",
																		"Something went wrong try again...",
																		"error");
															},

															processData : false,
															contentType : false
														// kyunki form mein photo bhi hain
														})
											})
						})