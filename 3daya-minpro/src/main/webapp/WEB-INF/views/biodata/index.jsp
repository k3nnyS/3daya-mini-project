<%request.setAttribute("contextName", request.getServletContext().getContextPath());%>

<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">List Biodata</h3>
		<!--  -->
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
					<th>Name</th>
					<th>Majors</th>
					<th>GPA</th>
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
				<h3 class="box-title" id="modal-title">Tambah Biodata</h3>
			</div>
			<div class="box-body" id="modal-data"></div>
		</div>
	</div>
</div>
<script>
//method yang pertama kali dipanggil saat page load
$(function() {
	loadData();
});

$('#btn-add').click(function() {
	var d = new Date($.now());
	$.ajax({
		url : '${contextName}/biodata/create',
		type : 'get',
		dataType : 'html',
		success : function(result) {
			$('modal-title').html("Tambah Biodata");
			$('#modal-data').html(result);
			$('#modal-form').modal('show');
			$('#createdOn').val(
					d.getDate() + "-" + d.getMonth() + "-"
					+ d.getFullYear() + " " + d.getHours()
					+ ":" + d.getMinutes() + ":"
					+ d.getSeconds()	
			);
		}
	});
});
// fungsi load semua data
function loadData() {
	$.ajax({
		url : '${contextName}/api/biodata/list',
		type : 'get',
		dataType : 'json',
		success : function(result) {
			$('#list-data').empty();
			$.each(result, function(index, item){
				if(item.isDelete == false){
					var dataRow ='<tr>'+
					'<td>'+ item.name+'</td>'+
					'<td>'+ item.majors+'</td>'+
					'<td>'+ item.gpa+'</td>'+
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
				
				$('#list-data').append(dataRow);
				}
			});
			console.log(result);
		}
	});
}

function search(){
	var item = $('#search').val();
	$.ajax({
		url : '${contextName}/api/biodata/search/'+ item,
		type : 'get',
		dataType : 'json',
		success : function(result) {
			$('#list-data').empty();
			$.each(result, function(index, item){
				if(item.isDelete == false){
				var dataRow ='<tr>'+
				'<td>'+ item.name+'</td>'+
				'<td>'+ item.majors+'</td>'+
				'<td>'+ item.gpa+'</td>'+
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
				
				$('#list-data').append(dataRow);
				}
			});
			console.log(result);
		}
	});
}
function addData($bio){
	var dataForm = getFormData($bio);
	$.ajax({
		url : '${contextName}/api/biodata/',
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
//proses delete

//mengambil data saat ingin delete data
function getDataDelete(dataId){
	var d = new Date($.now());
	$.ajax({
		url : '${contextName}/api/biodata/'+ dataId,
		type : 'get',
		dataType : 'json',
		success : function(dataApi) {
		$('#modal-data').find('#id').val(dataApi.id);
		$('#modal-data').find('#name').val(dataApi.name);
		$('#modal-data').find('#gender').val(dataApi.gender);
		$('#modal-data').find('#lastEducation').val(dataApi.lastEducation); 
		$('#modal-data').find('#graduationYear').val(dataApi.graduationYear);
		$('#modal-data').find('#educationalLevel').val(dataApi.educationalLevel);
		$('#modal-data').find('#majors').val(dataApi.majors);
		$('#modal-data').find('#gpa').val(dataApi.gpa);
		$('#modal-data').find('#bootcampTestType').val(dataApi.bootcampTestType);
		$('#modal-data').find('#iq').val(dataApi.iq);
		$('#modal-data').find('#du').val(dataApi.du);
		$('#modal-data').find('#arithmetic').val(dataApi.id);
		$('#modal-data').find('#nestedLogic').val(dataApi.nestedLogic);
		$('#modal-data').find('#joinTable').val(dataApi.joinTable);
		$('#modal-data').find('#tro').val(dataApi.tro);
		$('#modal-data').find('#notes').val(dataApi.notes);
		$('#modal-data').find('#interviewer').val(dataApi.interviewer);
		$('#modal-data').find('#createdBy').val(dataApi.createdBy);
		$('#modal-data').find('#createdOn').val(dataApi.createdOn);
		$('#modal-data').find('#modifiedBy').val(dataApi.modifiedBy);
		$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
		$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
		$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
		$('#modal-data').find('#isDelete').val(dataApi.isDelete);
		
		$('#deletedOn').val(
				d.getDate() + "-" + (d.getMonth()+1) + "-"
						+ d.getFullYear() + " " + d.getHours()
						+ ":" + d.getMinutes() + ":"
						+ d.getSeconds());
		
		console.log(dataApi);
		}
	});
}

$('#list-data').on('click', '#btn-delete', function() {
	var vid = $(this).val();
	$.ajax({
		url : '${contextName}/biodata/delete',
		type : 'get',
		dataType : 'html',
		success : function(result) {
			$('#modal-title').html('Hapus Biodata');
			$('#modal-data').html(result);
			$('#modal-form').modal('show');
			getDataDelete(vid);
		}
	});
});

function deleteData($form){
	$('#isDelete').val('true');
	var dataForm = getFormData($form);
	$.ajax({
		url : '${contextName}/api/biodata/',
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
//akhir proses delete

//mengambil data untuk edit
function getDataEdit(dataId){
	var d = new Date($.now());
	$.ajax({
		url : '${contextName}/api/biodata/'+ dataId,
		type : 'get',
		dataType : 'json',
		success : function(dataApi) {
		$('#modal-data').find('#id').val(dataApi.id);
		$('#modal-data').find('#name').val(dataApi.name);
		$('#modal-data').find('#gender').val(dataApi.gender);
		$('#modal-data').find('#lastEducation').val(dataApi.lastEducationl); 
		$('#modal-data').find('#graduationYear').val(dataApi.graduationYear);
		$('#modal-data').find('#educationalLevel').val(dataApi.educationalLevel);
		$('#modal-data').find('#majors').val(dataApi.majors);
		$('#modal-data').find('#gpa').val(dataApi.gpa);
		$('#modal-data').find('#bootcampTestType').val(dataApi.bootcampTestType);
		$('#modal-data').find('#iq').val(dataApi.iq);
		$('#modal-data').find('#du').val(dataApi.du);
		$('#modal-data').find('#arithmetic').val(dataApi.id);
		$('#modal-data').find('#nestedLogic').val(dataApi.nestedLogic);
		$('#modal-data').find('#joinTable').val(dataApi.joinTable);
		$('#modal-data').find('#tro').val(dataApi.tro);
		$('#modal-data').find('#notes').val(dataApi.notes);
		$('#modal-data').find('#interviewer').val(dataApi.interviewer);
		$('#modal-data').find('#createdBy').val(dataApi.createdBy);
		$('#modal-data').find('#createdOn').val(dataApi.createdOn);
		$('#modal-data').find('#modifiedBy').val(dataApi.modifiedBy);
		$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
		$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
		$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
		$('#modal-data').find('#isDelete').val(dataApi.isDelete);
		
		$('#deletedOn').val(
				d.getDate() + "-" + (d.getMonth()+1) + "-"
						+ d.getFullYear() + " " + d.getHours()
						+ ":" + d.getMinutes() + ":"
						+ d.getSeconds());
		
		console.log(dataApi);
		}
	});
}
</script>