<!-- form mulai -->
<form id="form-create" class="form-horizontal">
	<!-- Title -->
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="title" id="title" placeholder="Title"/>
		</div>
	</div>
	<!-- Category -->
	<div class = "form-group">
		<label class="control-label col-md-1"></label>
		<div class = col-md-10>
			<select name="categoryId" id="categoryId" class = "form-control">
				<option value="">- Choose Category -</option>
			</select> 
			<!-- <input type = "text" class="form-control" name="categoryId" placeholder="Category"/> -->
		</div>
	</div>
	<!-- Content -->
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<textarea   rows ="9" class="form-control" name="content" placeholder="Content" style="resize:none"></textarea>
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<input type="hidden" class="form-control" name="isPublish" value="false" />
	
	<div class="modal-footer">
		<button type="button" class="btn btn-warning" 
			style = "position:relative;right:160px;top:2px;" 
			data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="addData($('#form-create'))"
			style = "position:relative;right:35px;top:2px;"
			class="btn btn-warning">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->