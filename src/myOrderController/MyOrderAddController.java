package myOrderController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myOrder.MyOrder;
import myOrder.MyOrderDaoImpl;
import myOrder.MyOrderService;
import myOrder.MyOrderServiceImpl;

/**
 * Servlet implementation class MyOrderAddController
 */
@WebServlet("/MyOrderAddController")
public class MyOrderAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderAddController() {
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
		
		MyOrderService service = new MyOrderServiceImpl(new MyOrderDaoImpl());
		
		String o_buyer = request.getParameter("o_buyer");
		String o_recipient = request.getParameter("o_recipient");
		String signAddress1 = request.getParameter("signAddress1");
		String signAddress2 = request.getParameter("signAddress2");
		String o_address = signAddress1 + "/ " + signAddress2;
		String o_goods = request.getParameter("p_name");
		//String o_phone = request.getParameter("o_phone");
		String o_req = request.getParameter("o_req");
		int o_qty = Integer.parseInt(request.getParameter("o_qty"));
		int o_p_num = Integer.parseInt(request.getParameter("p_num"));
		int o_postNum = Integer.parseInt(request.getParameter("signAddress"));
		String o_seller = request.getParameter("o_seller");
		
		MyOrder mo = new MyOrder(0, null, o_buyer, "", "", o_recipient, o_address, o_goods, o_req, "", o_qty, o_p_num, o_postNum, o_seller);
		service.addMyOrder(mo);
		
		String path = "jsp/main/main.jsp";
		response.sendRedirect(path);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
