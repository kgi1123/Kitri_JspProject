package productRepsController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import productReps.ProductReps;
import productReps.ProductRepsDaoImpl;
import productReps.ProductRepsService;
import productReps.ProductRepsServiceImpl;

/**
 * Servlet implementation class ProductRepsCheckController
 */
@WebServlet("/ProductRepsCheckController")
public class ProductRepsCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductRepsCheckController() {
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

		int product_num = Integer.parseInt(request.getParameter("product_num"));
		String product_name = request.getParameter("product_name");
		String p_writer = request.getParameter("product_writer");
		String path = "";
		
		ProductRepsService service = new ProductRepsServiceImpl(new ProductRepsDaoImpl());
		ProductReps pdr = service.searchPdrCheck(product_num, p_writer);
		System.out.println(pdr);
		
		if(pdr == null) {
			System.out.println("후기 없으니 후기페이지 이동");
			request.setAttribute("product_num", product_num);
			request.setAttribute("product_name", product_name);
			request.setAttribute("p_writer", p_writer);
			path = "/jsp/payment/shop-review.jsp";
		} else {
			System.out.println("후기 있으니 수정페이지 이동");
			request.setAttribute("pdr", pdr);
			request.setAttribute("product_name", product_name);
		    path="jsp/payment/shop-update.jsp";
		}
		
		
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
