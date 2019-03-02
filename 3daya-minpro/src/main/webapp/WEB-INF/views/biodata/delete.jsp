<!-- form mulai -->
<form id="form-delete" class="form-horizontal">
	
	<center>
	<h3>Are you sure to delete this data ?</h3>
	</center>
	
	<input type="hidden" name="id" id="id" />
	<input type="hidden" name="gender" id="gender" />
	<input type="hidden" name="name" id="name" />
	<input type="hidden" name="lastEducation" id="lastEducation" />
	<input type="hidden" name="graduationYear" id="graduationYear" />
	<input type="hidden" name="educationalLevel" id="educationalLevel" />
	<input type="hidden" name="majors" id="majors" />
	<input type="hidden" name="gpa" id="gpa" />
	<input type="hidden" name="bootcampTestType" id="bootcampTestType" />
	<input type="hidden" name="iq" id="iq" />
	<input type="hidden" name="du" id="du" />
	<input type="hidden" name="arithmetic" id="arithmetic" />
	<input type="hidden" name="nestedLogic" id="nestedLogic" />
	<input type="hidden" name="joinTable" id="joinTable" />
	<input type="hidden" name="tro" id="tro" />
	<input type="hidden" name="notes" id="notes" />
	<input type="hidden" name="interviewer" id="interviewer" />
	<input type="hidden" name="createdBy" id="createdBy" />
	<input type="hidden" name="createdOn" id="createdOn" />
	<input type="hidden" name="modifiedBy" id="modifiedBy" />
	<input type="hidden" name="modifiedOn" id="modifiedOn" />
	<input type="hidden" name="deletedBy" id="deletedBy" />
	<input type="hidden" name="deletedOn" id="deletedOn" />
	<input type="hidden" name="isDelete" id="isDelete" />
	
	
	<div class="modal-footer">
		<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">No</button>
		<button type="button" class="btn btn-success" onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->