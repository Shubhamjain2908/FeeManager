/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.DTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Authenticator;

/**
 *
 * @author SHUBHAM
 */
public class AccountantRegistration extends HttpServlet 
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("AccountantLR.html");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String user=request.getParameter("user");
        String name=request.getParameter("name");
        String username=request.getParameter("username");
        String email=request.getParameter("email");
        String pno=request.getParameter("pno");
        String date=request.getParameter("date");
        String gen=request.getParameter("sex");
        String password=request.getParameter("password");
        String generatedPassword=null;
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
            generatedPassword = sb.toString();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        DTO faculty=new DTO();
        System.gc();
        faculty.setName(name);
        faculty.setUsername(username);
        faculty.setEmail(email);
        faculty.setPno(pno);
        faculty.setDate(date);
        faculty.setGen(gen);
        faculty.setPassword(generatedPassword);
        
        Authenticator Flogin=new Authenticator();
        System.gc();
        boolean isRegister=Flogin.isAccountantR(faculty);
        
        if(isRegister) 
        {
            //System.out.println("Registration Successfull...");
            HttpSession session=request.getSession(true);
            session.setAttribute("username", username);
            //response.sendRedirect("home.jsp");
            RequestDispatcher rd=request.getRequestDispatcher("AccHome.jsp");
            rd.forward(request, response);
        }
        else
        {
            response.sendRedirect("FirstP.jsp");
        }
    }
}
