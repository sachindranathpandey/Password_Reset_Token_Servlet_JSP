<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
</head>
<body>
    <div class="login-container">
        <form class="login-form" action="updatePassword" method="post" id="reg_form">
            <h2>Reset Password</h2>
            <input type="password" name="password" placeholder="New Password" required>
            <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
             <input type="hidden" name="token" value="${token}">
            <button type="submit" id="submit_btn">Reset Password</button>
        	<div class="container text-center mb-2" id="loader"
			style="color: green; display: none">

			<i class="fa fa-refresh fa-spin" style="font-size: 24px"></i>
			<p>Please wait...</p>
		</div>
            <a href="login.html" class="login-link">Back to Login</a>
        </form>
    </div>
</body>

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
              		title: "Password successfully  Updated! Redirecting to login page",
              		showConfirmButton: false,
              		timer: 2000
					
              		}).then(function() {
              		    window.location = "index.jsp";
              		});
            	}else if(data.trim()=="failed"){
            		
            		Swal.fire({
              		  icon: "error",
              		  title: "Oops...",
              		  text: "Something went wrong! Password Updated Failed",
              		  
              		});
            	}else if(data.trim()=="Password Mismatch"){
            		
            		Swal.fire({
              		  icon: "error",
              		  title: "Oops...",
              		  text: "Password MIsmatch",
              		  
              		});
            	}else{
            		Swal.fire({
                		  icon: "error",
                		  title: "Oops...",
                		  text: "Couldn't Update",
                		  
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
</html>
