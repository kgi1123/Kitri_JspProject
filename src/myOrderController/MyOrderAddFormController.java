package myOrderController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyOrderAddFormController
 */
@WebServlet("/MyOrderAddFormController")
public class MyOrderAddFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderAddFormController() {
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
		
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		String p_name = request.getParameter("p_name");
		int p_price = Integer.parseInt(request.getParameter("p_price"));
		int o_qty = Integer.parseInt(request.getParameter("o_qty"));
		String p_writer = request.getParameter("p_writer");
		
		request.setAttribute("p_num", p_num);
		request.setAttribute("p_name", p_name);
		request.setAttribute("p_price", p_price);
		request.setAttribute("o_qty", o_qty);
		request.setAttribute("p_writer", p_writer);
		
		String path = "jsp/payment/shop-payment.jsp";
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
