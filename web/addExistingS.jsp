<%-- 
    Document   : addExistingS
    Created on : Jan 13, 2018, 1:51:12 PM
    Author     : SHUBHAM
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String n=request.getParameter("eSt"); //username
    if(n.length()>0)
    {
        ArrayList<String> sc=new ArrayList<String>();
        Statement st=DBConnector.getStatement();
        ResultSet rs=null,rs1=null,rsCs=null,rsCf=null;
        try
        {
            rs=st.executeQuery("Select course from courseenrolled where username='"+n+"'");
            while(rs.next())
            {
                sc.add(rs.getString(1));
            }
            if(sc.size()>0)
            {
            %>
            <font style='color:red'>Student Exist...!</font><br>
            <Select class="form-control">
            <option>--Course Already Enrolled--</option>
            <%for (int i = 0; i < sc.size(); i++) {
            %>
            <option><%=sc.get(i)%></option>
            <%        
                }
            %>
            </select><br>
            <%        
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    
%>
        <script>
            function a()
            {
                document.getElementById('pai').max=document.getElementById('pFee').value;
            }
        </script>
<form action="StudentChecker" method="post">
    <input hidden name="user" value="addES"/>
    <input hidden name="username" value="<%=n%>"/>
    <table class="table table-striped table-hover">
        <tbody>
            <tr>
                <td>Course</td>
                <td><select class="form-control" name="course" required>
                                <%
                                    try
                                    {
                                        Statement st1=DBConnector.getStatement();
                                    rsCs=st1.executeQuery("Select name,fee from course");
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
                            </select></td>
            </tr>
            <tr>
                <td>Course Fee</td>
                <td><select class="form-control" id="pFee" name="fee" required>
                                <%
                                    try
                                    {
                                        Statement st2=DBConnector.getStatement();
                                    rsCf=st2.executeQuery("Select fee from course");
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
                            </select></td>
            </tr>
            <tr>
                <td>Paid</td>
                <td><input type="number" min="0" max="20000" name="paid" id="pai" class="form-control" onkeyup="a()" placeholder="Fee Paid"/></td>
            </tr>
            <tr>
                <td>Joining Date</td>
                <td><input type="date" name="jd" class="form-control" placeholder="joining date"></td>
            </tr>
            <tr>
                <td><button type="reset"class="btn btn-info "><span class="glyphicon glyphicon-adjust"></span> Reset</button></td>
                <td><button type="submit" class="btn btn-success "><span class="glyphicon glyphicon-edit"></span> Submit</button></td>
            </tr>
        </tbody>
    </table>
</form>
                            <%}%>