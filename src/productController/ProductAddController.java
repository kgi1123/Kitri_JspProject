package productController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
 * Servlet implementation class ProductAddController
 */
@MultipartConfig(location="C:\\temp", maxFileSize=-1)
@WebServlet("/ProductAddController")
public class ProductAddController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAddController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      response.setCharacterEncoding("utf-8");
      
      ProductService service = new ProductServiceImpl(new ProductDaoImpl());
      String p_name = request.getParameter("p_name");
      String p_writer = request.getParameter("p_writer");
      String p_contents = request.getParameter("p_contents");
      int p_price = Integer.parseInt(request.getParameter("p_price"));
      int p_quantity = Integer.parseInt(request.getParameter("p_quantity"));
      int p_cate1 = Integer.parseInt(request.getParameter("p_cate1"));
      int p_cate2 = Integer.parseInt(request.getParameter("p_cate2"));
      
      Product p = new Product();
      p.setP_name(p_name);
      p.setP_writer(p_writer);
      p.setP_contents(p_contents);
      p.setP_price(p_price);
      p.setP_quantity(p_quantity);
      p.setP_cate1(p_cate1);
      p.setP_cate2(p_cate2);
      
      String name = "";
      for(int i=0; i<2; i++) {
         Part imgFile = request.getPart("p_img" + (i+1));
         
         if(imgFile != null && imgFile.getSize()>0) {
            String[] header = imgFile.getHeader("Content-Disposition").split(";");
            for (String a : header) {
               if (a.trim().startsWith("filename")) {
                  name = a.substring(a.lastIndexOf("=") + 2, a.length()-1).trim();   
               }
            }   
         }
         
         long size = imgFile.getSize();
         if (size > 0) {
            imgFile.write("C:\\Users\\KITRI\\Desktop\\KITRI\\JAVA\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\" + name);
            
            switch(i) {
            case 0:
               p.setP_img1(name);
               break;
            case 1:
               p.setP_img2(name);
               break;
            }
         }
         imgFile.delete();
      }
      
//      Product p = new Product(0, p_writer, p_name, null, 0, p_contents,
//            name, p_price, p_quantity, 0, p_cate1, p_cate2, p_img2);
      service.addProduct(p);
      response.sendRedirect(request.getContextPath()+"/jsp/admin/dashBoard.jsp");
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}