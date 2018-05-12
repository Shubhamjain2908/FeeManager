<%-- 
    Document   : feedback
    Created on : Jan 10, 2018, 12:39:48 AM
    Author     : SHUBHAM
--%>

<%@page import="db.DBConnector"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
		String email=request.getParameter("em");
                String comment=request.getParameter("com");
		if(email.length()>0)
                {
                    try
                    {
                        Statement st=DBConnector.getStatement();
                        String query="Insert into feedback values('"+email+"','"+comment+"')";
                        System.out.println(query);
                        int i=st.executeUpdate(query);
                        if(i>0)
                        {
                            %><h3>Submitted Successfully</h3><%
                        }
                    }
                catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                }//end of if
%>