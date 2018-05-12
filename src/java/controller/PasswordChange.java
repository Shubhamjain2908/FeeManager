/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DBConnector;
import dto.DTO;
import java.io.IOException;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Authenticator;

/**
 *
 * @author SHUBHAM
 */
public class PasswordChange extends HttpServlet {

    Statement st=DBConnector.getStatement();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String newpassword=request.getParameter("newpassword");
        String generatedPassword=null;
        String pwdEncrypt=null;
        
        String user=request.getParameter("user");
        
        DTO faculty=new DTO();
        System.gc();
        faculty.setUsername(username);
        //faculty.setPassword(password);
        
        Authenticator Flogin=new Authenticator();
        System.gc();
        
        if(user.equals("acc") || user.equals("stu"))
        {
          try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(password.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            pwdEncrypt = sb.toString();
            faculty.setPassword(pwdEncrypt);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }  
        }
        else
        {
            faculty.setPassword(password);
        }
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(newpassword.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        
        
    if(user.equals("admin"))
    {
        boolean isLogin=Flogin.isAdminL(faculty);
        
        if(isLogin) 
        {
            try
            {
                Statement st=DBConnector.getStatement();
                String query="UPDATE admin SET password='"+newpassword+"' WHERE USERNAME='"+username+"'";
                int i=st.executeUpdate(query);
                if(i>0)
                {
                    System.out.println("Password Updated...");
                    //session.invalidate();
                    response.sendRedirect("FirstP.jsp");
                    //response.sendRedirect("facultyHome.jsp");
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
        }
        else
        {
            response.sendRedirect("AdminLogin.html");
        }
    }
    
    if(user.equals("acc"))
    {
        boolean isLogi=Flogin.isAccountantL(faculty);
        
        if(isLogi) 
        {
            try
            {
                Statement st=DBConnector.getStatement();
                String query="UPDATE accountant SET password='"+generatedPassword+"' WHERE USERNAME='"+username+"'";
                int i=st.executeUpdate(query);
                if(i>0)
                {
                    System.out.println("Password Updated...");
                    //session.invalidate();
                    response.sendRedirect("FirstP.jsp");
                    //response.sendRedirect("facultyHome.jsp");
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
        }
        else
        {System.out.println("failed");
            response.sendRedirect("AccountantLR.html");
        }
    }
    
    if(user.equals("stu"))
    {
        boolean isLog=Flogin.isStudentL(faculty);
        
        if(isLog) 
        {
            try
            {
                Statement st=DBConnector.getStatement();
                String query="UPDATE student SET password='"+generatedPassword+"' WHERE USERNAME='"+username+"'";
                int i=st.executeUpdate(query);
                if(i>0)
                {
                    System.out.println("Password Updated...");
                    //session.invalidate();
                    response.sendRedirect("FirstP.jsp");
                    //response.sendRedirect("facultyHome.jsp");
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
        }
        else
        {System.out.println("failed");
            response.sendRedirect("index.html");
        }
    }
    
    if(user.equals("adminA"))
    {
        try
        {
            String query="UPDATE accountant SET password='"+generatedPassword+"' WHERE username='"+username+"'";
            int i=st.executeUpdate(query);
            if(i>0)
            {
                System.out.println("Passwordd updated...");
                response.sendRedirect("AdminHome.jsp");
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
    
    if(user.equals("adminS"))
    {
        try
        {
            String query="UPDATE student SET password='"+generatedPassword+"' WHERE username='"+username+"'";
            int i=st.executeUpdate(query);
            if(i>0)
            {
                System.out.println("Passwordd updated...");
                response.sendRedirect("AdminHome.jsp");
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
    }    
}
