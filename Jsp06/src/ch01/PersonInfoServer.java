package ch01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PersonInfoServer")
public class PersonInfoServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		
		PersonalInfo pinfo = new PersonalInfo();
		pinfo.setName(name);
		pinfo.setGender(gender);
		pinfo.setAge(Integer.parseInt(age));
		
		request.setAttribute("pinfo", pinfo);
		RequestDispatcher dispatcher
		  = request.getRequestDispatcher("/person/CustomerInfoView2.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
