package liketoController;

import java.io.IOException;

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
import productReps.ProductRepsDaoImpl;
import productReps.ProductRepsService;
import productReps.ProductRepsServiceImpl;

/**
 * Servlet implementation class LiketoAddController
 */
@WebServlet("/LiketoAddController")
public class LiketoAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LiketoAddController() {
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
		
		//�뙎湲�寃뚯떆�뙋 異붽�
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		int preps_num = Integer.parseInt(request.getParameter("preps_num"));;
		String m_id = request.getParameter("m_id");
		
		ProductRepsService service = new ProductRepsServiceImpl(new ProductRepsDaoImpl());
		int preps_rec = service.prepsRecSelect(preps_num);
		preps_rec = preps_rec + 1;
		service.prepsRecAdd(preps_num,preps_rec);
		preps_rec = service.prepsRecSelect(preps_num);
		
		
		//醫뗭븘�슂 異붽�
		LiketoService liketoService = new LiketoServiceImpl(new LiketoDaoImpl());
		Liketo liketo = liketoService.liketoSelect(preps_num, m_id);
		System.out.println(liketo);
		if(liketo == null) {
			liketoService.likeInsert(preps_num, m_id);
		} else {
			liketoService.likeUpdate(preps_num, m_id);
		}
		
		request.setAttribute("preps_rec", preps_rec);
		
		String path = "jsp/comn/like_json.jsp";
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
