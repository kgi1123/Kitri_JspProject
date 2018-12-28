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
 * Servlet implementation class ProductListController
 */
@WebServlet("/ProductListController")
public class ProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService service = new ProductServiceImpl(new ProductDaoImpl());
		int optionVal = Integer.parseInt(request.getParameter("optionVal"));
		int p_cate1 = Integer.parseInt(request.getParameter("p_cate1"));
		int p_cate2 = Integer.parseInt(request.getParameter("p_cate2"));
		
		ArrayList<Product> list = service.getAll(optionVal, p_cate1, p_cate2);
		request.setAttribute("list", list);
		
		String result = "";
		switch(p_cate1) {
		case 1:
			result = "/jsp/supplements/supplements-list.jsp";
			break;
		case 2:
			result = "/jsp/amino/amino-list.jsp";
			break;
		case 3:
			result = "/jsp/protein/protein-list.jsp";
			break;
		case 4:
			result = "/jsp/vitamin/vitamin-list.jsp";
			break;
		case 5:
			result = "/jsp/exerciseGoods/exercise-list.jsp";
			break;
		}
		
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(result);
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