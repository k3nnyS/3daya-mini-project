<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">IDLE NEWS</h3>
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
					if(item.isDelete == false){
					var dataRow = '<tr>'+
						'<td>'+item.title+'</td>'+
						'<td>'+item.category.name+'</td>'+
						'<td class = "col-md-1">'+
						'<div class = "dropdown">'+
							'<button class = "btn btn-warning dropdown-toggle" type = "button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class = "caret"></span></button>'+
							'<ul class="dropdown-menu">'+
								'<li id = "btn-edit" value = "'+item.id+'"><a>Edit</a></li>'+
								'<li id = "btn-delete" value = "'+item.id+'"><a>Delete</a></li>'+
							'</ul>'+
						'</div>'+
						'<td>'+
					'<tr>';
				$("#list-data").append(dataRow);
					}
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
					'<td>'+ item.category.name+'</td>'+
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
	// function untuk memanggil category
	function loadCategory($form, $selected){
		$.ajax({
			url : '${contextName}/api/category/',
			type : 'get',
			dataType : 'json',
			success : function(result){
				$form.find("#categoryId").empty();
				$form.find("#categoryId").append('<option value = "">-Choose Category-</option>');
				//looping data
				$.each(result, function(index, item){
					if ($selected == item.id){
						$form.find("#categoryId").append('<option value = "'+item.id+'" selected="selected">'+item.name+'</option>');
					} else {
						$form.find("#categoryId").append('<option value = "'+item.id+'">'+item.name+'</option');
					}
				});
			}
		});
	}
	
	// ketika btn-add di klik
	$("#btn-add").click(function(){
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/idlenews/create',
			type : 'get',
			dataType : 'html',
			success : function(result){
				$('#modal-title').html("IDLE NEWS");
				$('#modal-data').html(result);
				$('#modal-form').modal('show');
				$('#createdOn').val(
						d.getDate() + "-" + d.getMonth() + "-"
						+ d.getFullYear() + " " + d.getHours()
						+ ":" + d.getMinutes() + ":"
						+ d.getSeconds());
				loadCategory($("#modal-data"));
			}
		});
	});
	
	// fungsi untuk menambah data
	function addData($form){
		var title = $('#modal-data').find('#title').val();
		var len = title.length;
		if (len<1){
			alert("Data Harus di Isi");
		} else{
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			url : '${contextName}/api/idlenews/',
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
	}
	
	// memberikan fungsi untuk mengambil data
	function getData(dataId){
		$.ajax({
			url : '${contextName}/api/idlenews/'+dataId,
			type : 'get',
			dataType : 'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#categoryId').val(dataApi.categoryId);
				$('#modal-data').find('#title').val(dataApi.title);
				$('#modal-data').find('#content').val(dataApi.content);
				$('#modal-data').find('#isPublish').val(dataApi.isPublish);
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
	
	// ketika btn-delete di klik
	$('#list-data').on('click', '#btn-delete', function(){
		var vid = $(this).val();
		$.ajax({
			url : '${contextName}/idlenews/delete',
			type : 'get',
			dataType : 'html',
			success : function(result){
				$('#modal-title').html("IDLE NEWS");
				$('#modal-data').html(result);
				$('#modal-form').modal('show');
				getData(vid);
			}
		});
	});
	
	// fungsi untuk delete data
	function deleteData($form){
		$('#isDelete').val('true');
		var dataForm = getFormData($form);
		$.ajax({
			url:'${contextName}/api/idlenews/',
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
			url : '${contextName}/idlenews/edit',
			type : 'get',
			dataType : 'html',
			success : function(result){
				$('#modal-title').html("IDLE NEWS");
				$('#modal-data').html(result);
				$('#modal-form').modal('show');
				loadCategory($("#modal-data"));
				getData(vid);
			}
		});
	});
	
	function editData($form){
		var title = $('#modal-data').find('#title').val();
		var len = title.length;
		if (len<1){
			alert("Data Tidak Boleh Kosong")
		} else {
		// memangil method getFormData dari file
		// resources/dist/js/map-dagang-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			url:'${contextName}/api/idlenews/',
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
	}
</script>