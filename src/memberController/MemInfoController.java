package memberController;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class MemInfoController
 */
@WebServlet("/MemInfoController")
public class MemInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberService service = new MemberServiceImpl(new MemberDaoImpl());
		HttpSession session = request.getSession(false);
		Member m = null;
		Map<String, Object> info = new HashMap<String, Object>();
		String path = "";
		if (session != null) {
			String id = (String) session.getAttribute("m_id");
			m = service.getMember(id);
			if(m != null) {	
				String type = service.check_type(m.getM_type());
				info.put("m", m);
				info.put("type", type);
				path = "jsp/login/custom-info.jsp";
			} else {
				path = "jsp/login/login.jsp";
			}
		} 
		request.setAttribute("info", info);
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
