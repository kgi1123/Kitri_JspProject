package productController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import liketo.Liketo;
import liketo.LiketoDaoImpl;
import liketo.LiketoService;
import liketo.LiketoServiceImpl;
import product.Product;
import product.ProductDaoImpl;
import product.ProductService;
import product.ProductServiceImpl;
import productReps.ProductReps;
import productReps.ProductRepsDaoImpl;
import productReps.ProductRepsService;
import productReps.ProductRepsServiceImpl;

/**
 * Servlet implementation class ProductViewController
 */
@WebServlet("/ProductViewController")
public class ProductViewController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      //상품목록
      ProductService service = new ProductServiceImpl(new ProductDaoImpl());
      
      int num = Integer.parseInt(request.getParameter("num"));
      int cate1 = Integer.parseInt(request.getParameter("cate1"));
      
      service.updateHits(num);
      Product p = service.getProduct(num);
      
      request.setAttribute("p", p);
      String result = "";
      
      switch(cate1) {
      case 1:
         result = "/jsp/supplements/supplements-getBoard.jsp";
         break;
      case 2:
         result = "/jsp/amino/amino-getBoard.jsp";
         break;
      case 3:
         result = "/jsp/protein/protein-getBoard.jsp";
         break;
      case 4:
         result = "/jsp/vitamin/vitamin-getBoard.jsp";
         break;
      case 5:
         result = "/jsp/exerciseGoods/exercise-getBoard.jsp";
         break;
      }
      
      //댓글 리스트
      ProductRepsService pdrService = new ProductRepsServiceImpl(new ProductRepsDaoImpl());
      
      ArrayList<ProductReps> list = pdrService.pdrListSelect(num);
      int count = list.size();
      
      request.setAttribute("list", list);
      request.setAttribute("count", count);
      
      //좋아요 출력
      LiketoService liketoService = new LiketoServiceImpl(new LiketoDaoImpl());
      ArrayList<Liketo> like = liketoService.liketoSelectList();
      request.setAttribute("like", like);
      
      RequestDispatcher dispatcher = request.getRequestDispatcher(result);
      dispatcher.forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}