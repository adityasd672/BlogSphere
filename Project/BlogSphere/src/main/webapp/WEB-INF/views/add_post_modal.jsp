<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body secondary-background">

					<form id="add-post-form">

						<div class="form-group rows">
							<select class="form-control col-md-6" name="category">
								<option selected disabled>----Select Category----</option>

								<%
								List<Category> list = (List) session.getAttribute("categoryList");

								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">

							<input name="pTitle" type="text"
								placeholder="Enter post title..." class="form-control">

						</div>

						<div class="form-group">

							<textarea name="pContent" class="form-control"
								style="height: 200px" rows="" cols=""
								placeholder="Enter your content"></textarea>
						</div>

						<div class="form-group">

							<textarea name="pCode" class="form-control" style="height: 100px"
								rows="" cols="" placeholder="Enter your program (if any)"></textarea>
						</div>
						<div class="form-group">
							<label>Select your pic : (placeholder: [image]) </label> 
							<input name="pic" type="file" accept="image/*"
								class="form-control border-0">
								<small id="imageHelp" class="form-text text-muted">Max size: 100MB.</small>
						</div>
						<div class="form-group">
							<label>Select your video : (placeholder: [video])</label> 
							<input name="video" type="file" accept="video/*"
								class="form-control border-0">
								<small id="videoHelp" class="form-text text-muted">Max size: 100MB.</small>
						</div>
						<div class="form-group">
							<label>YouTube Video URL (placeholder: [youtube])</label>
            				<input type="text" name="youtubeUrl" class="form-control" placeholder="https://www.youtube.com/watch?v=VIDEO_ID">
						</div>


						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>

						</div>


					</form>

				</div>
				<div class="modal-footer primary-background">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
				</div>
			</div>
		</div>
	</div>