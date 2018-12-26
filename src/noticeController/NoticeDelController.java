package noticeController;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeDAOImpl;
import notice.NoticeService;
import notice.NoticeServiceImpl;

/**
 * Servlet implementation class noticeDelController
 */
@WebServlet("/NoticeDelController")
public class NoticeDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDelController() {
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
		System.out.println(num);
		String img = service.getNotice(num).getN_img();
		int cnt = service.countUseImg(img, num);
		
		service.delNotice(num);
		
		if(cnt == 0) {
			File f = new File ("C:\\Users\\KITRI\\Desktop\\KITRI\\JAVA\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\" + img);
			f.delete();
		}
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
