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
		<button type="button" class="btn btn-warning"
			style = "position:relative;right:160px;top:2px;" 
			data-dismiss="modal">Cancel</button>
		<button type="button" onClick="editData($('#form-edit'))"
			style = "position:relative;right:35px;top:2px;"
			class="btn btn-warning">Save</button>
	</div>
</form>
<!-- Form Selesai -->