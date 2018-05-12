/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DBConnector;
import java.io.IOException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHUBHAM
 */
public class Feedback extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("FirstP.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String comment=request.getParameter("comment");
        String email=request.getParameter("email");
        try
        {
            Statement st=DBConnector.getStatement();
            String query="Insert into feedback values('"+email+"','"+comment+"')";
            System.out.println(query);
            int i=st.executeUpdate(query);
            if(i>0)
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