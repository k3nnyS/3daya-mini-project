<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">TRAINER</h3>
		<div class="box-tools">
			<button type="button" id="btn-add" class="btn btn-primary btn-sm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<form>
		<input class="margin col-md-2" type="text" placeholder="Search by Name" required>	
	</form>
	<div class="box-body">
		<table class="table">
			<thead>
				<tr>
					<th>NAME</th>
					<th>OPSI</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>		
	</div>
</div>

<div class="modal" id="modal-trainer">
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
	// method yang pertama kali dipanggil saat page di load
	$(function(){
		// memanggil method loadData;
		loadData();
	});
	
	//ketika button add di click
	$("#btn-add").click(function(){
		$.ajax({
			url:'${contextName}/trainer/create',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("TRAINER");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-trainer").modal('show');
			}
		});
	});

	//method loadData
	function loadData(){
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/trainer/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				//kosong data di table
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.name+'</td>'+
						'<td class="col-md-1">'+
						'<button type="button" class="btn btn-edit btn-warning btn-sm" value="'+ item.id +'"><i class="fa fa-edit"></i></button> '+
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
	
	// function get data 
	function getData(dataId){
		// panggil API
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/trainer/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#notes').val(dataApi.notes);
				
				console.log(dataApi);
			}
		});
	}
	
	//btn-delete di click
	$('#list-data').on('click','.btn-delete', function(){
		var vid = $(this).val();
		$.ajax({
			url:'${contextName}/trainer/delete',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("DELETE");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-trainer").modal('show');
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
			url:'${contextName}/api/trainer/'+vid,
			// method http di controller
			type:'delete',
			// data type berupa JSON
			dataType:'json',
			// jika sukses
			success : function(result){
				//menutup modal
				$("#modal-trainer").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
				console.log(result);
			}
		});
	}
	</script>