package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/updatePassword")
public class UpdatePasswordServlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String token=request.getParameter("token");
      
        System.out.println("token from url" + token);
        // check token & validity of reset link for 2 minutes
       
        PrintWriter out = response.getWriter();
       
        
        if (password.equals(confirmPassword)) {
            // Update password in the database for the user associated with the token
            boolean flag = updatePasswordForTokenUser(token, password);
            if(flag) {
            	out.print("success");
            }else{
            	out.print("failed");
            }
            // Redirect to login page or inform the user that the password has been reset
            //response.sendRedirect("password_reset_success.jsp");
        } else {
            // Passwords don't match, display an error message
            out.print("Password Mismatch");
        }
    }
    
    private boolean updatePasswordForTokenUser(String token, String newPassword) {
        // Update the password in the database for the user associated with the token
    	
    	return EmailDao.updateUserPassword(token, newPassword);
    }
}

