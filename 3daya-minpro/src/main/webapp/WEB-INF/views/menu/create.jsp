<!-- Form Mulai -->
<form id="form-create" class="form-horizontal">
	<div class="box-body">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label col-md-1"></label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="title" placeholder="Title"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-1"></label>
					<div class="col-md-10">
						<textarea   rows ="5" class="form-control" name="description" placeholder="Description" style="resize:none"/>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label col-md-1"></label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="imageUrl" placeholder="Image URL"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-1"></label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="menuOrder" placeholder="Menu Order"/>
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
						<input type="text" class="form-control" name="menuUrl" placeholder="Menu URL"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<input type="hidden" class ="form-control" name = "code" value = "1"/>	
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<div class="modal-footer">
		<button type="button" onClick="addData($('#form-create'))"
			class="btn btn-primary">Save</button>
		<button type="button" class="btn btn-warning"
			data-dismiss="modal">Cancel</button>
	</div>
</form>