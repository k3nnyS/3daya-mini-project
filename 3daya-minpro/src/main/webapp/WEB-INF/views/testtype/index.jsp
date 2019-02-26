<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>

<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">TEST TYPE</h3>
	</div>
	
	<div class="box-header col-md-12">
			<input type="text" name="search" id="search"
				placeholder="Search by username" />
			<button class="margin col-md-0.5 btn btn-warning btn-xm"
				onClick="search()">
				<i class="fa fa-circle-o"></i>
			</button>
			<div class="box-tools col-md-1">
				<button type="button" id="btn-add"
					class="margin col-md-0.5 btn btn-warning btn-m">
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

<div class="modal" id="modal-form">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title"></h3>
			</div>
			<div class="box-body" id="modal-data">
				
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	// memanggil method load data
	loadData();
});

//ketika button add di click
$("#btn-add").click(function(){
	var d = new Date($.now());
	$.ajax({
		url:'${contextName}/testtype/create',
		type:'get',
		dataType:'html',
		success : function(result){
			//mengganti judul modal
			$("#modal-title").html("Add New Test Type");
			//mengisi content dengan variable result
			$("#modal-data").html(result);
			//menampilkan modal pop up
			$("#modal-form").modal('show');
			$('#createdOn').val(d.getDate() + "-" + (d.getMonth()+1) + "-"
					+ d.getFullYear() + " " + d.getHours()
					+ ":" + d.getMinutes() + ":"
					+ d.getSeconds())
		}
	});
});

//meload Data
function loadData(){
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/testtype',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				//kosong data di table
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.name +'</td>'+
						'<td>'+ item.createdBy+'</td>'+
						'<td class="col-md-1">'+
						'<div class="dropdown">'+
					'<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
				   	 '<ul class="dropdown-menu">'+
				   	'<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'+
			    	'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'+
				    '</ul>'+
				    '</div>'+						'</td>'+
						'</tr>';
					$("#list-data").append(dataRow);
				});
				// menampilkan data ke console => F12
				console.log(result);
			}
		});
	}
	
	//fungsi search data dari name
	function search(){
		var item = $('#search').val();
		$.ajax({
			url : '${contextName}/api/testtype/search/' + item,
			type : 'get',
			dataType : 'json',
			success : function(result) {
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.name +'</td>'+
						'<td>'+ item.createdBy+'</td>'+
						'<td class="col-md-1">'+
						'<div class="dropdown">'+
					'<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
				   	 '<ul class="dropdown-menu">'+
				   	'<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'+
			    	'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'+
				    '</ul>'+
				    '</div>'+						'</td>'+
						'</tr>';
					$("#list-data").append(dataRow);
				});
				console.log(result);
			}
		});
	}
	
	function addData($testtype){
		var dataForm = getFormData($testtype);
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/testtype/',
			type:'post',
			// data type berupa JSON
			dataType:'json',
			// mengirim parameter data
			data:JSON.stringify(dataForm),
			// mime type 
			contentType: 'application/json',
			success : function(result){
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
			}
		});
		console.log(dataForm);
	}
	
	function getData(dataId){
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/testtype/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#notes').val(dataApi.notes);
				$('#modal-data').find('#typeOfAnswer').val(dataApi.typeOfAnswer);
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
	
	
	// proses edit
	$('#list-data').on('click', '#btn-edit', function() {
		var vid = $(this).val();
		$.ajax({
			url: '${contextName}/testtype/edit',
			type: 'get',
			dataType: 'html',
			success : function(result) {
				$('#modal-title').html("Edit Data Test Type");
				$('#modal-data').html(result);
				$('#modal-form').modal('show');
				getData(vid);
			}
		});
	});
	
	function editData($form) {
		var dataForm = getFormData($form);
		$.ajax({
			url : '${contextName}/api/testtype',
			type : 'put',
			dataType : 'json',
			data : JSON.stringify(dataForm),
			contentType : 'application/json',
			success : function(result) {
				$('#modal-form').modal('hide');
				loadData();
				}
			});
		console.log(dataForm);	
	}
	// akhir proses edit
	
	//proses delete
	$('#list-data').on('click', '#btn-delete', function() {
		var vid = $(this).val();
		$.ajax({
			url : '${contextName}/testtype/delete',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				$('#modal-title').html('Delete');
				$('#modal-data').html(result);
				$('#modal-form').modal('show');
				getData(vid);
			}
		});
	});
	
	function deleteData($form) {
		var vid = $form.find("#id").val();
		
		$.ajax({
			url : '${contextName}/api/testtype/' + vid,
			type : 'delete',
			dataType : 'json',
			success : function(result) {
				$('#modal-form').modal('hide');
				loadData();
				console.log(result);
			}
		});
	}
	// akhir proses delete
</script>