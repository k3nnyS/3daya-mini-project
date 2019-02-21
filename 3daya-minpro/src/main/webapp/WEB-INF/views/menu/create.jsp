<!-- Form Mulai -->
<form id = "form-create" class = "form-horizontal">
	<div class = "box box-info">
		<div class = "box-header with-border">
			<h3 class = "box-title"></h3>
		</div>
		
		<div class = "box-body">
			<div class ="row">
				<div class = "col-md-6">
					<div class = "form-group">
						<label class="control-label col-md-2">Title</label>
						<div class = "col-md-10">
							<input type = "text" class = "form-control" name ="title" id = "title" />
						</div>
					</div>	
					<div class = "form-group">
						<label class="control-label col-md-2">Description</label>
						<div class = "col-md-10">
							<input type = "text" class = "form-control" name ="title" id = "description" />
						</div>
					</div>	
				</div>
				
				<div class = "col-md-6">
					<div class = "form-group">
						<label class = "control-label col-md-2">Image URL</label>
							<div class = "col-md-10">
								<input type = "text" class = "form-control" name = "imageUrl"/>
							</div>
					</div>
					<div class = "form-group">
						<label class = "control-label col-md-2">Menu Order</label>
							<div class = "col-md-10">
								<input type = "text" class ="form-control" name = "menuOrder"/>
							</div>
					</div>
					<div class = "form-group">
						<label class = "control-label col-md-2">Menu Parent</label>
						<div class = "col-md-10">
							<input type = "text" class =" form-control" name ="menuParent"/>
						</div>
					</div>
					<div class = "form-group"></div>
					<label class = "control-label col-md-2">Menu URL</label>
					<div class = "col-md-10">
						<input type = "text" class = "form-control" name = "menuParent" />
					</div>
				</div>
			</div>
		</div>
		
		<div class = "box-footer">
			<button type = "button" onClick="addData($('#form-create'))" class = "btn btn-primary pull-right">Save</button>
			<button type = "button" class = "btn btn-warning" data-dismiss = "modal">Cancel</button>
		</div>
	</div>
</form>