package controller;

import dto.DTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Authenticator;

/**
 *
 * @author SHUBHAM
 */
public class AdminChecker extends HttpServlet 
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("AdminLogin.html");
    } 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        DTO admin=new DTO();
        System.gc();
        admin.setUsername(username);
        admin.setPassword(password);
        
        Authenticator login=new Authenticator();
        System.gc();
        boolean isAdmin=login.isAdminL(admin);
        
        if(isAdmin)
        {
            System.out.println("Login Successfull...");
            HttpSession session=request.getSession(true);
            session.setAttribute("username",username);
            RequestDispatcher rd=request.getRequestDispatcher("AdminHome.jsp");
            rd.forward(request, response);
        }
        else
        {
            response.sendRedirect("AdminLogin.html");
        }
    }
}
