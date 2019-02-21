<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">TEST</h3>
		<div class="box-tools">
			<button type="button" id="btn-add" class="btn btn-primary btn-sm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="box-body">
		<table class="table">
			<thead>
				<tr>
					<th>NAME</th>
					<th>CREATED BY</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			
			</tbody>
		</table>		
	</div>
</div>

<div class="modal" id="modal-test">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title">Form Input</h3>
			</div>
			<div class="box-body" id="modal-data">
				
			</div>
		</div>
	</div>
</div>

<script>
//ketika button add di click
$("#btn-add").click(function(){
	$.ajax({
		url:'${contextName}/test/create',
		type:'get',
		dataType:'html',
		success : function(result){
			//mengganti judul modal
			$("#modal-title").html("Add New Test");
			//mengisi content dengan variable result
			$("#modal-data").html(result);
			//menampilkan modal pop up
			$("#modal-test").modal('show');
		}
	});
});
</script>