package productController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.Product;
import product.ProductDaoImpl;
import product.ProductService;
import product.ProductServiceImpl;

/**
 * Servlet implementation class AdminListController
 */
@WebServlet("/AdminListController")
public class AdminListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductService service = new ProductServiceImpl(new ProductDaoImpl());
		int optionVal = Integer.parseInt(request.getParameter("optionVal"));
		int p_cate1 = Integer.parseInt(request.getParameter("p_cate1"));
		int p_cate2 = Integer.parseInt(request.getParameter("p_cate2"));
		
		ArrayList<Product> list = service.getAll(optionVal, p_cate1, p_cate2);
		request.setAttribute("list", list);
		
		String result = "/jsp/admin/product-list.jsp";
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(result);
		if(dispatcher != null) {
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
