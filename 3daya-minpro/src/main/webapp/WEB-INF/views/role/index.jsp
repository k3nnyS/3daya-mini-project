
<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Role List</h3>
		<!--  -->
	</div>
	<div class="box-body">
		<div class="row">
			<div class="box-tools col-md-4">
					<span class="input-group-btn">
					<input type="text" class="form-control"id="search-box" width="50px" />					
						<button class="btn btn-info" onclick="search()">MyButton</button>
					</span>
			</div>
			<div class="col-md-4">
					<button type="button" id="btn-add" class="btn btn-success btn-sm pull-right">
						<i class="fa fa-plus"></i>
					</button>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>Code</th>
					<th>Name</th>
					<th>#</th>
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
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title"></h3>
			</div>
			<div class="box-body" id="modal-data"></div>
		</div>
	</div>
</div>
<script>
	// method yang pertama kali dipanggil saat page di load
	$(function() {
		// memanggil method loadData;
		loadData();
	});

	$("#btn-add").click(
			function() {
				var d = new Date($.now());
				$.ajax({
					url : '${contextName}/role/create',
					type : 'get',
					dataType : 'html',
					success : function(result) {
						//mengganti judul modal
						$("#modal-title").html("Add New role");
						//mengisi content dengan variable result
						$("#modal-data").html(result);
						//menampilkan modal pop up
						$("#modal-form").modal('show');
						$('#createdOn').val(
								d.getDate() + "-" + d.getMonth() + "-"
										+ d.getFullYear() + " " + d.getHours()
										+ ":" + d.getMinutes() + ":"
										+ d.getSeconds());
					}
				});
			});
	
	function search(){
		var item = $('#search-box').val();
		$.ajax({
			url: '${contextName}/api/role/search/' + item,
			type: 'get',
			dataType: 'json',
			success: function(result){
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
				var dataRow ='<tr>'+
					'<td>'+ item.code+'</td>'+
					'<td>'+ item.name+'</td>'+
					'<td class="col-md-1">'+
						'<div class="dropdown">'+
					'<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
				   	 '<ul class="dropdown-menu">'+
				   	'<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'+
			    	'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'+
				    '</ul>'+
				    '</div>'+
					'</td>'+
					'</tr>';
					$("#list-data").append(dataRow);
					});
				console.log(result);
			}
		});
	}

	//method loadData
	function loadData() {
		$
				.ajax({
					url : '${contextName}/api/role/list',
					type : 'get',
					// data type berupa JSON
					dataType : 'json',
					success : function(result) {
						//kosong data di table
						$("#list-data").empty();
						// looping data dengan jQuery
						$.each(result, function(index, item){
					var dataRow ='<tr>'+
					'<td>'+ item.code+'</td>'+
					'<td>'+ item.name+'</td>'+
					'<td class="col-md-1">'+
					'<div class="dropdown">'+
					'<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
				    '<ul class="dropdown-menu">'+
				    	'<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'+
				    	'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'+
				    '</ul>'+
				    '</div>'+
					'</td>'+
					'</tr>';
					$("#list-data").append(dataRow);
				});
						console.log(result);
					}
				});
	}

	// method untuk add data
	function addData($form) {
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/role/
			url : '${contextName}/api/role/',
			type : 'post',
			// data type berupa JSON
			dataType : 'json',
			// mengirim parameter data
			data : JSON.stringify(dataForm),
			// mime type 
			contentType : 'application/json',
			success : function(result) {
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
			}
		});
		console.log(dataForm);
	}

	// function get data 
	function getData(dataId) {
		// panggil API
		$.ajax({
			// url ke api/role/
			url : '${contextName}/api/role/' + dataId,
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(dataApi) {
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#code').val(dataApi.code);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#description').val(dataApi.description);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);

				console.log(dataApi);
			}
		});
	}

	// ketidak btn-edit di click
	$('#list-data').on('click', '#btn-edit', function() {
		var vid = $(this).val();
		$.ajax({
			url : '${contextName}/role/edit',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				//mengganti judul modal
				$("#modal-title").html("Edit Data Role");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
				// panggil method getData
				getData(vid);
			}
		});
	});

	// method untuk delete data
	function editData($form) {
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/role/
			url : '${contextName}/api/role/',
			type : 'put',
			// data type berupa JSON
			dataType : 'json',
			// mengirim parameter data
			data : JSON.stringify(dataForm),
			// mime type 
			contentType : 'application/json',
			success : function(result) {
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
			}
		});
		console.log(dataForm);
	}

	// ketika btn-delete di click
	$('#list-data').on('click', '#btn-delete', function() {
		var vid = $(this).val();
		$.ajax({
			url : '${contextName}/role/delete',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				//mengganti judul modal
				$("#modal-title").html("Delete Data Role");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
				// panggil method getData
				getData(vid);
			}
		});
	});

	// method untuk delete data
	function deleteData($form) {
		// memangil method getFormData dari file
		var vid = $form.find("#id").val();
		$.ajax({
			url : '${contextName}/api/role/' + vid,
			type : 'delete',
			dataType : 'json',
			success : function(result) {
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
				console.log(result);
			}
		});
	}
</script>

