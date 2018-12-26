package productController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDaoImpl;
import product.ProductService;
import product.ProductServiceImpl;

/**
 * Servlet implementation class ProductDelController
 */
@WebServlet("/ProductDelController")
public class ProductDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductService service = new ProductServiceImpl(new ProductDaoImpl());
		
		int num = Integer.parseInt(request.getParameter("num"));
		int cate1 = service.getProduct(num).getP_cate1();
		int cate2 = service.getProduct(num).getP_cate2();
		System.out.println(num);
		
		service.delProduct(num);
		
		response.sendRedirect("AdminListController?optionVal=0&p_cate1="+cate1+"&p_cate2="+cate2);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
