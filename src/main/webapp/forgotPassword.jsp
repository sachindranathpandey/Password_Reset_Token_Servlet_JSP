<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link rel="stylesheet" href="css/forgot.css">
    <link rel="stylesheet" href="styles.css">
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
    <div class="reset-password-container">
        <form class="reset-password-form" action="forgotPassword" method="post" id="reg_form">
            <h2>Recover Password</h2>
            <input type="email" name="email" placeholder="Email" required>
            <button type="submit" id="submit_btn">Recover</button>
            <div class="container text-center mb-2" id="loader"
			style="color: green; display: none">

			<i class="fa fa-refresh fa-spin" style="font-size: 24px"></i>
			<p>Please wait...</p>
		</div>
            <a href="index.jsp" class="login-link">Back to Login</a>
        </form>
    </div>
    
    <script type="text/javascript">
    var frm = $('#reg_form');
    $("#loader").hide();
    $("#submit_btn").show();
    frm.submit(function (e) {
	
        e.preventDefault();
       
        
        $("#submit-btn").hide();
        $("#loader").show();
       

        $.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function (data) {
             
                $("#submit-btn").show();
            	$("#loader").hide();
            	
            	if(data.trim()=='success'){
            	
            		Swal.fire({
              	  	position: "center",
              		icon: "success",
              		title: "Email sent successfully on your registered email address",
              		showConfirmButton: false,
              		timer: 2000
					
              		}).then(function() {
              		    window.location = "password_reset_info.jsp";
              		});
            	
            	}else{
            		Swal.fire({
                		  icon: "error",
                		  title: "Oops...",
                		  text: "Opps! Something went wrong. Couldn't sent an email",
                		  
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
