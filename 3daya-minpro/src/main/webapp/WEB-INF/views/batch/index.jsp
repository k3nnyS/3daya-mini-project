<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<div class = "box box-info">
	<div class = "box-header">
		<h3 class = "box-title">BATCH</h3>
	</div>
	<div class = "box-body col-md-12">
		<input type="text" name = "search" id = "search" placeholder="Search by Technology/Name" required>
		<button type ="button" class="btn btn-warning btn-sm" onclick="search()">
			<i class = "fa fa-circle-o"></i>
		</button>
		<button type = "button" id = "btn-add" class = "btn btn-succcess btn-warning btn-sm pull-right">
			<i class = "fa fa-plus"></i>
		</button>
	</div>
	<div class = "box-body">
		<table class="table">
			<thead>
				<tr>
					<th>TECHNOLOGY</th>
					<th>NAME</th>
					<th>TRAINER</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>		
	</div>
</div>
<!-- Untuk memunculkan pop-up -->
<div class = "modal" id = "modal-form">
	<div class = modal-dialog>
		<div class = "box box-success">
			<div class = "box-header with-border">
				<h3 class = "box-title" id = "modal-title"></h3>
			</div>
			<div class = "box-body" id = "modal-data">
			</div>
		</div>
	</div>
</div>

<!-- tempat menulis javascript -->
<script>
	//method yang pertama kali di panggil saat di page load
	$(function(){
		// memanggil method loadData
		loadData();
	});
	
	// method loadData
	function loadData(){
		$.ajax({
			// untuk meng-link api/batch/
			url : '${contextName}/api/batch/',
			// type berupa get
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(result){
				// pertama-tama kosong data di table
				$("#list-data").empty();
				// looping data dengan JQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
					'<td>'+ item.technologyId +'</td>'+
					'<td>'+ item.name+'</td>'+
					'<td>'+ item.trainerId+'</td>'+
					'<td class = "col-md-1">'+
					'<div class = "dropdown">'+
						'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
						'<ul class = "dropdown-menu">'+
							'<li id = "btn-edit" value = "'+item.id+'"><a>Edit</a></li>'+
							'<li id = "btn-partcipant" value = ""><a>Add Participant</a></li>'+
							'<li id = "btn-test" value = ""><a>Setup Test</a></li>'+
						'</ul>' +
					'</div>' +
					'</td>' +
					'</tr>';
				$("#list-data").append(dataRow);
				});
				console.log(result);
			}
		});
	}
	
	//method search
	function search(){
		var item = $('#search').val();
		$.ajax({
			url : '${contextName}/api/batch/search/'+item,
			type : 'get',
			dataType : 'json',
			success : function(result){
				$('#list-data').empty();
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
					'<td>'+ item.technologyId +'</td>'+
					'<td>'+ item.name+'</td>'+
					'<td>'+ item.trainerId+'</td>'+
					'<td class = "col-md-1">'+
					'<div class = "dropdown">'+
						'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
						'<ul class = "dropdown-menu">'+
							'<li id = "btn-edit" value = "'+item.id+'"><a>Edit</a></li>'+
							'<li id = "btn-partcipant" value = ""><a>Add Participant</a></li>'+
							'<li id = "btn-test" value = ""><a>Setup Test</a></li>'+
						'</ul>' +
					'</div>' +
					'</td>' +
					'</tr>';
				$("#list-data").append(dataRow);
				});
			}
		});
	}
</script>