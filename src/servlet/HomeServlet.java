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
import dao.RequestsDAO;
import model.Questions;
import model.Requests;
import model.Result;
import model.Users;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
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

		/*
		HttpSession session = request.getSession();
		Users loginUser = (Users)session.getAttribute("id");
		int users_id = loginUser.getUsers_id();
		*/

		//新規質問
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		//String question = request.getParameter("question");
		//int users_id = request.getParameter("users_id");
		//String judge = request.getParameter("judge");

		// 検索処理を行う
		QuestionsDAO QDao = new QuestionsDAO();
		List<Questions> questionList = QDao.select_home();

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("questionList", questionList);


		//新規要望
		// リクエストパラメータを取得する
		//request.setCharacterEncoding("UTF-8");
		//String address_order = request.getParameter("address_order");
		//String request = request.getParameter("request");
		//int users_id = request.getParameter("users_id");

		// 検索処理を行う
		RequestsDAO RDao = new RequestsDAO();
		List<Requests> requestsList = RDao.select_home();

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("requestsList", requestsList);

		// ホームページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/D4/LoginServlet");
			return;
		}

		//質問フォーム
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String question = request.getParameter("question");
		Users users = (Users)session.getAttribute("id");
		int users_id = users.getUsers_id();

		//質問送信を行う
		QuestionsDAO QDao = new QuestionsDAO();
		//QDao.insert(new Questions(0, question, users_id, "回答募集中")) ;
		if (QDao.insert(new Questions(0, question, users_id, "回答募集中"))) {
			// 送信成功
			request.setAttribute("result",
			new Result("質問送信！3ptゲット！", "/D4/home.jsp"));
		}
		else {												// 登録失敗
			request.setAttribute("result",
			new Result("※1～1000字で入力してください", "/D4/home.jsp"));
		}

		//新規質問
				// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				//String question = request.getParameter("question");
				//int users_id = request.getParameter("users_id");
				//String judge = request.getParameter("judge");

				// 検索処理を行う
				QDao = new QuestionsDAO();
				List<Questions> questionList = QDao.select_home();

				// 検索結果をリクエストスコープに格納する
				request.setAttribute("questionList", questionList);


				//新規要望
				// リクエストパラメータを取得する
				//request.setCharacterEncoding("UTF-8");
				//String address_order = request.getParameter("address_order");
				//String request = request.getParameter("request");
				//int users_id = request.getParameter("users_id");

				// 検索処理を行う
				RequestsDAO RDao = new RequestsDAO();
				List<Requests> requestsList = RDao.select_home();

				// 検索結果をリクエストスコープに格納する
				request.setAttribute("requestsList", requestsList);

		// ホームページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
		dispatcher.forward(request, response);


	}

}
