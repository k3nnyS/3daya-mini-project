<!-- form mulai -->
<form id="form-delete" class="form-horizontal">
	
	<center>
	<h3>Are you sure to delete this data ?</h3>
	</center>
	
	<input type="hidden" name="id" id="id" />
	<input type="hidden" name="code" id="code" />
	<input type="hidden" name="title" id="title" />
	<input type="hidden" name=imageUrl id="imageUrl"/>
	<input type="hidden" name="menuOrder" id="menuOrder"/>
	<input type="hidden" name="menuParent" id="menuParent" />
	<input type="hidden" name="menuUrl" id="menuUrl"/>
	<input type="hidden" name="createdBy" id="createdBy" />
	<input type="hidden" name="createdOn" id="createdOn" />
	<input type="hidden" name="isDelete" id="isDelete" />
	
	<div class="modal-footer">
		<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">No</button>
		<button type="button" class="btn btn-success" onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->