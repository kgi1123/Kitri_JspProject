package productRepsController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import productReps.ProductReps;
import productReps.ProductRepsDaoImpl;
import productReps.ProductRepsService;
import productReps.ProductRepsServiceImpl;

/**
 * Servlet implementation class ProductRepsUpdateController
 */
@MultipartConfig(location="C:\\temp", maxFileSize=-1)
@WebServlet("/ProductRepsUpdateController")
public class ProductRepsUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductRepsUpdateController() {
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
		int preps_star = Integer.parseInt(request.getParameter("preps_star"));
		String preps_content  = request.getParameter("preps_content");
		String preps_img = request.getParameter("preps_img");
		String path;
		
		if(request.getParameter(preps_content) == null) {
			preps_img = request.getParameter("preps_img1");
		}
		
		ProductReps pdr = new ProductReps(0, preps_p_num, preps_writer, 0, preps_star, preps_img, preps_content);
		service.updatePdr(pdr);
		
		path = "jsp/payment/shop-orderList.jsp";
		
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
