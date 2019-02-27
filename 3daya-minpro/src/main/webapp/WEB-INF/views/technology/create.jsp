<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- form mulai -->
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="tech[name]"
				placeholder="Name" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<textarea class="form-control" name="tech[notes]" placeholder="Notes"
				style="resize: none" />
		</div>
	</div>
		 
		<input type="hidden" class="form-control" name="tech[createdBy]" value="1" id="createdBy" /> 
		<input type="hidden" class="form-control" name="tech[createdOn]" value="2019-11-2" id="createdOn" />
		<input type="hidden" class="form-control" name="tech[isDelete]" value="false" id="isDelete" />

	<br>


	<hr width="80%" color="red">

	<br>
	<button type="button" class="btn btn-warning"
		style="position: relative; left: 435px;" onClick="addTrainer()" id="btn-trainer">+TRAINER</button>

	<div class="box-body">
		<table class="table">
			<thead>
				<tr>
					<th>NAME</th>
					<th class="col-md-1">#</th>
				</tr>
			</thead>
			<tbody id="list-train">
			</tbody>
		</table>
	</div>
	<br> <br>



	<div class="modal-footer">
		<button type="button" class="btn btn-warning"
			style="position: relative; right: 160px;" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-warning" style="position: relative; right: 35px;">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->

<script>
	$("#btn-trainer").click(function() {
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/technology/trainer',
			type : 'get',
			dataType : 'html',
			success : function(hasil) {
				//mengganti judul modal
				$("#modal-title1").html("TRAINER");
				//mengisi content dengan variable result
				$("#modal-datrain").html(hasil);
				//menampilkan modal pop up
				$("#modal-tech").modal('show');
				loadTrainer($("#modal-datrain"), 0);
				$('#createdOn').val(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());


			}
		});
	});

	// load data untuk choose trainer dropdown
	function loadTrainer($form, $selected) {
		$.ajax({
			// url ke api/trainer/
			url : '${contextName}/api/trainer/',
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(result) {
				// empty data first
				$form.find("#trainerId").empty();
				$form.find("#trainerId").append(
						'<option value="">-Choose Trainer-</option>');
				// looping data
				$.each(result, function(index, item) {
					if ($selected == item.id) {
						$form.find("#trainerId").append(
								'<option value="'+ item.id +'" selected="selected">'
										+ item.name + '</option>');
					} else {
						$form.find("#trainerId").append(
								'<option value="'+ item.id +'"> ' + item.name
										+ '</option>');
					}
				});
			}
		});
	}

	function addTrainer($tech) {
		var d = new Date($.now());
		var dataTrainer = $tech.serializeJSON();
		var dataRow = '<tr>'
				+ '<td>'
				+ '<input type="hidden" name="tt[][trainerId]" value="'+dataTrainer.trainerId+'" class="form-control trainerId"/>'
				+ '<input type="text" name="tt[][name]" value="'+ dataTrainer.name +'" class="form-control name"/>'
				+ '<input type="hidden" name="tt[][createdBy]" value="'+dataTrainer.createdBy+'" class="form-control createdBy"/>'
				+ '<input type="hidden" name="tt[][createdOn]" id="createdOn" value="'+d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()+'" class="form-control createdOn"/>'

				+ '<td><button type="button" class="btn btn-remove btn-sm btn-danger"><i class="fa fa-trash"></i></button></td>'
		'</td>' + '</tr>';
		// add data to list-detail
		$('#list-train').append(dataRow);
		// hide modal
		$("#modal-tech").modal('hide');

	}

	//remove button
	$('#list-datrain').on('click', '.btn-remove', function() {
		$(this).closest('tr').remove();
	});

	//ketika kita meng-klik combo-box product
	function getTrainerById(pId) {
		$.ajax({
			url : '${contextName}/api/trainer/' + pId,
			type : 'get',
			dataType : 'json',
			success : function(result) {
				$('#modal-train').find('#trainerId').val(result.trainerId);
				$('#modal-train').find('#trainerName').val(result.trainerName);
			}
		});
	}
</script>