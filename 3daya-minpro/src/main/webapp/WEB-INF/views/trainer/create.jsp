<!-- form mulai -->
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-2">Name</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Notes</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="notes" />
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-primary">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->
