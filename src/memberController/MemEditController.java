package memberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDaoImpl;
import member.MemberService;
import member.MemberServiceImpl;

/**
 * Servlet implementation class MemEditController
 */
@WebServlet("/MemEditController")
public class MemEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberService service = new MemberServiceImpl(new MemberDaoImpl());
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("signId");
		String pwd = request.getParameter("signPassword");
		String email = request.getParameter("signEmail");
		String phone = request.getParameter("signTel");
		int postNum = Integer.parseInt(request.getParameter("signAddress"));
		String add1 = request.getParameter("signAddress1");
		String add2 = request.getParameter("signAddress2");
		String add = add1 + " " + add2;
		service.editInfo(new Member(id,pwd,"",phone,postNum,add,email,0));
		
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("jsp/main/main.jsp");
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
