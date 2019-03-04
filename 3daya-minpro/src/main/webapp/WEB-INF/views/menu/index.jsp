<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">MENU</h3>
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
					<th>CODE</th>
					<th>TITLE</th>
					<th>MENU PARENT</th>
					<th class="col-md-1">#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>
	</div>
</div>
<!-- Untuk memunculkan pop-up -->
<div class="modal" id="modal-form-large">
	<div class="modal-dialog modal-lg">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title-large"></h3>
			</div>
			<div class="box-body" id="modal-data-large">
				
			</div>
		</div>
	</div>
</div>

<div class="modal" id="modal-form-small">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title-small"></h3>
			</div>
			<div class="box-body" id="modal-data-small">
				
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
					if(item.isDelete == false){
						var dataRow ='<tr>'+
						'<td>'+ item.code +'</td>'+
						'<td>'+ item.title+'</td>'+
						'<td>'+ ${mp.parents.menuParent	}+'</td>'+
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
					}
				});
				// menampilkan data ke console => F12
				console.log(result);
			}
		});
	}
	
	// ketika btn-add di klik
	$("#btn-add").click(function(){
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/menu/create',
			type : 'get',
			dataType : 'html',
			success : function(result){
				$('#modal-title-large').html("MENU");
				$('#modal-data-large').html(result);
				$('#modal-form-large').modal('show');
				$('#createdOn').val(
								d.getDate() + "-" + d.getMonth() + "-"
								+ d.getFullYear() + " " + d.getHours()
								+ ":" + d.getMinutes() + ":"
								+ d.getSeconds());
				loadMenu($("#modal-data-large"));
			}
		});
	});
	
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
				$('#modal-form-large').modal('hide');
				loadData();
			}
		});
		console.log(dataForm);
	}
	
	// function search
	function search(){
			var item = $('#search').val();
			$.ajax({
				url : '${contextName}/api/menu/search/'+item,
				type : 'get',
				dataType : 'json',
				success : function(result){
					$('#list-data').empty();
					// buat munculin dropdown untuk edit dan delete
					$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.code +'</td>'+
						'<td>'+ item.title+'</td>'+
						'<td>'+ item.menuParent+'</td>'+
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
	
	// fungsi loadMenu
	function loadMenu($form, $selected){
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/menu/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				// empty data first
				$form.find("#menuParent").empty();
				$form.find("#menuParent").append('<option value="">-Choose Menu Parent-</option>');
				// looping data
				$.each(result, function(index, item){
					if ($selected==item.id) {
						$form.find("#menuParent").append('<option value="'+ item.id +'" selected="selected">'+ item.title +'</option>');
					} else {
						$form.find("#menuParent").append('<option value="'+ item.id +'">'+ item.title +'</option>');
					}
				
				});
			}
		});
	}
	
	// function memanggil untuk editData 
	function getDataLarge(dataId){
		// panggil API
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/menu/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data-large').find('#id').val(dataApi.id);
				$('#modal-data-large').find('#code').val(dataApi.code);
				$('#modal-data-large').find('#title').val(dataApi.title);
				$('#modal-data-large').find('#description').val(dataApi.description);
				$('#modal-data-large').find('#imageUrl').val(dataApi.imageUrl);
				$('#modal-data-large').find('#menuOrder').val(dataApi.menuOrder);
				$('#modal-data-large').find('#menuParent').val(dataApi.menuParent);
				$('#modal-data-large').find('#menuUrl').val(dataApi.menuUrl);
				$('#modal-data-large').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data-large').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data-large').find('#modifiedBy').val(dataApi.modifiedBy);
				$('#modal-data-large').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-data-large').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-data-large').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-data-large').find('#isDelete').val(dataApi.isDelete);
				loadMenu($("#modal-form-large"),dataApi.id);
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
				$('#modal-title-large').html("MENU");
				// mengisi content dengan variable result
				$('#modal-data-large').html(result);
				// menampilkan modal pop-up
				$('#modal-form-large').modal('show');
				$('#createdOn').val(
						d.getDate() + "-" + d.getMonth() + "-"
								+ d.getFullYear() + " " + d.getHours()
								+ ":" + d.getMinutes() + ":"
								+ d.getSeconds());
				loadMenu($("#modal-data-large"));
				//panggil method getDataSmall
				getDataLarge(vid);
			}
		});
	});
	
	// fungsi untuk meng-edit data
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
				$('#modal-form-large').modal('hide');
				// panggil method loadData, untuk melihat data baru
				loadData();
			}
		});
		
	}
	
	// fungsi mengambil data untuk di delete
	function getDataSmall(dataId){
		// panggil API
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/menu/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data-small').find('#id').val(dataApi.id);
				$('#modal-data-small').find('#code').val(dataApi.code);
				$('#modal-data-small').find('#title').val(dataApi.title);
				$('#modal-data-small').find('#description').val(dataApi.description);
				$('#modal-data-small').find('#imageUrl').val(dataApi.imageUrl);
				$('#modal-data-small').find('#menuOrder').val(dataApi.menuOrder);
				$('#modal-data-small').find('#menuParent').val(dataApi.menuParent);
				$('#modal-data-small').find('#menuUrl').val(dataApi.menuUrl);
				$('#modal-data-small').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data-small').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data-small').find('#modifiedBy').val(dataApi.modifiedBy);
				$('#modal-data-small').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-data-small').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-data-small').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-data-small').find('#isDelete').val(dataApi.isDelete);
				
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
				$("#modal-title-small").html("MENU");
				//mengisi content dengan variable result
				$("#modal-data-small").html(result);
				//menampilkan modal pop up
				$("#modal-form-small").modal('show');
				//panggil method
				getDataSmall(vid);
			}
		});
	});
	
	// method untuk delete data
	function deleteData($form){
		$('#isDelete').val('true');
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/menu/
			url : '${contextName}/api/menu/',
			type : 'put',
			// data type berupa JSON
			dataType : 'json',
			// mengirim parameter data
			data : JSON.stringify(dataForm),
			// mime type 
			contentType : 'application/json',
			success : function(result) {
				//menutup modal
				$("#modal-form-small").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
			}
		});
		console.log(dataForm);
	}
</script>