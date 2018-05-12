<%-- 
    Document   : viewC
    Created on : Jan 10, 2018, 3:21:48 PM
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
                        String query="Select * from course where CID='"+n+"'";
                        //System.out.println(query);
                        ResultSet rs=st.executeQuery(query);
                        while(rs.next())
                        {
%>
    <div class="col-md-8 col-md-offset-4">
      <h1>Course Details :</h1>
      <form action="EditDAO" method="post"><input hidden type="text" name="about" value="EditCourse"/>
  <table class="table table-responsive table-bordered table-hover"> 
    <tbody>
      <tr>
        <td><strong>ID :</strong></td>
        <td><%=rs.getString(1)%><input hidden type="text" readonly name="id" value=<%=rs.getString(1)%>></td>
      </tr>
      <tr>
        <td><strong>Course Name :</strong></td>
        <td><input type="text"name="cName" value="<%=rs.getString(2)%>"></td>
      </tr>
      <tr>
        <td><strong>Fee :</strong></td>
        <td><input  type="text" name="fee" value="<%=rs.getString(3)%>"></td>
      </tr>
      <tr>
        <td><strong>Duration :</strong></td>
        <td><input  type="text" name="duration" value="<%=rs.getString(4)%>"></td>
      </tr>
      <tr>
        <td><strong>Description :</strong></td>
        <td><textarea class="form-control span5" name="description" id="desc" rows="5" placeholder="Write about the course......"><%=rs.getString(5)%></textarea></td>
      </tr><tr>
          <td><button type="reset" value="reset" name="r" class="btn btn-danger ">Reset</button></td>
          <td><button type="submit" value="save" name="fa" class="btn btn-success ">Save</button></td>
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