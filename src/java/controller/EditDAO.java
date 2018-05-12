/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DBConnector;
import dto.DTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Authenticator;

/**
 *
 * @author SHUBHAM
 */
public class EditDAO extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("FirstP.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String about=request.getParameter("about");
        DTO d=new DTO();
        System.gc();
        Authenticator a=new Authenticator();
        System.gc();
        
        if(about.equals("AddCourse") || about.equals("EditCourse"))
        {
            String cName=request.getParameter("cName");
            String fee=request.getParameter("fee");
            String duration=request.getParameter("duration");
            String description=request.getParameter("description");
            
            d.setCourse(cName);
            d.setFee(fee);
            d.setDuration(duration);
            d.setDescription(description);
            
            //Add Course
            if(about.equals("AddCourse"))
            {
                boolean addC=a.isCourseAdd(d);
                if(addC)
                {
                    response.sendRedirect("AdminHome.jsp");
                }
            }
            
            //Edit Course
            if(about.equals("EditCourse"))
            {
                String id=request.getParameter("id");
                d.setId(id);
                boolean editC=a.isCourseEdit(d);
                if(editC)
                {
                    response.sendRedirect("AdminHome.jsp");
                }
            }
            
            else
            {
                //response.sendRedirect("AdminHome.jsp");
            }
        }
        
        if(about.equals("UpdateFee"))
        {
            int fee=0,paidB=0,due=0;
            String username=request.getParameter("username");
            String cName=request.getParameter("course");
            String paid=request.getParameter("paid");
            ///////////////////////////////////////////////////////////////////
            try
            {
                Statement st=DBConnector.getStatement();
                ResultSet rs=st.executeQuery("Select fee,paid,due from student where username='"+username+"' AND course='"+cName+"'");
                while(rs.next())
                {
                    fee=(Integer.parseInt(rs.getString(1)));
                    paidB=(Integer.parseInt(rs.getString(2)));
                    due=(Integer.parseInt(rs.getString(3)));
                }
            }
            catch(Exception e){}
            ///////////////////////////////////////////////////////////////////
            int pA= paidB +Integer.parseInt(paid);
            int dA= fee - pA;
            
            if(dA>=0)
            {
            d.setUsername(username);
            d.setCourse(cName);
            d.setPaid(Integer.toString(pA));
            d.setDue(Integer.toString(dA));
            boolean uf=a.isUpdateFee(d);
            
            if(uf)
            {
                System.out.println("Fee Updated...");
                response.sendRedirect("AccHome.jsp");
            }
            }
            else{
            System.out.println("You have already paid...");}
        }
        
    }
    
}