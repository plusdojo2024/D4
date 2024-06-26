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

import dao.QuestionsDAO;
import model.Questions;
import model.Result;
import model.Users;

/**
 * Servlet implementation class QListServlet
 */
@WebServlet("/QListServlet")
public class QListServlet extends HttpServlet {
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


		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");

		// 検索処理を行う
		QuestionsDAO qDao = new QuestionsDAO();
		List<Questions> questionList = qDao.select();
		request.setAttribute("questionList", questionList);

		// リダイレクト時のメッセージ表示
		if(session.getAttribute("Q_result") != null) {
			request.setAttribute("Question_result", (Result)session.getAttribute("Q_result"));
			session.removeAttribute("Q_result");
		}

		//質問一覧ページにフォワードする。
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/q_list.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/D4/LoginServlet");
			return;
		}

		Users users = (Users)session.getAttribute("id");

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String question = request.getParameter("questionWindow");
		int users_id = users.getUsers_id();
		String judge = request.getParameter("selected");
		String checked = request.getParameter("mine");
		request.setAttribute("checked", checked);

		QuestionsDAO qDao = new QuestionsDAO();

		if(checked!=null){
			List<Questions> questionList = qDao.select_mine(users_id,question,judge);

			// 検索結果をリクエストスコープに格納する
			request.setAttribute("questionList", questionList);

			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/q_list.jsp");
			dispatcher.forward(request, response);
		}
		else if(request.getParameter("submit").equals("検索")){

			// 検索処理を行う
			List<Questions> questionList = qDao.select(new Questions(0, question,users_id,judge));

			// 検索結果をリクエストスコープに格納する
			request.setAttribute("questionList", questionList);

			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/q_list.jsp");
			dispatcher.forward(request, response);
		}
		else {
			int questions_id = Integer.parseInt(request.getParameter("questions_id"));
			session.setAttribute("q_id",questions_id);
			response.sendRedirect("/D4/QAServlet");
		}
	}

}