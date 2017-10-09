    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.16/b-1.4.2/b-flash-1.4.2/b-html5-1.4.2/r-2.2.0/datatables.min.js"></script>
	
	<script>
	$().ready(function(){
	
		
			
		$('#frEditForm').validate({
			rules:{
				mName:"required",
				mPhone:{
					required:true,
					minlength:10,
					maxlength:10
				},
				mEmail:{
					required:true,
					email:true
				},
				mAddress:"required",
				
			},
			messages:{
				mName:"Enter Friend's name.",
				mPhone:{
					required:"Enter phone Number.",
					minlength:"Enter atleast 10 digit."
				},
				mEmail:{
					required:"Enter Email.",
					email:"Enter valid email."
				},
				mAddress:"Enter Address."
			}
		});
		
		/*
		
		$('#frEditForm').validate({
			rules:{
				mName:"required",
				mPhone:{
					required:true,
					minlength:10,
					maxlength:10
				},
				mEmail:{
					required:true,
					email:true
				},
				mAddress:"required",
				
			},
			messages:{
				mName:"Enter Friend's name.",
				mPhone:{
					required:"Enter phone Number.",
					minlength:"Enter atleast 10 digit."
				},
				mEmail:{
					required:"Enter Email.",
					email:"Enter valid email."
				},
				mAddress:"Enter Address."
			}
		});
		*/
		viewall();	
	});	
	
	function importFr(){
		var formData = new FormData();
		jQuery.each(jQuery('#file1')[0].files, function(i, file) {
		    formData.append('file-'+i, file);
		});
		if ($('#file1').get(0).files.length === 0) {
		    console.log("No files selected.");
		    //alert("No files selected.");
		    $('#msg').show();
		    $('#successMsg').text("No File Selected");
         ev.preventDefault();
		}
		else {
         $(this).unbind('submit').submit()
		$.ajax({
	        url: "../Import",
	        type: 'POST',
	        data: formData,
	        async: false,
	        success: function (data) {
	        	$('#frTable').DataTable().ajax.reload();
	        	
	        	if(data=="only xml file supported"){
	        		//alert(data)
	        		$('#msg').show();
		        	$('#msg').text("only xml file supported");
		        	$('#msg').delay(1000).fadeOut(1000);
	        	}
	        		else{
	        			$('#msg').show();
		        	document.getElementById("msg").innerHTML=data+" Records inserted";
		        	$('#msg').delay(1000).fadeOut(1000);
	            //alert(data+" Records inserted")
	        		}
	        },
	        cache: false,
	        contentType: false,
	        processData: false
	    });
	    return false;
		}		
	}
	
	function addFr(){
		var gender = document.querySelector('input[name = "mGender"]:checked').value;		
		$.post("../CRUD", {
			name : $("#mName").val(),
			phone : $("#mPhone").val(),
			email : $("#mEmail").val(),
			address : $("#mAddress").val(),				
			gender : gender,
			mstatus : $("#mStatus").val(),
			dob : $("#mDob").val(),
			act : $("#addact").val()
		}, doAdd);
	}
	function doAdd(reponse){
		$('#myModal').modal('hide');
		clearFr();
		$('#frTable').DataTable().ajax.reload();
	}
		
	 function clearFr()
	    {
	        $("#mId").val("");
	        $("#mName").val("");
	        $("#mPhone").val("");
	        $("#mEmail").val("");
	        $("#mAddress").val("");
	        //$('input[name=mGender]').val("");
	        //$("#mGender").val("");
	        $("#mStatus").val("");
	        $("#mDob").val("");
	        
	    }
	 function addMd(){
		 clearFr();
		 $("#showBtn").html("");
		 var str='<input type="button" style="float: right;" onclick="addFr()" class="btn btn-primary" id="btnAdd" value="Add Friend">'
			 $("#showBtn").html(str);
	 }
	
	function viewall() {		
			var act = $("#viewallact").val();		
			$('#frTable').DataTable({
								responsive: true,								
								dom: 'Bfrtip',
        						buttons: [
        						          	{
        						         	extend: 'excel',
        						          	title : null,
        						          	exportOptions:{
        						        	columns : [1,2,3,4,5,6],
        						          	}       						          
        						          	}       						                  						               						          
        						          ],        						
								ajax : {
										url : "../CRUD",
										data : {'act' : act},
										dataSrc : 'data'
										},
								columns : [{
											orderable: false,
											sortable:false,
											data : "id",
											'render' : function(data, type,full, meta) {
														return '<input type="checkbox" id="options" name="options" value="'+data+'">';
														}
											},
										{data : "name"},
										{data : "phone"},
										{data : "email"},
										{data : "address"},
										{data : "gender"},
										{data : "mstatus"},
										{data : "dob"},
										{orderable: false,
										 sortable:false,
										 data : "id",
											    "render" : function(data, type,row, meta) {
												return '<a  href="javascript:showModal('+ data +')">Edit</a>';
														}
										 }
								]
							});
		                 }

		function showModal(i) {
			$("#myModal").modal('show');	
			$("#showBtn").html("");
			var str = '<button type="button" id="updatebtn" class="btn btn-primary" onClick="updateFr()">Update Friend</button>';
	        $("#showBtn").html(str);
	        
			$.get('../CRUD', {'frId' : i,'act' : $("#showact").val()}, function(data) {
				if (data) {
					myObj = JSON.parse(data);
					document.getElementById('mId').value = i;
					var gender = myObj.gender;
					var mstatus = myObj.mstatus;
					$('#mName').val(myObj.name);
					$('#mPhone').val(myObj.phone);
					$('#mEmail').val(myObj.email);
					$('#mAddress').val(myObj.address);
					if (gender == "male") {
						$('#mGenderM').prop('checked', true);
					} else if (gender == "female") {
						$('#mGenderF').prop('checked', true);
					}
					if (mstatus == "unmarried")
						$('.mStatus option:eq(2)').prop('selected', true)
					else if (mstatus == "married")
						$('.mStatus option:eq(1)').prop('selected', true)
					$('#mDob').val(myObj.dob);
				}
			});
		}

		function updateFr() {
			
			
			var gender = document.querySelector('input[name = "mGender"]:checked').value;
			$.post("../CRUD", {
				frId : $("#mId").val(),
				name : $("#mName").val(),
				phone : $("#mPhone").val(),
				email : $("#mEmail").val(),
				address : $("#mAddress").val(),						
				gender : gender,
				mstatus : $("#mStatus").val(),
				dob : $("#mDob").val(),
				act : $("#updateact").val()
			}, doUpdate);
		}
		function doUpdate(response) {
			
			if(response){
			$('#myModal').modal('hide');
			$('#frTable').DataTable().ajax.reload();	
			$("#showBtn").html("");
            var str = '<button type="button" id="addbtn" class="btn btn-primary" onclick="addFr()">Add Friend</button>';
            $("#showBtn").html(str);
            clearFr();
			}
		}
		function deleteFr() {

				var checked1=[]
				$("input[name='options']:checked").each(function (){
				    checked1.push(parseInt($(this).val()));
				});
				var myObj = JSON.stringify(checked1);				
				$.post("../CRUD", {
					frIdDl : myObj,
					act : $("#deleteact").val()
				}, doDelete);
		}
		function doDelete(response) {
			$('#frTable').DataTable().ajax.reload();
		}
		

	
	</script>
	
	
