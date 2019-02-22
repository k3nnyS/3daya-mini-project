<!-- form mulai -->
<form id="form-edit" class="form-horizontal">
	<!-- id -->
	<input type="hidden" name="id" id="id" />

	<!-- Role Id -->
	<div class="form-group">
		<label class="control-label col-md-3">Role</label>
		<div class="col-md-7">
			<select name="roleId" id="roleId" class="form-control">
				<option value="">=Select Role=</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">Email</label>
		<div class="col-md-7">
			<input type="text" class="form-control" name="email" id="email" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">UserName</label>
		<div class="col-md-7">
			<input type="text" class="form-control" name="username" id="username" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">Password</label>
		<div class="col-md-7">
			<input type="text" class="form-control" name="password" id="password" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">New Password</label>
		<div class="col-md-7">
			<input type="text" class="form-control" name="password" id="password" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">Mobile Flag</label>
		<div class="col-md-7">
			<label class="radio-inline"> <input type="radio"
				name="mobileFlag" value="">True
			</label> <label class="radio-inline"> <input type="radio"
				name="mobileFlag" value="">False
			</label>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">Mobile Token</label>
		<div class="col-md-7">
			<input type="text" class="form-control" name="mobileToken"
				id="mobileToken" placeholder="input Mobile Token" />
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<input type="hidden" class="form-control" name="deletedBy" value="mgaulia"/>
	
	<input type="hidden" class="form-control" name="deletedOn" value="deletedOn"/>
	

	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left"
			onClick="editData($('#form-edit'))">Update</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	</div>

	<input type="hidden" name="modifedBy" id="modifedBy" />
	<input type="hidden" name="modifedOn" id="modifedOn" />
	<input type="hidden" name="createdBy" id="createdBy" />
	<input type="hidden" name="createdOn" id="createdOn" />
	<input type="hidden" name="isDelete" id="isDelete" />


</form>
<!-- Form Selesai -->