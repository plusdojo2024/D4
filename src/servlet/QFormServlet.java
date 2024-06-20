package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QuestionsDAO;
import dao.UsersDAO;
import model.Questions;
import model.Result;
import model.Users;

/**
 * Servlet implementation class QFormServlet
 */
@WebServlet("/QFormServlet")
public class QFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/D4/LoginServlet");
			return;
		}

		// 質問フォームにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/q_form.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/D4/LoginServlet");
			return;
		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String question = request.getParameter("question");
		Users users = (Users)session.getAttribute("id");
		int users_id = users.getUsers_id();

		UsersDAO UDao = new UsersDAO();

		// 質問送信を行う
		QuestionsDAO qDao = new QuestionsDAO();
		if (qDao.insert(new Questions(0, question, users_id, "回答募集中"))) {
			// 送信成功
			session.setAttribute("Q_result",
			new Result("質問送信！3ptゲット！", "/D4/QListServlet"));


			users.setGrow_point(UDao.addPoint3(users)+ users.getGrow_point());
			session.setAttribute("id",users);
		}
		else {
			session.setAttribute("Q_result",
			new Result("予期しないエラーが発生しました。", "/D4/QListServlet"));
		}

		// 質問一覧ページにリダイレクトする
		response.sendRedirect("/D4/QListServlet");

	}

}
