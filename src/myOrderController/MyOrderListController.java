package myOrderController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myOrder.MyOrder;
import myOrder.MyOrderDaoImpl;
import myOrder.MyOrderService;
import myOrder.MyOrderServiceImpl;

/**
 * Servlet implementation class MyOrderListController
 */
@WebServlet("/MyOrderListController")
public class MyOrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyOrderService service = new MyOrderServiceImpl(new MyOrderDaoImpl());
		
		HttpSession session = request.getSession(false);
		String id = "";
		if(session != null) {
			id = (String)session.getAttribute("m_id");
		}
		request.setAttribute("m_id", id);
		
		MyOrder mo = new MyOrder();
		mo.setO_buyer(id);
		
		ArrayList<MyOrder> list = service.selectByO_Buyer(id);
		request.setAttribute("list", list);
		
		String path = "jsp/payment/shop-orderList.jsp";
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(path);
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
