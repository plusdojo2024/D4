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
		/*
		int requests_id = Integer.parseInt(request.getParameter("requests_id"));
		String address_order = request.getParameter("address_order");
		String request_text = request.getParameter("request_text");
		int users_id = Integer.parseInt(request.getParameter("users_id"));
		*/
		RequestsDAO rDao = new RequestsDAO();
		//List<Bc> cardList = bDao.select(new Bc(0, "", companyName, "", department, position, "", name, "", note));
		List<Requests> requestsList = rDao.select();

		request.setAttribute("requestList", requestsList);

		//request.getAttribute("R_result");


		// HttpSession session = request.getSession();
		if(session.getAttribute("R_result") != null) {
			request.setAttribute("Request_result",
					new Result("要望送信！ご意見ありがとうございます。","/D4/RListServlet"));
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
