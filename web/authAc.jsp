<%-- 
    Document   : authAc
    Created on : Jan 9, 2018, 8:53:00 PM
    Author     : SHUBHAM
--%>

<%@page import="db.DBConnector"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
		String n=request.getParameter("val");
		if(n.length()>0)
                {
                    try
                    {
                        Statement st=DBConnector.getStatement();
                        String query="Select * from accountant where username='"+n+"'";
                        //System.out.println(query);
                        ResultSet rs=st.executeQuery(query);
                        while(rs.next())
                        {
%>
    <div class="col-md-4 col-md-offset-4">
      <h1>Personal Details :</h1>
      <form action="ActivateAc" method="post">
  <table class="table table-responsive table-bordered table-hover"> 
    <tbody>
      <tr>
          <td><strong>Name :</strong></td>
        <td><%=rs.getString(1)%></td>
      </tr>
      <tr>
        <td><strong>ID :</strong></td>
        <td><%=rs.getString(2)%><input hidden type="text" readonly name="fid" value=<%=rs.getString(2)%>></td>
      </tr>
      <tr>
        <td><strong>Email :</strong></td>
        <td><%=rs.getString(3)%></td>
      </tr>
      <tr>
        <td><strong>Phone Number :</strong></td>
        <td><%=rs.getString(4)%></td>
      </tr>
      <tr>
        <td><strong>DOB :</strong></td>
        <td><%=rs.getString(5)%></td>
      </tr>
      <tr>
        <td><strong>Gender :</strong></td>
        <td><%=rs.getString(6)%></td>
      </tr>
      <tr>
          <td><button type="submit" value="deactive" name="fa" class="btn btn-danger ">DeActivate</button></td>
          <td><button type="submit" value="active" name="fa" class="btn btn-success ">Activate</button></td>
      </tr>
    </tbody>
  </table>
      </form>
      </div>
<%
                        }
                    }
                catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                }//end of if
%>