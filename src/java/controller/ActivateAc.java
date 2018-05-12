/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DBConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHUBHAM
 */
public class ActivateAc extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("FirstP.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        int a=1,d=0,i=0;
        String query;
        String facultyid=request.getParameter("fid");
        String operation=request.getParameter("fa");
        //System.out.println(facultyid+" "+operation);
        try
        {
            Statement st=DBConnector.getStatement();
            if(operation.equals("active"))
            {
                query="UPDATE accountant SET flag='"+a+"' WHERE username='"+facultyid+"'";
            }
            else
            {
                query="UPDATE accountant SET flag='"+d+"' WHERE username='"+facultyid+"'";
            }
            i=st.executeUpdate(query);
            if(i>0)
            {
                System.out.println("Successfully updated...");
                response.sendRedirect("AdminHome.jsp");
            }
            else
            {
                System.out.println("Failed...");
                response.sendRedirect("index.jsp");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
    
}