package noticeController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.Notice;
import notice.NoticeDAOImpl;
import notice.NoticeService;
import notice.NoticeServiceImpl;

/**
 * Servlet implementation class noticeEditController
 */
@MultipartConfig(location="C:\\temp", maxFileSize=-1)
@WebServlet("/NoticeEditController")
public class NoticeEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest requesEt, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		NoticeService service = new NoticeServiceImpl(new NoticeDAOImpl());
		
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String img = request.getParameter("img");
		
		Notice n = new Notice(num, "", title, null, 0, content, img);
		
		service.editNotice(n);

		response.sendRedirect("NoticeListController");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
