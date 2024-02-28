<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Sent</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-image: url('background-image.jpg'); /* Replace 'background-image.jpg' with your desired background image */
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            color: #333;
        }
        
        .reset-email-sent-container {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .message-box {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            max-width: 500px;
        }
        
        .message-box h2 {
            margin-top: 0;
        }
        
        .message-box p {
            margin-bottom: 20px;
        }
        
        .button {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="reset-email-sent-container">
        <div class="message-box">
            <h2>Password Reset Email Sent</h2>
            <p>An email with instructions to reset your password has been sent to your registered email address.</p>
            <p>Please check your email and follow the instructions provided. Note that the reset link is only valid for 2 minutes.</p>
            <a href="index.jsp" class="button">Back to Login</a>
        </div>
    </div>
</body>
</html>
