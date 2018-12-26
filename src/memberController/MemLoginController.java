package memberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import member.Member;
import member.MemberDaoImpl;
import member.MemberService;
import member.MemberServiceImpl;

/**
 * Servlet implementation class MemLoginController
 */
@WebServlet("/MemLoginController")
public class MemLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		//PrintWriter out = response.getWriter();
		MemberService service = new MemberServiceImpl(new MemberDaoImpl());
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		boolean flag = service.login(m_id, m_pwd);		
		int type = service.get_type(m_id);
		String m_type = service.check_type(type);
		String path = "";
		if(flag) {
			path = "jsp/main/main.jsp";
			HttpSession session = request.getSession();
			//Member m = service.getMember(m_id);
			session.setAttribute("m_id", m_id);
			session.setAttribute("m_type", m_type);
			/*out.println("로그인 성공");
			out.close();*/
		}else {
			path = "jsp/login/login.jsp";
			/*out.println("로그인 실패");
			out.close();*/
		}
		
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(path);
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
