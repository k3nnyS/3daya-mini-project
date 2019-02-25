<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<input type="hidden" class="form-control" name="id" id="id" />
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" id="name" placeholder="Name" />
		</div>
	</div>
		
	<div class="form-group ">
		<div class="col-md-10">
			<textarea class="form-control" name="notes" placeholder="Notes" id="notes"></textarea>
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="typeOfAnswer" value="1" id="typeOfAnswer"/>
	<input type="hidden" class="form-control" name="createdBy" value="1" id="createdBy"/>
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy"/>
	<input type="hidden" class="form-control" name="modifiedOn" id="modifiedOn"/>
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy"/>
	<input type="hidden" class="form-control" name="deletedOn" id="deletedOn"/>
	<input type="hidden" class="form-control" name="isDelete" value="false" id="isDelete"/>
	
	
	<div class="modal-footer">
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-primary">SAVE</button>
		<button type="button" class="btn btn-success" data-dismiss="modal">CANCEL</button>
	</div>

</form>