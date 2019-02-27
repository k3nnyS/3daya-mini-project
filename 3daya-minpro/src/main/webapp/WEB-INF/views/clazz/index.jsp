
<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">CLASS</h3>
	</div>

	<div class="box-body">
		<div class="row">
			<div class="col-md-11">
				<div class="input-group col-md-5">
					<input type="text" name="search" id="search" class="form-control"
						placeholder="Search by batch" /> <span class="input-group-btn">
						<button class="btn btn-warning btn-xm " onClick="search()">
							<i class="fa fa-circle-o"></i>
						</button>
					</span>
				</div>
			</div>
			<div class="box-tools">
				<button type="button" id="btn-add" class="btn btn-warning btn-xm">
					<i class="fa fa-plus"></i>
				</button>
			</div>
		</div>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th>BATCH</th>
					<th>NAME</th>
					<th class="col-md-1">#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>
	</div>
</div>

<div class="modal" id="modal-form">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title" id="modal-title"></h3>
			</div>
			<div class="box-body" id="modal-data"></div>
		</div>
	</div>
</div>

<script>
	// method yang pertama dipanggil saat page diload
	$(function() {
		// memanggil method load data
		loadData();
		
	function loadData(){
		$.ajax({
			url: '${contextName}/api/clazz/',
			type: 'get',
			dataType: 'json',
			success: function(result){
				$('#list-data').empty();
				$.each(result, function (index, item){
					var dataRow='<tr>'
					+'<td>'
					+item.batch.name
					+'</td>'
					+'<td>'
					+item.name
					+'</td>'
					+'<td class="col-md-1">'
					+'<div class="dropdown">'
					+'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
					+'<ul class="dropdown-menu">'
					+'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'
					+'</ul>'
					+'</div>'
					+'</td>'
					+'</tr>';
				$("#list-data").append(dataRow);
		});
		console.log(result);
	}
	});
	}
	
	function getData(dataId){
		$.ajax({
			url: '${contextName}/api/clazz/' + dataId,
			type: 'get'
			dataType: 'json',
			success: function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#batchId').val(dataApi.batchId);
				$('#modal-data').find('#biodataId').val(dataApi.biodataId);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				
			console.log(dataApi);
			}
		});	
	}
	
	function search() {	
	}
	}
</script>