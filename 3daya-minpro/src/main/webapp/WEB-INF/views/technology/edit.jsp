<!-- form mulai -->
<form id="form-edit" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="tech[name]" id="name"
				placeholder="Name" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<textarea class="form-control" name="tech[notes]" placeholder="Notes" id="notes"
				style="resize: none" />
		</div>
	</div>
		 
	<br>
	
	<br>
	<button type="button" class="btn btn-warning"
		style="position: relative; left: 435px;" onClick="addTrainer()" id="btn-trainer">+TRAINER</button>

	<div class="box-body">
		<table class="control-table col-md-10" border="1">
		<div class="col-md-1">
			<thead>
				<tr>
					<th>NAME</th>
					<th class="col-md-1">#</th>
				</tr>
			</thead>
			<tbody id="list-train">
			
			</tbody>
		</table>
	</div>
	<br> <br>

	<div class="modal-footer">
		<button type="button" class="btn btn-warning"
			style="position: relative; right: 160px;" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="editData($('#form-edit'))" class="btn btn-warning" style="position: relative; right: 35px;">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->