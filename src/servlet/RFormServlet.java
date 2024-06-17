package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RequestsDAO;
import model.Requests;
import model.Result;
import model.Users;

/**
 * Servlet implementation class RFormServlet
 */
@WebServlet("/RFormServlet")
public class RFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*	// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/D4/LoginServlet");
			return;
		}
	*/

		// 目安箱フォームページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/r_form.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*	// もしもログインしていなかったらログインサーブレットにリダイレクトする
			HttpSession session = request.getSession();
			if (session.getAttribute("id") == null) {
				response.sendRedirect("/D4/LoginServlet");
				return;
			}*/

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String address_order = request.getParameter("address_order");
		String request_text = request.getParameter("request_text");

		HttpSession session = request.getSession();
		Users users = (Users)session.getAttribute("id");

		int users_id = users.getUsers_id();

		// 登録処理を行う
		RequestsDAO rDao = new RequestsDAO();
		rDao.insert(new Requests(0,address_order,request_text,users_id));



		session.setAttribute("R_result",
				new Result("要望送信！ご意見ありがとうございます。", "/D4/RListServlet"));

		List<Requests> requestsList = rDao.select();

		request.setAttribute("requestList", requestsList);

		// 目安箱一覧ページにリダイレクトする
		response.sendRedirect("/D4/RListServlet");

	}



}
