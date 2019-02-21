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

<div class="modal" id="modal-form">
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
$(function(){
	// memanggil method load data
	loadData();
});

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
			$("#modal-form").modal('show');
		}
	});
});

//meload Data
function loadData(){
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/test/',
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
							'<button type="button" class="btn btn-edit btn-warning btn-sm" value="'+ item.id +'"><i class="fa fa-edit"></i></button> '+
							'<button type="button" class="btn btn-detail btn-success btn-sm" value="'+ item.id +'"><i class="fa fa-eye"></i></button> '+
							'<button type="button" class="btn btn-delete btn-danger btn-sm" value="'+ item.id +'"><i class="fa fa-trash"></i></button> '+
						'</td>'+
						'</tr>';
					$("#list-data").append(dataRow);
				});
				// menampilkan data ke console => F12
				console.log(result);
			}
		});
	}
	
	function addData($test){
		var dataForm = getFormData($test);
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/test/',
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
			url:'${contextName}/api/test/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				
				console.log(dataApi);
			}
		});
	}

</script>