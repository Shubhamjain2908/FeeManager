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
public class StudentChecker extends HttpServlet 
{
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  
    {
        response.sendRedirect("AccountantLR.html");
        System.out.println("Get");
    }
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String user=request.getParameter("user");
        System.out.println("Post");
        DTO faculty=new DTO();
        System.gc();
        Authenticator Flogin=new Authenticator();
        System.gc();
        
        if(user.equals("student"))
        {
        String name=request.getParameter("name");
        String username=request.getParameter("username");
        //String email=request.getParameter("email");
        String pno=request.getParameter("pno");
        //String date=request.getParameter("date");
        //String gen=request.getParameter("sex");
        String course=request.getParameter("course");
        String fee=request.getParameter("fee");
        String paid=request.getParameter("paid");
        String address=request.getParameter("address");
        //String pincode=request.getParameter("pincode");
        //String city=request.getParameter("city");
        String jd=request.getParameter("jd");
        String password="123456";
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
        
        
        faculty.setName(name);
        faculty.setUsername(username);
        //faculty.setEmail(email);
        faculty.setPno(pno);
        //faculty.setDate(date);
        //faculty.setGen(gen);
        faculty.setCourse(course);
        faculty.setFee(fee);
        faculty.setPaid(paid);
        faculty.setAddress(address);
        //faculty.setPincode(pincode);
        //faculty.setCity(city);
        faculty.setJoiningDate(jd);
        
        faculty.setPassword(generatedPassword);
        
        
        boolean isRegister=Flogin.isStudentR(faculty);
        
        if(isRegister) 
        {
            RequestDispatcher rd=request.getRequestDispatcher("AccHome.jsp");
            rd.forward(request, response);
        }
        else
        {
            response.sendRedirect("FirstP.jsp");
        }
        }
        
        if(user.equals("studentL"))
        {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
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
        
            faculty.setUsername(username);
            faculty.setPassword(generatedPassword);
            
            boolean isL=Flogin.isStudentL(faculty);
            if(isL)
            {
                HttpSession session = request.getSession(true);
                session.setAttribute("username", username);
                //System.out.println("Student login successfull..");
                RequestDispatcher rd=request.getRequestDispatcher("StudentHome.jsp");
                rd.forward(request, response);
            }
            else
            {
                response.sendRedirect("StudentL.jsp");
            }
        }
        
        if(user.equals("studentEdit"))
        {
            String username=request.getParameter("username");
            String email=request.getParameter("email");
            String pno=request.getParameter("pno");
            String dob=request.getParameter("dob");
            String address=request.getParameter("address");
            
            faculty.setUsername(username);
            faculty.setEmail(email);
            faculty.setPno(pno);
            faculty.setDate(dob);
            faculty.setAddress(address);
            
            boolean edit=Flogin.isStudentEdit(faculty);
            if(edit)
            {
                RequestDispatcher rd= request.getRequestDispatcher("StudentHome.jsp");
                rd.forward(request, response);
            }
            else
            {
                response.sendRedirect("index.jsp");
                System.out.println("Not updated");
            }
        }
        
        if(user.equals("addES"))
        {
            System.out.println("Add existed");
        String username=request.getParameter("username");
        String course=request.getParameter("course");
        String fee=request.getParameter("fee");
        String paid=request.getParameter("paid");
        String jd=request.getParameter("jd");
        
        faculty.setUsername(username);
        faculty.setCourse(course);
        faculty.setFee(fee);
        faculty.setPaid(paid);
        faculty.setJoiningDate(jd);
        
        boolean eS = Flogin.isExistedStudent(faculty);
        
            if(eS)
            {
                System.out.println("Student Updated...");
                response.sendRedirect("AccHome.jsp");
            }   
            else
            {
                System.out.println("Student cannot be enrolled...");
                response.sendRedirect("FirstP.jsp");
            }
        }
        
    }
}
