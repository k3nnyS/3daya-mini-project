<!-- Form Mulai -->
<form id = "form-edit" class = "form-horizontal">
	<div class = "box-body">
		<div class = "row">
			<div class = "col-md-6">
			<!-- Name -->
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<input type = "text" class = "form-control" name = "name" id = "name"/>
					</div>
				</div>
				<!-- Technology -->
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<select name = "technologyId" id = "technologyId" class = "form-control">
							<option value = "">-Choose Technology</option>
						</select>
						<!-- <input type = "text" class = "form-control" name = "technologyId" placeholder = "Technology"/> -->
					</div>
				</div>
				<!-- Period To -->
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<input type = "date" class = "form-control" name = "periodTo" id = "periodTo"/>
					</div>
				</div>
				<!-- Bootcamp Type -->
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<select name = "bootcampTypeId" id="bootcampTypeId" class = "form-control">
							<option value = "">-Choose Bootcamp Type</option>
						</select>
						<!--  <input type ="text" class = "form-control" name = "bootcampTypeId" placeholder = "Bootcamp Type"/> -->
					</div>
				</div>
			</div>
			<div class = "col-md-6">
				<!-- Room -->
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<input type = "text" class = "form-control" name = "roomId" id = "roomId"/>
					</div>
				</div>
				<!-- Trainer -->
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<select name = "trainerId" id = "trainerId" class = "form-control">
							<option value ="">-Choose Trainer-</option>
						</select>	
						<!-- <input type = "text" class = "form-control" name = "trainerId" placeholder = "Trainer"/>-->
					</div>
				</div>
				<!-- Period From -->
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<input type = "date" class = "form-control" name = "periodFrom" id = "periodFrom"/>
					</div>
				</div>
				<!-- Note -->
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<textarea rows="2" class = "form-control" name = "notes" id = "notes" style="resize:none"></textarea>
					</div>
				</div>
			</div>
		</div>		
	</div>
		<input type="hidden" class="form-control" name = "id" id="id"/>
		<input type="hidden" class="form-control" name = "createdBy" value = "1"/>
		<input type="hidden" class="form-control" name = "createdOn" id = "createdOn"/>
		<input type="hidden" class="form-control" name = "isDelete" value = "false"/>
	
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