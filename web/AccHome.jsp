<%-- 
    Document   : AccHome
    Created on : Jan 9, 2018, 11:00:31 PM
    Author     : SHUBHAM
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Accountant</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <%
            Statement st=DBConnector.getStatement();
            ResultSet rs=null,rsC=null,rsCs=null,rsS=null,rsD=null,rsD1=null;
            String username=(String)session.getAttribute("username");
            if(username==null || username.trim().equals(""))
            {
                response.sendRedirect("AccountantLR.html");
            }
    %>
    <body>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="Ajax.js"></script>
        <script src="checkBox.js"></script>
        
        <%@include file="headerAc.jsp" %>
        
        <script>
            function a()
            {
                document.getElementById('pai').max=document.getElementById('pFee').value;
            }
            function aE()
            {
                document.getElementById('paiE').max=document.getElementById('pFeeE').value;
            }
        </script>
        <div class="container well">
            <div class="tab-content">
                
<!-------------------------------------------------------------------------------------------------->                
                
                <div id="home" class="tab-pane fade in active">
                    <center><img src="images/ac3.jpg" alt="Online Exam System" height="400px" width="950px"/>  </center>
                </div>

<!-------------------------------------------------------------------------------------------------->

                <div id="student" class="tab-pane fade">
                    <div class="tab-content">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#St">Student</a></li>
                        <li><a data-toggle="tab" href="#aSt">Add Student</a></li>
                        <li><a data-toggle="tab" href="#vSt">View Student</a></li>
                        <li><a data-toggle="tab" href="#updateFee">Update Fee</a></li>
                        <li><a data-toggle="tab" href="#dueFee">Due Fee</a></li>
                    </ul>
                    <br><br>
                    
                  <div class="tab-content">
                      
                    <div id="St" class="tab-pane fade in active">
                        <center><img src="images/st1.png" alt="Online Exam System" height="400px" width="400px"/>  </center>
                    </div>
                      
                    <div id="aSt" class="tab-pane fade"><br><br><br>
                        <div class="col-md-3 col-md-offset-4">
                        <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#addStudentN">New Registration</button>
                        </div>
                        <div class="col-md-3 col-md-offset-7">
                        <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#addStudent">Existing Student</button>
                        </div>
                    </div>
                      
                    <div id="vSt" class="tab-pane fade">
                        <form action="" method="post">
                                <table class="table  table-responsive table-bordered table-hover">
                                  <tbody>
                                    <tr>
                                        <td><strong>Name</strong></td>
                                        <td><strong>UserName</strong></td>
                                        <td><strong>Phone no</strong></td>
                                        <td><strong>Course</strong></td>
                                        <td><strong>Course Fee</strong></td>
                                        <td><strong>Fee Paid</strong></td>
                                        <td><strong>Address</strong></td>
                                        <td><strong>Joining Date</strong></td>
                                    </tr>
                                    <%
                                        try
                                        {
                                          rsS=st.executeQuery("Select * from student");
                                          while(rsS.next())
                                          {
                                    %>
                                    <tr>
                                        <td><%=rsS.getString(1)%></td>
                                        <td><%=rsS.getString(2)%></td>
                                        <td><%=rsS.getString(4)%></td>
                                        <td><%=rsS.getString(7)%></td>
                                        <td><%=rsS.getString(8)%></td>
                                        <td><%=rsS.getString(9)%></td>
                                        <td><%=rsS.getString(11)%></td>
                                        <td><%=rsS.getString(15)%></td>
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
                                  
                    <div id="updateFee" class="tab-pane fade">
                      <div class="row">  
                        <div class="col-md-8 col-md-offset-2">
                            <h3>Update Fee Record :</h3><br>
                            <form name="upFe" action="#" method="get">
                                <input type="text" name="facultyid" class="form-control" placeholder="Enter username or roll no of the student" onkeyup="updateFeeS()">
                            </form>
                            <br><br>
                            <div id="uFe">

                            </div>
                        </div>
                      </div>
                    </div>
                                  
                    <div id="dueFee" class="tab-pane fade">
                        <form action="" method="post">
                                <table class="table  table-responsive table-bordered table-hover">
                                  <tbody>
                                    <tr>
                                        <td><strong>Name</strong></td>
                                        <td><strong>UserName</strong></td>
                                        <td><strong>Phone no</strong></td>
                                        <td><strong>Email</strong></td>
                                        <td><strong>Course</strong></td>
                                        <td><strong>Due fee</strong></td>
                                        <td><strong>Address</strong></td>
                                    </tr>
                    <%
                        ArrayList<Integer> f=new ArrayList<Integer>();
                        ArrayList<String> s=new ArrayList<String>();
                        ArrayList<String> stu=new ArrayList<String>();
                        try
                        {
                            rsD=st.executeQuery("Select username,due from student");
                            while(rsD.next())
                            {
                                f.add(Integer.parseInt(rsD.getString(2)));
                                s.add(rsD.getString(1));
                            } 
                            for (int i = 0; i < f.size(); i++) {
                                    if( f.get(i) > 0 )
                                    {
                                        stu.add(s.get(i));
                                    }
                                }
                            for (int j = 0; j < stu.size(); j++) {
                                    rsD1=st.executeQuery("Select name,username,pno,email,course,due,address from student where username='"+stu.get(j)+"'");
                                    while(rsD1.next())
                                    {
                    %>
                                    <tr>
                                        <td><%=rsD1.getString(1)%></td>
                                        <td><%=rsD1.getString(2)%></td>
                                        <td><%=rsD1.getString(3)%></td>
                                        <td><%=rsD1.getString(4)%></td>
                                        <td><%=rsD1.getString(5)%></td>
                                        <td><%=rsD1.getString(6)%></td>
                                        <td><%=rsD1.getString(7)%></td>
                                    </tr>
                    <%                    
                                    }
                                }
                        }
                        catch(Exception e){}
                    %>  
                                  </tbody>
                                </table>
                        </form>
                    </div>
                  </div>
                </div>
                </div>

<!-------------------------------------------------------------------------------------------------->                
                
                <div id="course" class="tab-pane fade">
                    
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#CourseHome">Home</a></li>
                        <li><a data-toggle="tab" href="#viewC">View Course</a></li>
                    </ul><br>
                    
                    <div class="tab-content">
                        
                        <div id="CourseHome" class="tab-pane fade in active">
                            <center><img src="images/Adst.jpg" alt="Online Exam System" height="400px" width="950px"/>  </center>
                        </div>
                        
                        <div id="viewC" class="tab-pane fade">
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
                                  
                    </div>
                </div>
                
<!-------------------------------------------------------------------------------------------------->
                
                <div id="cp" class="tab-pane fade">
                    <div class="col-md-6 col-md-offset-3">
                    <form action="PasswordChange" method="post"> 
                <input hidden type="text" name="user" value="acc"/>
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
                           
<!-------------------------------------------------------------------------------------------------->
                           
            </div>
        </div>

<!-----------------------------------------Student Form--------------------------------------------------------->
                           
                           <!----------Modals---------->
            <div class="modal fade" id="addStudentN">
        <div class="modal-dialog ">
            <div class="modal-content">
<form role="form" action="StudentChecker" method="post"><input hidden name="user" value="student"/>
                <!-- header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title">Register </h3>
                </div>

                <!-- body (form) -->
                <div class="modal-body">
                    
                        <div class="form-group">
                            <input type="text" name="name" class="form-control" placeholder="Full Name" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="username" class="form-control" placeholder="User Name or Roll no." required>
                        </div>
                        <div class="form-group">
                            <input type="number" name="pno" class="form-control" placeholder="Phone number" required>
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="course" required>
                                <%
                                    try
                                    {
                                    rsCs=st.executeQuery("Select name,fee from course");
                                %>
                                <option value="">--Select Course--</option>
                                <%
                                    while(rsCs.next())
                                {
                                %>
                                <option value="<%=rsCs.getString(1)%>"><%=rsCs.getString(1)%> : ₹ <%=rsCs.getString(2)%></option>
                                <% 
                                }
                                    }
                                    catch(Exception e)
                                    {
                                    System.out.println(e);
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control" id="pFee" name="fee" required>
                                <%
                                    try
                                    {
                                    ResultSet rsCf=st.executeQuery("Select fee from course");
                                %>
                                <option value="">--Select Course Fee--</option>
                                <%
                                    while(rsCf.next())
                                {
                                %>
                                <option value="<%=rsCf.getString(1)%>">₹ <%=rsCf.getString(1)%></option>
                                <% 
                                }
                                    }
                                    catch(Exception e)
                                    {
                                    System.out.println(e);
                                    }
                                %>
                            </select>
                        </div>    
                        <div class="form-group">
                            <input type="number" min="0" max="20000" name="paid" id="pai" class="form-control" onkeyup="a()" placeholder="Fee Paid">
                        </div>
                        <div class="form-group">
                            <textarea type="Address" name="address" class="form-control" placeholder="Full Address"></textarea>
                        </div><!--
                        <div class="form-group">
                            <input type="number" name="pincode" class="form-control" placeholder="pincode">
                        </div>
                        <div class="form-group">
                            <input type="text" name="city" class="form-control" placeholder="city">
                        </div>-->
                        <div class="form-group">
                            <label for="jd"><span class="glyphicon glyphicon-eye-open"></span> Joining Date</label>
                            <input type="date" name="jd" class="form-control" placeholder="joining date">
                        </div>
                </div>

                <!-- button -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-block" >Submit</button>
                </div>
                    </form>

            </div>
        </div>
    </div>               
                           <!----------Modals---------->
                           
                           <!----------Modals---------->
            <div class="modal fade" id="addStudent">
        <div class="modal-dialog ">
            <div class="modal-content">
                <form role="form" name="exist" method="get"><input hidden name="user" value="studentExist"/>
                <!-- header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title">Add</h3>
                </div>

                <!-- body (form) -->
                <div class="modal-body">
                    
                        <div class="form-group">
                            <input type="text" name="username" class="form-control" placeholder="User Name or Roll no." onkeyup="studentExisted()">
                        </div>
                    
                        <div id="existingStu">
                            
                        </div>
                </div>

                <!-- button -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-cloud"></span> Close</button>
                </div>
                    </form>

            </div>
        </div>
    </div>
                            <!----------Modals---------->
<!-------------------------------------------------------------------------------------------------->
    </body>
    <%@include file="footer.jsp" %>
</html>
