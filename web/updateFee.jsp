<%-- 
    Document   : updateFee
    Created on : Jan 11, 2018, 12:26:00 AM
    Author     : SHUBHAM
--%>

<%@page import="db.DBConnector"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<div class="container-fluid">
    <form action="EditDAO" method="post">
<div class="form-group">
        <select class="form-control" name="course" required>
            <option value="">--Select Course--</option>
<%
		String n=request.getParameter("em");
                String Sname="";
		if(n.length()>0)
                {
                    try
                    {
                        Statement st=DBConnector.getStatement();
                        String query="Select course,fee,name from student where username='"+n+"'";
                        //System.out.println(query);
                        ResultSet rs=st.executeQuery(query);
                        while(rs.next())
                        {   Sname=rs.getString(3);
%>      
            <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%> :  Rs. <%=rs.getString(2)%></option>
<%
                        }
                    }
                catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                }//end of if

%>
        </select>
    </div>
        <br><br>
        <div class="col-md-4 col-md-offset-5">
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Update</button>
        </div>
        <input hidden type="text" name="about" value="UpdateFee"/>
        <input hidden type="text" name="username" value="<%=n%>"/>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
        
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Update Fee</h4>
      </div>
        
      <div class="modal-body">
          <table class="table table-striped table-hover">
              <tbody>
                  <tr>
                      <td>Name :</td>
                      <td><%=Sname%></td>
                  </tr>
                  <tr>
                      <td>Recieved :</td>
                      <td><input type="number" name="paid" class="form-control" placeholder="Fee Paid (in Rs)"/></td>
                  </tr>
                  <tr>
                      <td><button type="reset" value="res" name="res" class="btn btn-info "><span class="glyphicon glyphicon-adjust"></span> Reset</button></td>
                      <td><button type="submit" value="res" name="sub" class="btn btn-success "><span class="glyphicon glyphicon-edit"></span> Submit</button></td>
                  </tr>
              </tbody>
          </table>
      </div>
        
      <div class="modal-footer">
          <button type="button" class="btn btn-default btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-cloud"></span> Close</button>
      </div>
        
    </div>

  </div>
</div>
</form>
</div>