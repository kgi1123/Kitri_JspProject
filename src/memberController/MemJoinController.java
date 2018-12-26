package memberController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.Member;
import member.MemberDaoImpl;
import member.MemberService;
import member.MemberServiceImpl;
/**
 * Servlet implementation class MemJoinController
 */
@WebServlet("/MemJoinController")
public class MemJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MemJoinController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		MemberService service = new MemberServiceImpl(new MemberDaoImpl());
		String m_id = request.getParameter("signId");
		String m_pwd = request.getParameter("signPassword");
		String m_name = request.getParameter("signName");
		String m_phone = request.getParameter("signTel");
		int m_postNum = Integer.parseInt(request.getParameter("signAddress"));
		String add1 = request.getParameter("signAddress1");
		String add2 = request.getParameter("signAddress2");
		String m_address = add1 + ", " + add2;
		String m_email = request.getParameter("signEmail");
		int m_type = Integer.parseInt(request.getParameter("grant"));
		Member m = new Member(m_id, m_pwd, m_name, m_phone, m_postNum, m_address, m_email, m_type);
		service.join(m);
		String path = "jsp/login/login.jsp";
		HttpSession session = request.getSession(false);
		
		if(session!=null) {
			boolean check = service.check_id(m_id);
			if(check) {
				//path = "jsp/login"
			}
			/*String id2 = (String) session.getAttribute("signId");
			if(id2.equals("admin")) {
				path = "login/login.jsp";//admin 페이지 이동 미구현
			}*/
		}
		response.sendRedirect(path);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
