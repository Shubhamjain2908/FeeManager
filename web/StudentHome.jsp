<%-- 
    Document   : StudentHome
    Created on : Jan 12, 2018, 1:35:39 AM
    Author     : SHUBHAM
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Login</title>
    </head>
    <%
            Statement st=DBConnector.getStatement();
            ResultSet rs=null,rsC=null,rsE=null;
            String username=(String)session.getAttribute("username");
            if(username==null || username.trim().equals(""))
            {
                response.sendRedirect("StudentL.jsp");
            }
            String name="",email="",pno="",dob="",gender="",fee="",paid="",due="",address="",joiningdate="";
            ArrayList<String> c1=new ArrayList<String>();
            ArrayList<String> p1=new ArrayList<String>();
            ArrayList<String> d1=new ArrayList<String>();
            ArrayList<String> jd1=new ArrayList<String>();
            try
            {
                rs=st.executeQuery("Select * from student where username='"+username+"'");
                while(rs.next())
                {
                    name=rs.getString(1);
                    email=rs.getString(3);
                    pno=rs.getString(4);
                    dob=rs.getString(5);
                    gender=rs.getString(6);
                    c1.add(rs.getString(7));
                    fee=rs.getString(8);
                    //paid=rs.getString(9);
                    p1.add(rs.getString(9));
                    //due=rs.getString(10);
                    d1.add(rs.getString(10));
                    address=rs.getString(11);
                    //joiningdate=rs.getString(15);
                    jd1.add(rs.getString(15));
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
    %>
    <body>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="Ajax.js"></script>
        <script src="checkBox.js"></script>
        
        <%@include file="headerSt.jsp" %>
        
        <div class="container well">
            <div class="tab-content">
                
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
                    <li><a data-toggle="tab" href="#profile">PROFILE</a></li>
                    <li><a data-toggle="tab" href="#viewallcourse">View All Course</a></li>
                    <li><a data-toggle="tab" href="#enrolledcourse">Enrolled Courses</a></li>
                    <li><a data-toggle="tab" href="#feereciept">Fee Reciept</a></li>
                    <li><a data-toggle="tab" href="#changepassword">Change Password</a></li>
                </ul>
                
                <br>
                
                <div id="home" class="tab-pane fade in active">
                    <center><img src="images/st1.jpg" alt="Online Exam System" height="400px" width="950px"/>  </center>
                </div>
                
                <div id="profile" class="tab-pane fade">
                    <div class="col-md-5 col-md-offset-4">
                        <h1>Personal Details :</h1><br>
                    <table class="table table-responsive table-bordered table-hover"> 
                      <tbody>
                        <tr>
                            <td><strong>Name :</strong></td>
                          <td><%=name%></td>
                        </tr>
                        <tr>
                          <td><strong>Username :</strong></td>
                          <td><%=username%></td>
                        </tr>
                        <tr>
                          <td><strong>Email :</strong></td>
                          <td><%=email%></td>
                        </tr>
                        <tr>
                          <td><strong>Phone Number :</strong></td>
                          <td><%=pno%></td>
                        </tr>
                        <tr>
                          <td><strong>DOB :</strong></td>
                          <td><%=dob%></td>
                        </tr>
                        <tr>
                          <td><strong>Gender :</strong></td>
                          <td><%=gender%></td>
                        </tr>
                        <tr>
                          <td><strong>Address :</strong></td>
                          <td><%=address%></td>
                        </tr>
                      </tbody>
                    </table>
                        <a href="#" data-toggle="modal" data-target="#editModal">Edit your profile</a>
                    </div>
                </div>
                        
                <div id="viewallcourse" class="tab-pane fade">
                            <form action="" method="post">
                                <table class="table  table-responsive table-bordered table-hover">
                                  <tbody>
                                    <tr>
                                        <td><strong>Course ID</strong></td>
                                        <td><strong>Course Name</strong></td>
                                        <td><strong>Fee</strong></td>
                                        <td><strong>Duration</strong></td>
                                        <td><strong>Description</strong></td>
                                    </tr>
                                    <%
                                        try
                                        {
                                          rsC=st.executeQuery("Select * from course");
                                          while(rsC.next())
                                          {
                                    %>
                                    <tr>
                                        <td><%=rsC.getInt(1)%></td>
                                        <td><%=rsC.getString(2)%></td>
                                        <td><%=rsC.getString(3)%></td>
                                        <td><%=rsC.getString(4)%></td>
                                        <td><%=rsC.getString(5)%></td>
                                    </tr>
                                    <%
                                          }
                                        }
                                        catch(Exception e){}
                                    %>
                                  </tbody>
                                </table>
                            </form>
                </div>
                
                <div id="enrolledcourse" class="tab-pane fade"><br>
                    <div class="col-md-6 col-md-offset-3">
                        <h3>Enrolled course and Fee status</h3><br>
                        <table class="table table-responsive table-striped table-bordered">
                            <tbody>
                                <tr>
                                    <td><strong>Course Name</strong></td>
                                    <td><strong>Fee paid</strong></td>
                                    <td><strong>Fee Due</strong></td>
                                    <td><strong>Joining Date</strong></td>
                                </tr>
                                <%
                                for (int i = 0; i < c1.size(); i++) {
                                %>
                                <tr>
                                    <td><%=c1.get(i)%></td>
                                    <td><%=p1.get(i)%></td>
                                    <td><%=d1.get(i)%></td>
                                    <td><%=jd1.get(i)%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table> 
                    </div>
                </div>                  
                                  
                <div id="changepassword" class="tab-pane fade">
                    <div class="col-md-6 col-md-offset-3">
                    <form action="PasswordChange" method="post"> 
                <input hidden type="text" name="user" value="stu"/>
                    <table class="table table-responsive table-bordered table-hover"> 
                         <tbody>
                           <tr>
                             <td><strong>Name :</strong></td>
                             <td><%=username%><input hidden type="text" name="username" value="<%=username%>" readonly /></td>
                           </tr>
                           <tr>
                             <td><strong>Current Password :</strong></td>
                             <td><input type="password" name="password" placeholder="******" required/></td>
                           </tr>
                           <!--
                           <tr>
                             <td><strong>Retype Current Password :</strong></td>
                             <td><input type="password" name="retypepassword" placeholder="******" required /></td>
                           </tr>-->
                           <tr>
                             <td><strong>New Password :</strong></td>
                             <td><input type="password" name="newpassword" placeholder="******" required /></td>
                           </tr>
                           <tr>
                             <td><button type="reset" class="btn btn-primary " data-loading-text="Loading...">Reset</button></td>
                             <td><button type="submit" class="btn btn-primary btn-success" data-loading-text="Loading...">Submit</button></td>
                           </tr>
                         </tbody>
                       </table>
                    </form>
                 </div><br><br><br>
                </div>                  
                        
            </div>
        </div>
<!-------------------------------------------------------------------------------------------------->
<form action="StudentChecker" method="post">
    <!-- Modal --><input hidden type="text" name="user" value="studentEdit"/>
    <input hidden type="text" name="username" value="<%=username%>"/>
<div id="editModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
        
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit</h4>
      </div>
        
      <div class="modal-body">
          <table class="table table-striped table-hover">
              <tbody>
                  <tr>
                      <td>Name :</td>
                      <td><%=name%></td>
                  </tr>
                  <tr>
                      <td>Email :</td>
                      <td><input type="email" name="email" class="form-control" value="<%=email%>" placeholder="Email..."/></td>
                  </tr>
                  <tr>
                      <td>Mobile Number :</td>
                      <td><input type="number" name="pno" max="9999999999" class="form-control" value="<%=pno%>" placeholder="10 digit number"/></td>
                  </tr>
                  <tr>
                      <td>DOB :</td>
                      <td><input type="date" name="dob" class="form-control" value="<%=dob%>" placeholder="Date of Birth"/></td>
                  </tr>
                  <tr>
                      <td>Address :</td>
                      <td><textarea type="Address" name="address" class="form-control" placeholder="Full Address"><%=address%></textarea></td>
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
<!-------------------------------------------------------------------------------------------------->
    </body>
    
        <%@include file="footer.jsp" %>
</html>
