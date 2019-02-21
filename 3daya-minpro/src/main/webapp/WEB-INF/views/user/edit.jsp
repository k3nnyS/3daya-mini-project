<!-- form mulai -->
<form id="form-edit" class="form-horizontal">
	<!-- id -->
	<input type="hidden" name="id" id="id" />

	<!-- Role Id -->
	<div class="form-group">
	<label class="control-label col-md-2">Role</label>
		<div class="col-md-10">
			<select name="roleId" id="roleId" class="form-control">
				<option value="">=Select Role=</option>
			</select>
		</div>
	</div>

	<div class="form-group">
	<label class="control-label col-md-2">Email</label>
		<div class="col-md-8">
			<input type="text" class="form-control" name="email" id="email" />
		</div>
	</div>

	<div class="form-group">
	<label class="control-label col-md-2">UserName</label>
		<div class="col-md-8">
			<input type="text" class="form-control" name="username" id="username" />
		</div>
	</div>

	<div class="form-group">
	<label class="control-label col-md-2">Password</label>
		<div class="col-md-8">
			<input type="text" class="form-control" name="password" id="password"/>
		</div>
	</div>

	<div class="form-group">
	<label class="control-label col-md-2">Mobile Flag</label>
		<div class="col-md-8"> 
			<label class= "radio-inline"> <input type="radio" name="mobileFlag"
				value="Pria">True
			</label> <label class="radio-inline"> <input type="radio" name="mobileFlag"
				value="Wanita">False
			</label>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-8">
			<input type="text" class="form-control" name="mobileToken" id="mobileToken" placeholder="Mobile Token"/>
		</div>
	</div>

	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left" onClick="editData($('#form-edit'))">Simpan</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	</div>
	
	<input type="hidden" name="createdBy" id="createdBy" />
	
	<input type="hidden" name="createdOn" id="createdOn" />
	
	<input type="hidden" name="isDelete" id="isDelete" />
	
</form>
<!-- Form Selesai -->