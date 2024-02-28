<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>

<link rel="stylesheet" href="css/style.css">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>


	<div class="login-container">
		<h2>Login</h2>
		<form id="reg_form" method="post" action="login">
			<div class="form-group">
				<label for="username">Username:</label> <input type="text"
					id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required>
			</div>
			<button type="submit" id="submit_btn">Login</button>
		</form>
		<div class="forgot-password" id="forgetpass">
			<a href="forgotPassword.jsp">Forgot Password?</a>
		</div>

		<div class="container text-center mb-2" id="loader"
			style="color: green; display: none">

			<i class="fa fa-refresh fa-spin" style="font-size: 24px"></i>
			<p>Please wait...</p>
		</div>
	</div>



	<script type="text/javascript">
    var frm = $('#reg_form');
    $("#loader").hide();
    $("#submit_btn").show();
    frm.submit(function (e) {

        e.preventDefault();
       
        
        $("#submit-btn").hide();
        $("#loader").show();
        $("#forgetpass").hide();

        $.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function (data) {
             console.log("ds");
                $("#submit-btn").show();
            	$("#loader").hide();
            	 $("#forgetpass").show();
            	if(data.trim()=='success'){
            		
            		
            		
            		Swal.fire({
              	  	position: "center",
              		icon: "success",
              		title: "Login Successfully! Redirecting you to Dashboard",
              		showConfirmButton: false,
              		timer: 2000
					
              		}).then(function() {
              		    window.location = "password_reset_success.jsp";
              		});
            	}else if(data.trim()=="terms"){
            		
            		Swal.fire({
              		  icon: "error",
              		  title: "Oops...",
              		  text: "Please check t&c",
              		  
              		});
            	}else if(data.trim()=="already_registered"){
            		
            		Swal.fire({
              		  icon: "error",
              		  title: "Oops...",
              		  text: "This email is already registered",
              		  
              		});
            	}else{
            		Swal.fire({
                		  icon: "error",
                		  title: "Oops...",
                		  text: "Opps! Registration Faild",
                		  
                		});
            	}
            	
               
            },
            error: function (data) {
            	console.log(data);
                $("#submit-btn").show();
            	$("#loader").hide();
            	
                
            },
            
           
        });
        
        
    });
    
   
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
