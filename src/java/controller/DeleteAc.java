/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.DTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Authenticator;

/**
 *
 * @author SHUBHAM
 */
public class DeleteAc extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("adminHome.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String del=request.getParameter("user");
        
        if(del.equals("delAcc"))
        {
        String []student=request.getParameterValues("deleteAc");
        for(int i=0;i<student.length;i++)
            {
		String st = student[i]; 
                
		DTO stud = new DTO();
                System.gc();
		stud.setUsername(st);
                
		Authenticator mgr = new Authenticator();
                System.gc();
		boolean s=mgr.deleteAccountant(stud);
                if(s)
                {
                    System.out.println("Deleted Successfully...");
                }
            } 
            response.sendRedirect("AdminHome.jsp");
        }
        
        if(del.equals("delStu"))
        {
        String []student=request.getParameterValues("deleteStt");
        for(int i=0;i<student.length;i++)
            {
		String st = student[i]; 
                
		DTO stud = new DTO();
                System.gc();
		stud.setUsername(st);
                
		Authenticator mgr = new Authenticator();
                System.gc();
		boolean s=mgr.deleteStudent(stud);
                if(s)
                {
                    System.out.println("Deleted Successfully...");
                }
            } 
            response.sendRedirect("AdminHome.jsp");
        }
        
        if(del.equals("delC"))
        {
        String []student=request.getParameterValues("deleteC");
        for(int i=0;i<student.length;i++)
            {
		String st = student[i]; 
                
		DTO stud = new DTO();
                System.gc();
		stud.setUsername(st);
                
		Authenticator mgr = new Authenticator();
                System.gc();
		boolean s=mgr.deleteCourse(stud);
                if(s)
                {
                    System.out.println("Deleted Successfully...");
                }
            } 
            response.sendRedirect("AdminHome.jsp");
        }
    }
    
}
