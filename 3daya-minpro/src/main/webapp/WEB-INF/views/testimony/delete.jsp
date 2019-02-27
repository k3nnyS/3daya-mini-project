<!-- Form Mulai -->
<form id = "form-delete" class = "form-horizontal">
<!-- Menampilkan Tulisan berada di tengah -->
<center>
<h3>Are you sure to delete this data ?</h3>
</center>

<input type = "hidden" name = "id" id = "id"/>
<input type = "hidden" name = "title" id ="title"/>
<input type = "hidden" name = "content" id = "content"/>
<input type = "hidden" name = "createdBy" id ="createdBy"/>
<input type = "hidden" name = "createdOn" id = "createdOn"/>
<input type = "hidden" name = "isDelete" id = "isDelete"/>

<div class = "modal-footer">
	<button type = "button" class = "btn btn-danger pull-left" data-dismiss="modal">No</button>
	<button type = "button" class = "btn btn-success" onClick="deleteData($('#form-delete'))">Yes</button>
</div>
</form>
<!-- Form Selesai -->