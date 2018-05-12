/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.DTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author SHUBHAM
 */
public class Authenticator 
{
    public boolean isAdminL(DTO user)
    {
        String username=user.getUsername();
        String password=user.getPassword();
        String tablePassword="";
        ResultSet rs=null;
        try
        {
            Statement st=DBConnector.getStatement();
            String query="Select password from admin where username='"+username+"'";
            rs=st.executeQuery(query);
            if(rs.next())
            {
                tablePassword=rs.getString(1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        if(username!=null && password!=null && !username.trim().equals("") && !password.trim().equals("") && password.equals(tablePassword)) 
        {
            return true;
        }        
        return false;
    }
    public boolean isAccountantR(DTO user)
    {
        String username=user.getUsername();
        String name=user.getName();
        String email=user.getEmail();
        String pn=user.getPno();
        String date=user.getDate();
        String gen=user.getGen();
        String password=user.getPassword();
        ResultSet rs=null;
        try
        {
            Statement st=DBConnector.getStatement();
            String query="Insert into Accountant values('"+name+"','"+username+"','"+email+"','"+pn+"','"+date+"','"+gen+"','"+password+"','0')";
            //System.out.println(query);
            int i=st.executeUpdate(query);
            if(i>0)
            {
                //System.out.println("Record Inserted");
                return true;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean isAccountantL(DTO user)
    {
        String username=user.getUsername();;
        String password=user.getPassword();
        String tablePassword="";
        ResultSet rs=null;
        try
        {
            Statement st=DBConnector.getStatement();
            String query="Select password from accountant where username='"+username+"'";
            rs=st.executeQuery(query);
            if(rs.next())
            {
                tablePassword=rs.getString(1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        if(username!=null && password!=null && !username.trim().equals("") && !password.trim().equals("") && password.equals(tablePassword)) 
        {
            return true;
        }        
        return false;
    }
    
    public boolean isStudentR(DTO user)
    {
        String username=user.getUsername();
        String name=user.getName();
        String email=user.getEmail();
        String pn=user.getPno();
        //String date=user.getDate();
        String gen=user.getGen();
        String course=user.getCourse();
        String fee=user.getFee();
        String paid=user.getPaid();
        String due=user.getDue();
        String address=user.getAddress();
        String pincode=user.getPincode();
        String city=user.getCity();
        String country=user.getCountry();
        String joiningDate=user.getJoiningDate();
        String date=joiningDate;
        String password=user.getPassword();
        int dueF=Integer.parseInt(fee)-Integer.parseInt(paid);
        long sid=0;
        ResultSet rs=null;
        try
        {
            Statement st=DBConnector.getStatement();
            ResultSet rs1=st.executeQuery("select ID from student order by ID DESC limit 1 ");
                if(rs1.next())
                   sid=rs1.getLong(1)+1;             
                else
                   sid=1;
            String query="Insert into student values('"+name+"','"+username+"','"+email+"','"+pn+"','"+date+"','"+gen+"','"+course+"','"+fee+"','"+paid+"','"+dueF+"','"+address+"','"+pincode+"','"+city+"','"+country+"','"+joiningDate+"','"+password+"','0','"+sid+"')";
            int j=st.executeUpdate("Insert into courseenrolled values('"+course+"','"+username+"','"+name+"','"+fee+"','"+paid+"','"+dueF+"')");
            int i=st.executeUpdate(query);
            if(i>0 && j>0)
            {
                //System.out.println("Record Inserted");
                return true;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean isStudentL(DTO user)
    {
        String username=user.getUsername();;
        String password=user.getPassword();
        String tablePassword="";
        ResultSet rs=null;
        try
        {
            Statement st=DBConnector.getStatement();
            String query="Select password from student where username='"+username+"'";
            rs=st.executeQuery(query);
            if(rs.next())
            {
                tablePassword=rs.getString(1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        if(username!=null && password!=null && !username.trim().equals("") && !password.trim().equals("") && password.equals(tablePassword)) 
        {
            return true;
        }        
        return false;
    }
    
    public boolean isExistedStudent(DTO user)
    {
        String username=user.getUsername();
        String name=user.getName();
        String course=user.getCourse();
        String fee=user.getFee();
        String paid=user.getPaid();
        String due=user.getDue();
        String joiningDate=user.getJoiningDate();
        int dueF=Integer.parseInt(fee)-Integer.parseInt(paid);
        long sid=0;
        ResultSet rs11=null;
        try
        {
            Statement st=DBConnector.getStatement();
            Statement st1=DBConnector.getStatement();
            rs11=st.executeQuery("Select name from student where username='"+username+"'");
            while(rs11.next())
            {
                name=rs11.getString(1);
            }
            int j=st1.executeUpdate("Insert into courseenrolled values('"+course+"','"+username+"','"+name+"','"+fee+"','"+paid+"','"+dueF+"')");
            if(j>0)
            {
                //System.out.println("Record Inserted");
                return true;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean isStudentEdit(DTO s)
    {
        String username=s.getUsername();
        String email=s.getEmail();
        String pno=s.getPno();
        String dob=s.getDate();
        String address=s.getAddress();
        
        try
        {
           Statement st=DBConnector.getStatement();
           int i=st.executeUpdate("Update student set email='"+email+"', pno='"+pno+"', dob='"+dob+"', address='"+address+"' where username='"+username+"' ");
           if(i>0)
           {
               return true;
           }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean deleteAccountant(DTO se)
    {
        String id=se.getUsername();
	try 
            {
            Statement st=DBConnector.getStatement();
            String sql = "DELETE FROM accountant WHERE username='"+id+"'";
            //System.out.println(sql);
            int i=st.executeUpdate(sql);
                if(i>0)
                {
                    return true;
                }
            } 
	catch (Exception e) 
            {
                System.out.println(e);
                return false;
            }
        return false;
    }
    
    public boolean deleteStudent(DTO se)
    {
        String id=se.getUsername();
	try 
            {
            Statement st=DBConnector.getStatement();
            String sql = "DELETE FROM student WHERE username='"+id+"'";
            //System.out.println(sql);
            int i=st.executeUpdate(sql);
                if(i>0)
                {
                    return true;
                }
            } 
	catch (Exception e) 
            {
                System.out.println(e);
                return false;
            }
        return false;
    }
    
    public boolean isCourseAdd(DTO s)
    {
        String cName=s.getCourse();
        String fee=s.getFee();
        String duration = s.getDuration();
        String description=s.getDescription();
        long cid=0;
        try
        {
            Statement st=DBConnector.getStatement();
            ResultSet rs1=st.executeQuery("select CID from course order by CID DESC limit 1 ");
                if(rs1.next())
                   cid=rs1.getLong(1)+1;             
                else
                   cid=1;
            int i=st.executeUpdate("insert into course values('"+cid+"','"+cName+"','"+fee+"','"+duration+"','"+description+"')");
            if(i>0)
            {
                System.out.println("Course addded...");
                return true;
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean isCourseEdit(DTO s)
    {
        String id=s.getId();
        String cName=s.getCourse();
        String fee=s.getFee();
        String duration = s.getDuration();
        String description=s.getDescription();
        try
        {
            Statement st=DBConnector.getStatement();
            int i=st.executeUpdate("UPDATE course SET name = '"+cName+"', fee = '"+fee+"', duration = '"+duration+"',description = '"+description+"'  WHERE CID = '"+id+"'");
            if(i>0)
            {
                System.out.println("Course Updated...");
                return true;
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean deleteCourse(DTO se)
    {
        String id=se.getUsername();
	try 
            {
            Statement st=DBConnector.getStatement();
            String sql = "DELETE FROM course WHERE CID='"+id+"'";
            //System.out.println(sql);
            int i=st.executeUpdate(sql);
                if(i>0)
                {
                    return true;
                }
            } 
	catch (Exception e) 
            {
                System.out.println(e);
                return false;
            }
        return false;
    }
    
    public boolean isUpdateFee(DTO u)
    {
        String username=u.getUsername();
        String course=u.getCourse();
        String paid=u.getPaid();
        String due=u.getDue();
        
        try
        {
            Statement st=DBConnector.getStatement();
            int i=st.executeUpdate("update student Set paid='"+paid+"',due='"+due+"' where username='"+username+"' AND course='"+course+"'");
            int j=st.executeUpdate("update courseenrolled Set paid='"+paid+"',due='"+due+"' where username='"+username+"' AND course='"+course+"'");
            if(i>0 && j>0)
            {
                return true;
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return false;
    }
}
