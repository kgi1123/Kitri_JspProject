package productRepsController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import productReps.ProductReps;
import productReps.ProductRepsDaoImpl;
import productReps.ProductRepsService;
import productReps.ProductRepsServiceImpl;


/**
 * Servlet implementation class ProductRepsAddController
 */

@MultipartConfig(location="C:\\temp", maxFileSize=-1)
@WebServlet("/ProductRepsAddController")
public class ProductRepsAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductRepsAddController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		ProductRepsService service = new ProductRepsServiceImpl(new ProductRepsDaoImpl());
		int preps_p_num = Integer.parseInt(request.getParameter("preps_p_num"));
		String preps_writer = request.getParameter("preps_writer");
		System.out.println(preps_writer);
		int preps_star = Integer.parseInt(request.getParameter("preps_star"));
		String preps_content = request.getParameter("preps_content");
		String path="jsp/payment/shop-orderList.jsp";
		String name = "";
		
		Part img1 = request.getPart("preps_img");
		String[] header = img1.getHeader("Content-Disposition").split(";");
		for (String a : header) {

			if (a.trim().startsWith("filename")) {
				name = a.substring(a.lastIndexOf("=") + 2, a.length()-1).trim();				
			}
		}	
		
		long size = img1.getSize();
		
		if (size > 0) {
			img1.write("D:\\kitri java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\" + name);
			img1.delete();
		}	
		
		ProductReps pdr = new ProductReps(0, preps_p_num, preps_writer, 0, preps_star, name, preps_content);
		service.addProductReps(pdr);
		

		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
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
