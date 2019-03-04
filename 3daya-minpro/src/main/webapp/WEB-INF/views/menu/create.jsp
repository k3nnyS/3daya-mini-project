<!-- Form Mulai -->
<form id="form-create" class="form-horizontal">
	<div class="box-body">
		<!-- Membagi 2 tampilan -->
		<div class="row">
			<!-- Baris pertama -->
			<div class="col-md-6">
			<!-- Code -->
				<!-- <div class="form-group">
					<label class="control-label col-md-2">Code</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="code" value="${KodeBaru}"  />
					</div>  
				</div> -->
				<!-- Code generate -->
				<input type="hidden" class="form-control" name="code" id="code" value="${KodeBaru}"/>  
				<!-- Title -->
				<div class="form-group">
					<label class="control-label col-md-1"></label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="title" id="title" placeholder="Title"/>
					</div>
				</div>
				<!-- Description -->
				<div class="form-group">
					<label class="control-label col-md-1"></label>
					<div class="col-md-10">
						<textarea   rows ="5" class="form-control" name="description" id="description" placeholder="Description" style="resize:none"/>
					</div>
				</div>
			</div>
			<!-- Pindah baris baru -->
			<div class="col-md-6">
				<!-- Image URL -->
				<div class="form-group">
					<label class="control-label col-md-1"></label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="imageUrl" id="imageUrl" placeholder="Image URL"/>
					</div>
				</div>
				<!-- Menu Order -->
				<div class="form-group">
					<label class="control-label col-md-1"></label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="menuOrder" id="menuOrder" placeholder="Menu Order"/>
					</div>
				</div>
				<!-- Menu Parent -->
				<div class="form-group">
					<label class="control-label col-md-1"></label>
					<div class="col-md-10">
						<select name="menuParent" id="menuParent" class = "form-control">
							<option value = "" >-Choose Menu Parent-</option>
						</select>
					</div>
				</div>
				<!-- Menu URL -->
				<div class="form-group">
					<label class="control-label col-md-1"></label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="menuUrl" id="menuUrl" placeholder="Menu URL"/>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-warning" 
			style = "position:relative;right:160px;top:2px;" 
			data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="addData($('#form-create'))"
			style = "position:relative;right:35px;top:2px;"
			class="btn btn-warning">SAVE</button>
	</div>
</form>