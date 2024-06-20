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
 * Servlet implementation class RListServlet
 */
@WebServlet("/RListServlet")
public class RListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/D4/LoginServlet");
			return;
		}

		request.setAttribute("id", (Users)session.getAttribute("id"));

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");

		RequestsDAO rDao = new RequestsDAO();
		List<Requests> requestsList = rDao.select();

		request.setAttribute("requestList", requestsList);

		if(session.getAttribute("R_result") != null) {
			request.setAttribute("Request_result", (Result)session.getAttribute("R_result"));
			session.removeAttribute("R_result");
		}

		// 目安箱一覧ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/r_list.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/D4/LoginServlet");
			return;
		}

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/r_list.jsp");
		dispatcher.forward(request, response);
	}
}
