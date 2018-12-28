package noticeController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import notice.Notice;
import notice.NoticeDAOImpl;
import notice.NoticeService;
import notice.NoticeServiceImpl;

/**
 * Servlet implementation class noticeAddController
 */
@MultipartConfig(location="D:\\ŰƮ��\\JSP", maxFileSize=-1)
@WebServlet("/NoticeAddController")
public class NoticeAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAddController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// ���ε�� ���� �б�
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    response.setCharacterEncoding("utf-8");
	      
		NoticeService service = new NoticeServiceImpl(new NoticeDAOImpl());
		String writer = request.getParameter("n_writer");
		String title = request.getParameter("n_title");
		String content = request.getParameter("n_content");
		String name = "";
		
		Part img1 = request.getPart("n_img");
		String[] header = img1.getHeader("Content-Disposition").split(";");
		for (String a : header) {
			// ���ε�� ���ϸ� �б�
			if (a.trim().startsWith("filename")) {
				name = a.substring(a.lastIndexOf("=") + 2, a.length()-1).trim();				
			}
		}		
		// ���� ũ�⸦ size�� ����
		long size = img1.getSize();
		if (size > 0) {
			System.out.println(name);
			
			// ���ε�� ������ ����
			img1.write(request.getContextPath()+"\\WebContent\\images\\product\\" + name);
			img1.delete();
		}		
		
		Notice n = new Notice(0, writer, title, null, 0, content, name);
		service.addNotice(n);
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
