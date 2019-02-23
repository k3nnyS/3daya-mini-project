<!-- Form Mulai -->
<form id="form-create" class="form-horizontal">
	<div class="box-body">
		<div class="row">
			<div class="col-md-6">
				<input type="hidden" class ="form-control" name = "code" value = "1"/>	
				<input type="hidden" class="form-control" name="createdBy" value="1"/>
				<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
				<input type="hidden" class="form-control" name="isDelete" value="false"/>
				<div class="form-group">
					<label class="control-label col-md-2">Title</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="title" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">Description</label>
					<div class="col-md-9">
						<textarea cols="35" rows="5" class="from-control"
							name="description" />
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label col-md-2">Image URL</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="imageUrl" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Menu Order</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="menuOrder" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Menu Parent</label>
					<div class="col-md-10">
						<input type="text" class=" form-control" name="menuParent" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Menu URL</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="menuUrl" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="box-footer">
		<button type="button" onClick="addData($('#form-create'))"
			class="btn btn-primary pull-right">Save</button>
		<button type="button" class="btn btn-warning pull-right"
			data-dismiss="modal">Cancel</button>
	</div>
</form>