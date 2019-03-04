<!-- form mulai -->
<form id="form-deltechtrain" class="form-horizontal">
	
	<center>
	<h3>Are you sure to delete this data ?</h3>
	</center>
	
	<input type="hidden" name="id" id="id" />
	<input type="hidden" name="technologyId" id="technologyId" />
	<input type="hidden" name="trainerId" id="trainerId" />
	<input type="hidden" name="createdBy" id="createdBy" />
	<input type="hidden" name="createdOn" id="createdOn" />
	
	
	
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" style = "position:relative;right:275px;top:2px; padding: 10px 23px;" data-dismiss="modal">No</button>
		<button type="button" class="btn btn-success" style = "position:relative;right:120px;top:2px; padding: 10px 23px;" onClick="deleteData($('#form-deltechtrain'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->