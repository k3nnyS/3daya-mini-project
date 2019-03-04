<!-- form mulai -->
<form id="form-edit" class="form-horizontal">
	<!-- id -->
	<input type="hidden" name="id" id="id" />
	<!-- Title -->
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="title" id="title" placeholder="Title"/>
		</div>
	</div>
	<!-- Content -->
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<textarea  rows="20" class="form-control" name="content" id="content" placeholder="Content" style="resize:none"/>
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-warning" style = "position:relative;right:160px;top:2px;" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="editData($('#form-edit'))" class="btn btn-warning" style = "position:relative;right:35px;top:2px;">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->
