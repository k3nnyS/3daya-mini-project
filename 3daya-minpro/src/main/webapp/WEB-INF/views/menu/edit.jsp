<!-- Form mulai -->
<form id="form-edit" class="form-horizontal">
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label col-md-1"></label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="code" id="code" readonly="readonly"/>
				</div>
			</div>
		
			<div class="form-group">
				<label class="control-label col-md-1"></label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="title" id="title"/>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-1"></label>
				<div class="col-md-10">
					<textarea class="form-control" rows="5" name="description" id="description" style="resize:none"></textarea>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label col-md-1"></label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="imageUrl" id="imageUrl"/>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-1"></label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="menuOrder" id="menuOrder"/>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-1"></label>
				<div class="col-md-10">
					<select name="menuParent" id="menuParent" class = "form-control">
							<option value = "" >-Choose Menu Parent-</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-1"></label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="menuUrl" id="menuUrl"/>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" class="form-control" name="id" id="id"/>
	<input type="hidden" class="form-control" name="code" id="code"/>
	<input type="hidden" class="form-control" name="createdBy" value="1" />
	<input type="hidden" class="form-control" name="createdOn"id="createdOn" />
	<input type="hidden" class="form-control" name="isDelete" value="false" />

	<div class="modal-footer">
		<button type="button" onClick="editData($('#form-edit'))"
			class="btn btn-primary">Save</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
	</div>
</form>
<!-- Form Selesai -->