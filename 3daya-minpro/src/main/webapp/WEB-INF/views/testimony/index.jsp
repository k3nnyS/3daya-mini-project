<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<!-- Div bagian utama halaman -->
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">TESTIMONY</h3>
	</div>	
	<!-- Div bagian search -->
	<div class="box-body">
	<div class="row">
		<div class="col-md-11">
			<div class="input-group col-md-5">
				<input type="text" name="search" id="search" class="form-control" placeholder="Search by Name" /> 
				<span class="input-group-btn">
					<button class="btn btn-warning btn-xm "
						onClick="search()">
						<i class="fa fa-circle-o"></i>
					</button>
				</span>
			</div>
		</div>
		<!-- div bagian add -->
		<div class="box-tools">
			<button type="button" id="btn-add"
				class="btn btn-warning btn-xm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<!-- Bagian Table -->
	<br>
		<table class="table">
			<thead>
				<tr>
					<th>NAME</th>
					<th class="col-md-1">#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>
	</div>
</div>
<!-- Div bagian pemanggil pop-up yang muncul -->
<div class = "modal" id = "modal-form">
	<div class = "modal-dialog">
		<div class = "box box-success">
			<!-- Div bagian judul -->
			<div class = "box-header with-border">
				<h3 class = "box-title" id = "modal-title"></h3>
			</div>
			<!-- Div bagian tempat mengisi data -->
			<div class = "box-body" id ="modal-data">
			
			</div>
		</div>
	</div>
</div>
<!-- Tempat menulis syntax javascript -->
<script>
	//method yang pertama kali di panggil saat page di load
	$(function(){
		// memanggil method loadData;
		loadData();
	});
	
	//membuat function loadData untuk menampilkan data yang pernah di isi
	function loadData(){
		$.ajax({
			url : '${contextName}/api/testimony/',
			type : 'get',
			//data type berupa json
			dataType : 'json',
			success : function(result){
				//kosongkan data di table
				$("#list-data").empty();
				//looping data dengan JQuery
				$.each(result, function(index, item){
					if(item.isDelete == false){
					var dataRow = '<tr>'+
						'<td>'+ item.title +'</td>'+
						'<td class = "col-md-1">'+
						'<div class = "dropdown">'+
							'<button class = "btn btn-warning dropdown-toggle" type = "button" data-toggle = "dropdown"><i class = "fa fa-align-justify"></i><span class = "caret"></span></button>'+
							'<ul class = "dropdown-menu">'+
								'<li id = "btn-edit" value ="'+item.id+'"><a>Edit</a></li>'+
								'<li id = "btn-delete" value ="'+item.id+'"><a>Delete</a></li>'+
							'</ul>'+
						'</div>'+
						'</td>'+
					'</tr>';
				$("#list-data").append(dataRow);
					}
				});
				//menampilkan data ke console => F12
				console.log(result);
			}
		});
	}
	
	//function search
	function search(){
		var item = $('#search').val();
		$.ajax({
			url : '${contextName}/api/testimony/search/'+item,
			type : 'get',
			dataType : 'json',
			success : function(result){
				$('#list-data').empty();
				// buat menampilkan dropdwon edit dan delete
				$.each(result, function(index, item){
					var dataRow = '<tr>'+
						'<td>'+item.title+'</td>'+
						'<td class = "col-md-1">'+
						'<div class = "dropdown">'+
							'<button class = "btn btn-warning dropdown-toggle" type = "button" data-toggle = "dropdown"><i class = "fa fa-align-justify"></i><span class = "caret"></span></button>'+
								'<ul class = "dropdown-menu">'+
									'<li id = "btn-edit" value = "'+item.id+'"><a>Edit</a></li>'+
									'<li id = "btn-delete" value = "'+item.id+'"><a>Delete</a></li>'+
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
	
	//ketika id btn-add di klik
	$("#btn-add").click(function(){
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/testimony/create',
			type : 'get',
			dataType : 'html',
			success : function(result){
				//mengganti judul modal
				$('#modal-title').html("TESTIMONY");
				//mengisi content dengan variable result
				$('#modal-data').html(result);
				//menampilkan modal pop-up
				$('#modal-form').modal('show');
				$('#createdOn').val(d.getDate()+
						"-"+d.getMonth()+
						"-"+d.getFullYear()+
						" "+d.getHours()+
						":"+d.getMinutes()+
						":"+d.getSeconds());
			}
		});
	});
	
	//method untuk add data
	function addData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			url : '${contextName}/api/testimony/',
			type : 'post',
			dataType : 'json',
			data : JSON.stringify(dataForm),
			contentType : 'application/json',
			success : function(result){
				$('#modal-form').modal('hide');
				loadData();
			}
		});
		console.log(dataForm);
	}
	
	//memberikan function mengambil data
	function getData(dataId){
		$.ajax({
			url : '${contextName}/api/testimony/'+dataId,
			type : 'get',
			dataType : 'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#title').val(dataApi.title);
				$('#modal-data').find('#content').val(dataApi.content);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#modifiedBy').val(dataApi.modfiedBy);
				$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
				
				console.log(dataApi);
			}
		});
	}
	
	//ketika btn-delete di klik
	$('#list-data').on('click', '#btn-delete', function(){
		var vid = $(this).val();
		$.ajax({
			url : '${contextName}/testimony/delete',
			type : 'get',
			dataType : 'html',
			success : function(result){
				$('#modal-title').html("TESTIMONY");
				$('#modal-data').html(result);
				$('#modal-form').modal('show');
				getData(vid);
			}
		});
	});
	
	//function untuk mendelete data
	function deleteData($form){
		$('#isDelete').val('true');
		var dataForm = getFormData($form);
		$.ajax({
			url:'${contextName}/api/testimony/',
			type:'put',
			dataType:'json',
			data:JSON.stringify(dataForm),
			contentType: 'application/json',
			success : function(result){
				$("#modal-form").modal('hide');
				loadData();
			}
		});
		console.log(dataForm);
	}
	
	// ketika btn-edit di klik
	$('#list-data').on('click', '#btn-edit', function(){
		var vid = $(this).val();
		$.ajax({
			url : '${contextName}/testimony/edit',
			type : 'get',
			dataType : 'html',
			success : function(result){
				$('#modal-title').html("TESTIMONY");
				$('#modal-data').html(result);
				$('#modal-form').modal('show');
				getData(vid);
			}
		});
	});
	
	// method untuk edit data
	function editData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-dagang-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			url:'${contextName}/api/testimony/',
			type:'put',
			dataType:'json',
			data:JSON.stringify(dataForm),
			contentType: 'application/json',
			success : function(result){
				$("#modal-form").modal('hide');
				loadData();
			}
		});
		console.log(dataForm);
	}
</script>

