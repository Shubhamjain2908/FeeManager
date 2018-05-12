<%-- 
    Document   : AdminHome
    Created on : Jan 9, 2018, 6:14:39 PM
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
        <title>Admin</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
    </head>
    <%
            Statement st=DBConnector.getStatement();
            ResultSet rs=null,rsC=null,rsS=null,rsD1=null,rsD=null;
            String username=(String)session.getAttribute("username");
            if(username==null || username.trim().equals(""))
            {
                response.sendRedirect("AdminLogin.html");
            }
    %>
    <body>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="Ajax.js"></script>
        <script src="checkBox.js"></script>
        
        <%@include file="headerA.jsp" %>
      <div class="container">  
        <div class="container well">
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <center><img src="images/admin1.jpg" alt="Online Exam System" height="400px" width="950px"/>  </center>
                </div>
                
<!------------------------------------------------------Accountant Section--------------------------->
                
                <div id="accountant" class="tab-pane fade">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#Acc">Accountant</a></li>
                        <li><a data-toggle="tab" href="#viewAc">View Accountant</a></li>
                        <li><a data-toggle="tab" href="#authAc">Authenticate Accountant </a></li>
                        <li><a data-toggle="tab" href="#cpAc">Change Password</a></li>
                    </ul><br>
                    <div class="tab-content">
                        <div id="Acc" class="tab-pane fade in active">
                           <center><img src="images/ac1.jpg" alt="Online Exam System" height="400px" width="950px"/>  </center>
                        </div> 
                        <div id="viewAc" class="tab-pane fade">
                            <h2>View Accountants</h2><br>
                         <div class="row">   
                          <div class="col-md-10 col-md-1">
                            <form action="DeleteAc" method="post"><input hidden type="text" name="user" value="delAcc"/>
                            <table class="table table-responsive table-bordered table-hover"  id="myTableAc">
                                <tbody>
                                    <tr>
                                        <td><strong>Name</strong></td>
                                        <td><strong>ID</strong></td>
                                        <td><strong>Mobile Number</strong></td>
                                        <td><strong>Email Address</strong></td>
                                        <td><strong>DOB</strong></td>
                                        <td><strong>Gender</strong></td>
                                        <td><strong>Account Status</strong></td>
                                        <td><strong>Delete</strong> <input type="checkbox" id="selectall"/></td>
                                    </tr>
                            <%  String f="";
                                try
                                {
                                    rs=st.executeQuery("Select * from accountant");
                                    while(rs.next())
                                    {
                                        if(rs.getInt(8)>0)
                                        {
                                            f="Active";
                                        }
                                        else
                                        {
                                            f="Deactive";
                                        }
                            %>       <tr>
                                        <td><%=rs.getString(1)%></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(6)%></td>
                                        <td><%=f%></td>
                                        <td><input type="checkbox" class="deleteAc" name="deleteAc" value=<%=rs.getString(2)%>></td>
                                    </tr>   
                            <%           
                                    }
                                }
                                catch(Exception e)
                                {
                                    System.out.println(e);
                                }
                            %>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><button type="submit" name="submit" class="btn btn-danger "><span class="glyphicon glyphicon-trash"></span> Delete</button></td>
                                    </tr>
                                </tbody>
                            </table>
                            </form>
                          </div>
                         </div>           
                        </div>
                        <div id="authAc" class="tab-pane fade">
                            <h3>Authenticate Accountant :</h3><br>
                            <form name="regF" action="#" method="get">
                                <input type="text" name="facultyid" class="form-control" placeholder="Search.." onkeyup="sendFacultyInfoA()">
                            </form>
                            <br><br>
                            <div id="Ac">

                            </div>
                        </div>
                        <div id="cpAc" class="tab-pane fade"><br><br>
                           <div class="col-md-6 col-md-offset-3">
                    <form action="PasswordChange" method="post"> 
                        <input hidden type="text" name="user" value="adminA"/>
                        <table class="table table-responsive table-bordered table-hover"> 
                             <tbody>
                               <tr>
                                 <td><strong>Username :</strong></td>
                                 <td><input  type="text" name="username" placeholder="Enter Accountant id.." /></td>
                               </tr>
                               <tr>
                                   <td hidden><strong>New Password :</strong></td>
                                   <td hidden><input hidden type="password" name="password" placeholder="******" value="kucknhi" required/></td>
                               </tr>
                               <tr>
                                 <td><strong>New Password :</strong></td>
                                 <td><input type="password" name="newpassword" placeholder="******"  required /></td>
                               </tr>
                               <tr>
                                 <td><button type="reset" class="btn btn-primary " data-loading-text="Loading...">Reset</button></td>
                                 <td><button type="submit" class="btn btn-primary btn-success" data-loading-text="Loading...">Submit</button></td>
                               </tr>
                             </tbody>
                        </table>
                    </form><br><br><br>
                        </div>
                        </div>
                    </div>
                </div>
                                    
                <!--Student Section-->                    
                                    
                <div id="student" class="tab-pane fade">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#St">Student</a></li>
                        <li><a data-toggle="tab" href="#vSt">View Student</a></li>
                        <li><a data-toggle="tab" href="#dueFee">Due Fee</a></li>
                        <li><a data-toggle="tab" href="#cpSt">Change Password</a></li>
                    </ul>
                    <br><br>
                  <div class="tab-content">
                      
                    <div id="St" class="tab-pane fade in active">
                        <center><img src="images/st3.png" alt="Online Exam System" height="400px" width="400px"/>  </center>
                    </div>
                      
                    <div id="vSt" class="tab-pane fade">
                        <h2>View Students</h2><br>
                        <form action="DeleteAc" method="post"> <input hidden type="text" name="user" value="delStu"/>
                            <table class="table table-responsive table-bordered table-hover" id="myTableSt">
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
                                        <td><strong>Delete</strong>  <input type="checkbox" id="selectallStudent" /></td>
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
                                        <td><input type="checkbox" class="deleteStt" name="deleteStt" value=<%=rsS.getString(2)%>></td>
                                    </tr>
                                    <%
                                          }
                                        }
                                        catch(Exception e)
                                        {
                                            System.out.println(e);
                                        }
                                    %>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><button type="submit" name="submit" class="btn btn-danger "><span class="glyphicon glyphicon-trash"></span> Delete</button></td>
                                    </tr>
                                  </tbody>
                                </table>
                            </form>
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
                        ArrayList<Integer> fe=new ArrayList<Integer>();
                        ArrayList<String> s=new ArrayList<String>();
                        ArrayList<String> stu=new ArrayList<String>();
                        try
                        {
                            rsD=st.executeQuery("Select username,due from student");
                            while(rsD.next())
                            {
                                fe.add(Integer.parseInt(rsD.getString(2)));
                                s.add(rsD.getString(1));
                            } 
                            for (int i = 0; i < fe.size(); i++) {
                                    if( fe.get(i) > 0 )
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
                                  
                    <div id="cpSt" class="tab-pane fade">
                       <div class="col-md-6 col-md-offset-3">
                    <form action="PasswordChange" method="post"> 
                        <input hidden type="text" name="user" value="adminS"/>
                        <table class="table table-responsive table-bordered table-hover"> 
                             <tbody>
                               <tr>
                                 <td><strong>Username :</strong></td>
                                 <td><input  type="text" name="username" placeholder="Enter Student id .." /></td>
                               </tr>
                               <tr>
                                   <td hidden><strong>New Password :</strong></td>
                                   <td hidden><input hidden type="password" name="password" placeholder="******" value="kucknhi" required/></td>
                               </tr>
                               <tr>
                                 <td><strong>New Password :</strong></td>
                                 <td><input type="password" name="newpassword" placeholder="******"  required /></td>
                               </tr>
                               <tr>
                                 <td><button type="reset" class="btn btn-primary " data-loading-text="Loading...">Reset</button></td>
                                 <td><button type="submit" class="btn btn-primary btn-success" data-loading-text="Loading...">Submit</button></td>
                               </tr>
                             </tbody>
                        </table>
                    </form><br><br><br>
                        </div> 
                    </div>
                  </div>  
                </div>
                                    
                <!--Course Section--> 
                
                <div id="course" class="tab-pane fade">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#CourseHome">Home</a></li>
                        <li><a data-toggle="tab" href="#viewC">View Course</a></li>
                        <li><a data-toggle="tab" href="#AddC">Add Course</a></li>
                        <li><a data-toggle="tab" href="#updateC">Update Course</a></li>
                    </ul><br>
                    <div class="tab-content">
                        <div id="CourseHome" class="tab-pane fade in active">
                            <center><img src="images/Adst.jpg" alt="Online Exam System" height="400px" width="950px"/>  </center>
                        </div>
                        <div id="viewC" class="tab-pane fade">
                            <form action="DeleteAc" method="post"><input hidden type="text" name="user" value="delC"/>
                                <table class="table  table-responsive table-bordered table-hover">
                                  <tbody>
                                    <tr>
                                        <td><strong>Course ID</strong></td>
                                        <td><strong>Course Name</strong></td>
                                        <td><strong>Fee</strong></td>
                                        <td><strong>Duration</strong></td>
                                        <td><strong>Description</strong></td>
                                        <td><strong>Delete</strong> <input type="checkbox" id="selectallC"/></td>
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
                                        <td><input type="checkbox" class="deleteC" name="deleteC" value=<%=rsC.getInt(1)%>></td>
                                    </tr>
                                    <%
                                          }
                                        }
                                        catch(Exception e){}
                                    %>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><button type="submit" name="submit" class="btn btn-danger "><span class="glyphicon glyphicon-trash"></span> Delete</button></td>
                                    </tr>
                                  </tbody>
                                </table>
                            </form>
                        </div>
                        <div id="AddC" class="tab-pane fade">
                            <div class="col-md-5 col-md-offset-4">
                                <strong><h1>Course Details :</h1></strong>
                                <form action="EditDAO" method="post">
                                    <input hidden type="text" name="about" value="AddCourse" placeholder="name"/>
                                    <table class="table  table-responsive table-bordered table-hover">
                                       <tr>
                                           <td><strong>Course Name:</strong></td>
                                           <td><input type="text" name="cName" placeholder="name"/></td>
                                       </tr>
                                       <tr>
                                           <td><strong>Course Fee:</strong></td>
                                           <td><input type="number" required name="fee" placeholder="fees"/></td>
                                       </tr>
                                       <tr>
                                           <td><strong>Duration :</strong></td>
                                           <td><input type="number" required  name="duration" placeholder="in months"/></td>
                                       </tr>
                                       <tr>
                                           <td><strong>Description:</strong></td>
                                           <td><textarea class="form-control span5" name="description" id="desc" rows="5" placeholder="Write about the course......" required="true"></textarea></td>
                                       </tr>
                                       <tr>
                                           <td><button type="reset" class="btn btn-primary " data-loading-text="Loading...">Reset</button></td>
                                           <td><button type="submit" class="btn btn-primary btn-success" data-loading-text="Loading...">Submit</button></td>
                                       </tr>
                                   </table>
                                </form>
                            </div>
                        </div>
                    
                        <div id="updateC" class="tab-pane fade">
                            <h3>View Course :</h3><br>
                            <p>Enter Course id to see the details of Course..</p>
                            <form name="cdv" action="#" method="get">
                                <input type="text" name="cI" class="form-control" placeholder="Search.." onkeyup="sendCourseInfo()">
                            </form>
                            <br><br>
                            <div id="cView1">

                            </div>            
                        </div>
                    </div>
                </div>
                
                <!--Password Section-->
                
                <div id="cp" class="tab-pane fade"><br><br>
                 <div class="col-md-6 col-md-offset-3">
                    <form action="PasswordChange" method="post"> 
                        <input hidden type="text" name="user" value="admin"/>
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
                    </form><br><br><br>
                 </div>
                </div>
                      
                  <!--End Section-->    
                      
            </div>
        </div>
       </div>               
    </body>
    <%@include file="footer.jsp" %>
</html>
