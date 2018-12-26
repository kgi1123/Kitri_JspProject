package productController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import product.Product;
import product.ProductDaoImpl;
import product.ProductService;
import product.ProductServiceImpl;

/**
 * Servlet implementation class ProductEditController
 */
@WebServlet("/ProductEditController")
public class ProductEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductEditController() {
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
		String name = request.getParameter("name");		
		String contents = request.getParameter("contents");
		String img1 = request.getParameter("img1");
		String img2 = request.getParameter("img2");
		int price = Integer.parseInt(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int cate1 = Integer.parseInt(request.getParameter("p_cate1"));
		int cate2 = Integer.parseInt(request.getParameter("p_cate2"));
		
		
		
		Product p = new Product(num, "", name, null, 0, contents, img1, price, quantity, 0, cate1, cate2, img2);
		
		String name2 = "";
	      for(int i=0; i<2; i++) {
	         Part imgFile = request.getPart("p_img" + (i+1));
	         
	         if(imgFile != null && imgFile.getSize()>0) {
	            String[] header = imgFile.getHeader("Content-Disposition").split(";");
	            for (String a : header) {
	               if (a.trim().startsWith("filename")) {
	                  name2 = a.substring(a.lastIndexOf("=") + 2, a.length()-1).trim();   
	               }
	            }   
	         }
	         
	         long size = imgFile.getSize();
	         if (size > 0) {
	            imgFile.write("C:\\Users\\KITRI\\Desktop\\KITRI\\JAVA\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\" + name2);
	            
	            switch(i) {
	            case 0:
	               p.setP_img1(name2);
	               break;
	            case 1:
	               p.setP_img2(name2);
	               break;
	            }
	         }
	         imgFile.delete();
	      }
		
		
		service.editProduct(p);

		response.sendRedirect("AdminListListController?optionVal=0&p_cate1="+cate1+"&p_cate2="+cate2);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
