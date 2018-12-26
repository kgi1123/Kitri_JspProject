package noticeController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.Notice;
import notice.NoticeDAOImpl;
import notice.NoticeService;
import notice.NoticeServiceImpl;

/**
 * Servlet implementation class GetNoticeController
 */
@WebServlet("/NoticeViewController")
public class NoticeViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		NoticeService service = new NoticeServiceImpl(new NoticeDAOImpl());
		int num = Integer.parseInt(request.getParameter("num"));
		
		service.updateHits(num);
		
		Notice n = service.getNotice(num);
		
		request.setAttribute("n", n);
		String result = "/jsp/intro/notice-getBoard.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(result);
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
