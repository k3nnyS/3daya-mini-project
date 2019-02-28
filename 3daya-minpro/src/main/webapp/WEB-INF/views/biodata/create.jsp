<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<!-- mulai form -->
<form id="form-create" class="form-horizontal">
	<!-- ID -->
	<input type="hidden" name="id" id="id"/>
	<!-- Name -->
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" id="name" placeholder="Name"/>
		</div>
	</div>
	
	<!-- Last Education -->
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="lastEducation" id="lastEducation" placeholder="Last Education"/>
		</div>
	</div>
	
	<!-- Educational Level -->
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="educationalLevel" id="educationalLevel" placeholder="Educational Level"/>
		</div>
	</div>
	
	<!-- Graduation Year -->
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="graduationYear" id="graduationYear" placeholder="Graduation Year"/>
		</div>
	</div>
	
	<!-- Majors -->
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="majors" id="majors" placeholder="Majors"/>
		</div>
	</div>
	
	<!-- GPA -->
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="gpa" id="gpa" placeholder="GPA"/>
		</div>
	</div>
	
	<input type="hidden" name="createdBy" id="createdBy" value="1"/>
	<input type="hidden" name="createdOn" id="createdOn"/>
	<input type="hidden" name="isDelete" id="isDelete" value="false"/>
	
	<div class="modal-footer col-md-10">
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-primary">SAVE</button>
		<button type="button" class="btn btn-success" data-dismiss="modal">CANCEL</button>
	</div>
</form>
<!-- akhir dari form -->