<!-- form mulai -->
<form id="form-delete" class="form-horizontal">
	
	<center>
	<h3>Are you sure to delete this data ?</h3>
	</center>
	
	<input type="hidden" name="id" id="id" />
	<input type="hidden" name="name" id="name" />
	<input type="hidden" class="form-control" name="notes" placeholder="Notes" id="notes"/>
	<input type="hidden" class="form-control" name="typeOfAnswer" id="typeOfAnswer"/>
	<input type="hidden" class="form-control" name="createdBy" id="createdBy"/>
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy"/>
	<input type="hidden" class="form-control" name="modifiedOn" id="modifiedOn"/>
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy"/>
	<input type="hidden" class="form-control" name="deletedOn" id="deletedOn"/>
	<input type="hidden" class="form-control" name="isDelete" value="true" id="isDelete"/>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">No</button>
		<button type="button" class="btn btn-success" onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->