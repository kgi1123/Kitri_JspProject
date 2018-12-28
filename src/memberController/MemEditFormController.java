package memberController;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class MemEditFormController
 */
@WebServlet("/MemEditFormController")
public class MemEditFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemEditFormController() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String path = null;
		if(session != null) {
			String id = (String) session.getAttribute("m_id");
			m = service.getMember(id);
			String addr = m.getM_address();
			try {
				String[] address = addr.split(", ");
				String address1 = address[0];
				String address2 = address[1];
				info.put("m", m);
				info.put("address1", address1);
				info.put("address2", address2);
			}catch(ArrayIndexOutOfBoundsException e){
				out.println("<script language='javascript'>");
				out.println("alert('주소형식이 올바르지 않습니다.');");
				out.println("location.href = 'javascript:history.go(-1);'");
				//path = "jsp/login/custom-info.jsp";
				out.println("</script>");
				return;
			}catch(Exception e){
	            System.out.println(e.getMessage());
	        }finally{
	            System.out.println("주소 형식 체크실행완료");
	        }
			path ="jsp/login/custom-update.jsp";
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
