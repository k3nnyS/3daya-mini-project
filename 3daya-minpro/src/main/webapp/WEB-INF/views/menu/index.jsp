<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">MENU</h3>
		<div class="box-tools">
			<button type="button" id="btn-add" class="btn btn-success btn-sm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="box-body">
		<input class="margin col-md-2" type="text" placeholder="Search by Title" required>
		<table class="table">
			<thead>
				<tr>
					<th>CODE</th>
					<th>TITLE</th>
					<th>MENU PARENT</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>		
	</div>
</div>

<div class="modal" id="modal-form">
	<div class="modal-dialog modal-lg">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title"></h3>
			</div>
			<div class="box-body" id="modal-data">
				
			</div>
		</div>
	</div>
</div>

<div class="modal" id="modal-delete">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-tit"></h3>
			</div>
			<div class="box-body" id="modal-dt">
				
			</div>
		</div>
	</div>
</div>

<!-- tempat menulis javascript -->
<script>
	//method yang pertama kali dipanggil saat page di load
	$(function(){
		// memanggil method loadData;
		loadData();
	});
	
	// ketika btn-add di klik
	$("#btn-add").click(function(){
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/menu/create',
			type : 'get',
			dataType : 'html',
			success : function(result){
				$('#modal-title').html("Add New Menu");
				$('#modal-data').html(result);
				$('#modal-form').modal('show');
				$('#createdOn').val(
						d.getDate() + "-" + d.getMonth() + "-"
								+ d.getFullYear() + " " + d.getHours()
								+ ":" + d.getMinutes() + ":"
								+ d.getSeconds());
			}
		});
	});
	
	//method loadData
	function loadData(){
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/menu/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				//kosong data di table
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.code +'</td>'+
						'<td>'+ item.title+'</td>'+
						'<td>'+ item.menuParent+'</td>'+
						'<td class = "col-md-1">'+
						'<div class = "dropdown">'+
						'<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
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
	
	// method untuk add data
	function addData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			url : '${contextName}/api/menu/',
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
	// function edit data 
	function edData(dataId){
		// panggil API
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/menu/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#code').val(dataApi.code);
				$('#modal-data').find('#title').val(dataApi.title);
				$('#modal-data').find('#description').val(dataApi.description);
				$('#modal-data').find('#imageUrl').val(dataApi.imageUrl);
				$('#modal-data').find('#menuOrder').val(dataApi.menuOrder);
				$('#modal-data').find('#menuParent').val(dataApi.menuParent);
				$('#modal-data').find('#menuUrl').val(dataApi.menuUrl);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#modifiedBy').val(dataApi.modifiedBy);
				$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
				
				console.log(dataApi);
			}
		});
	}
	
	//btn-edit di click
	$('#list-data').on('click', '#btn-edit', function(){
		var vid = $(this).val();
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/menu/edit',
			type : 'get',
			dataType : 'html',
			success : function(result){
				// mengganti judul modal
				$('#modal-title').html("EDIT");
				// mengisi content dengan variable result
				$('#modal-data').html(result);
				// menampilkan modal pop-up
				$('#modal-form').modal('show');
				//panggil method getData
				edData(vid);
				$('#createdOn').val(
						d.getDate() + "-" + d.getMonth() + "-"
								+ d.getFullYear() + " " + d.getHours()
								+ ":" + d.getMinutes() + ":"
								+ d.getSeconds());
			}
		});
	});
	
	function editData($form){
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/menu/
			url : '${contextName}/api/menu/',
			// dengan request put
			type : 'put',
			// data type berupa json
			dataType : 'json',
			// mengirim parameter data
			data : JSON.stringify(dataForm),
			// mime type
			contentType : 'application/json',
			success : function(result){
				// menutup modal
				$('#modal-form').modal('hide');
				// panggil method loadData, untuk melihat data baru
				loadData();
			}
		});
		
	}
	// fungsi mengambil data untuk di delete
	function getData(dataId){
		// panggil API
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/menu/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-dt').find('#id').val(dataApi.id);
				$('#modal-dt').find('#code').val(dataApi.code);
				$('#modal-dt').find('#title').val(dataApi.title);
				$('#modal-dt').find('#description').val(dataApi.description);
				$('#modal-dt').find('#imageUrl').val(dataApi.imageUrl);
				$('#modal-dt').find('#menuOrder').val(dataApi.menuOrder);
				$('#modal-dt').find('#menuParent').val(dataApi.menuParent);
				$('#modal-dt').find('#menuUrl').val(dataApi.menuUrl);
				$('#modal-dt').find('#createdBy').val(dataApi.createdBy);
				$('#modal-dt').find('#createdOn').val(dataApi.createdOn);
				$('#modal-dt').find('#modifiedBy').val(dataApi.modifiedBy);
				$('#modal-dt').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-dt').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-dt').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-dt').find('#isDelete').val(dataApi.isDelete);
				
				console.log(dataApi);
			}
		});
	}
	
	//btn-delete di click
	$('#list-data').on('click','#btn-delete', function(){
		var vid = $(this).val();
		$.ajax({
			url:'${contextName}/menu/delete',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-tit").html("DELETE");
				//mengisi content dengan variable result
				$("#modal-dt").html(result);
				//menampilkan modal pop up
				$("#modal-delete").modal('show');
				//panggil method
				getData(vid);
			}
		});
	});
	
	// method untuk delete data
	function deleteData($form){
		// memangil method getFormData dari file
		var vid = $form.find("#id").val();
		$.ajax({
			// url ke api/trainer/
			url:'${contextName}/api/menu/'+vid,
			// method http di controller
			type:'delete',
			// data type berupa JSON
			dataType:'json',
			// jika sukses
			success : function(result){
				//menutup modal
				$("#modal-delete").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
				console.log(result);
			}
		});
	}
</script>