<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Idle News</h3>
	</div>
		
	<div class="box-body">
	<div class="row">
		<div class="col-md-11">
			<div class="input-group col-md-5">
				<input type="text" name="search" id="search" class="form-control" placeholder="Search by Title" /> 
				<span class="input-group-btn">
					<button class="btn btn-warning btn-xm "
						onClick="search()">
						<i class="fa fa-circle-o"></i>
					</button>
				</span>
			</div>
		</div>
		<div class="box-tools">
			<button type="button" id="btn-add"
				class="btn btn-warning btn-xm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<br>
		<table class="table">
			<thead>
				<tr>
					<th>TITLE</th>
					<th>CATEGORY</th>
					<th class="col-md-1">#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>
	</div>
</div>

<div class = "modal" id="modal-form">
	<div class = "modal-dialog">
		<div class = "box box-success">
			<div class = "box-header with-border">
				<h3 class = "box-title" id = "modal-title"></h3>
			</div>
			<div class="box-body" id="modal-data">
			</div>
		</div>
	</div>
</div>
<script>
	// method yang pertama kali di panggil saat page di load
	$(function(){
		//memanggil method loadData
		loadData();
	});
	
	// function load data
	function loadData(){
		$.ajax({
			url : '${contextName}/api/idlenews/',
			type : 'get',
			dataType : 'json',
			success : function(result){
				$("#list-data").empty();
				$.each(result, function(index, item){
					var dataRow = '<tr>'+
						'<td>'+item.title+'</td>'+
						'<td>'+item.categoryId+'</td>'+
						'<td class = "col-md-1">'+
						'<div class = "dropdown">'+
							'<button class = "btn btn-warning dropdown-toggle" type = "button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class = "caret"></span></button>'+
							'<ul class="dropdown-menu">'+
								'<li id = "btn-edit" value = "'+item.id+'"><a>Edit</a></li>'+
								'<li id = "btn-delete" valiue = "'+item.id+'"><a>Delete</a></li>'+
							'</ul>'+
						'</div>'+
						'<td>'+
					'<tr>';
				$("#list-data").append(dataRow);
				});
				console.log(result);
			}
		});
	}
	
	// function search
	function search(){
		var item = $('#search').val();
		$.ajax({
			url : '${contextName}/api/idlenews/search/'+item,
			type : 'get',
			dataType : 'json',
			success : function(result){
				$('#list-data').empty();
				// buat munculin dropdown untuk edit dan delete
				$.each(result, function(index, item){
				var dataRow ='<tr>'+
					'<td>'+ item.title +'</td>'+
					'<td>'+ item.categoryId+'</td>'+
					'<td class = "col-md-1">'+
					'<div class = "dropdown">'+
						'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
						'<ul class = "dropdown-menu">'+
							'<li id = "btn-edit" value = "'+item.id+'"><a>Edit</a></li>'+
							'<li id = "btn-delete" value = "'+item.id+'"><a>Delete</a></li>'+
						'</ul>' +
					'</div>' +
					'</td>' +
				'</tr>';
				$("#list-data").append(dataRow);
				});
				// menampilkan data ke console => F12
				console.log(result);
			}
		});
	}
	
</script>