package memberController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDaoImpl;
import member.MemberService;
import member.MemberServiceImpl;

/**
 * Servlet implementation class MemPwdFindController
 */
@WebServlet("/MemPwdFindController")
public class MemPwdFindController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemPwdFindController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      //response.setContentType("application/json");
      response.setCharacterEncoding("utf-8");
      
      PrintWriter out = response.getWriter();
      //JSONObject obj = new JSONObject();
      MemberService service = new MemberServiceImpl(new MemberDaoImpl());
      
      
      String id = request.getParameter("id");
      String email = request.getParameter("email");
      boolean checkId = service.check_id(id);
      boolean checkEmail = service.check_email(email);
      String result="";
      if(!checkId) {
         result = "���̵� �����ϴ�.";
         out.print(result);
         //out.print("���̵� �����ϴ�.");
         //out.close();
      } else if(!checkEmail) {
         result = "�߸��� �̸����Դϴ�.";
         out.print(result);
         //out.print("�߸��� �̸����Դϴ�.");
         //out.close();
         /*out.println("<script language='javascript'>");
         out.println("�߸��� �̸����Դϴ�.");
         out.println("</script>");
         out.close();*/
      } else {
         String pwd = "";
         for (int i = 0; i < 12; i++) {
            pwd += (char) ((Math.random() * 26) + 97);
         }
               
         result=pwd;
         out.print(result);
         // ��й�ȣ ����
         service.changePwd(id, pwd);
         //service.getMember(id);
         //response.getWriter().write(result); 
         //out.close();
         //request.setAttribute("pwd", pwd);
         /*path = "${ageContext.request.contextPath }/jsp/login/pwd-find.jsp";
         RequestDispatcher dispatcher = 
               request.getRequestDispatcher(path);
         if (dispatcher != null) {
            dispatcher.forward(request, response);
         }*/
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