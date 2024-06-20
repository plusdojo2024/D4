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

import dao.AnswersDAO;
import dao.QuestionsDAO;
import dao.UsersDAO;
import model.Answers;
import model.Questions;
import model.Result;
import model.Users;

/**
 * Servlet implementation class QAServlet
 */
@WebServlet("/QAServlet")
public class QAServlet extends HttpServlet {
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

		// リダイレクト時のメッセージ表示
		if(session.getAttribute("result") != null) {
			request.setAttribute("result", (Result)session.getAttribute("result"));
			session.removeAttribute("result");
		}

		if(session.getAttribute("update") != null) {
			request.setAttribute("update", (Result)session.getAttribute("update"));
			session.removeAttribute("update");
		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		int questions_id = (int)session.getAttribute("q_id");

		request.setAttribute("id",session.getAttribute("id"));

		// 選択された質問とその回答を表示
		QuestionsDAO QDao = new QuestionsDAO();
		List<Questions> QList = QDao.select(questions_id);

		Questions question = QList.get(0);
		request.setAttribute("Qid",question);
		String judge = question.getJudge();
		request.setAttribute("Judge",judge);

		AnswersDAO ADao = new AnswersDAO();
		List<Answers> AList = ADao.select(questions_id);

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("QList", question);
		request.setAttribute("AList", AList);


		//質問一覧ページにフォワードする。
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/q_a.jsp");
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

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String answer=request.getParameter("answerForm");

		UsersDAO UDao = new UsersDAO();
		Users users = (Users)session.getAttribute("id");
		int questions_id = (int)session.getAttribute("q_id");	//質問IDを格納したスコープを呼び出す

		int users_id = users.getUsers_id();
		AnswersDAO ADao = new AnswersDAO();

		// 回答送信を行う
		if(request.getParameter("submit").equals("回答する")) {
			if (ADao.insert(new Answers(0, questions_id, answer, users_id))) {
				session.setAttribute("result",
				new Result("回答送信！3ptゲット！", "/D4/QAServlet"));
				users.setGrow_point(UDao.addPoint3(users)+ users.getGrow_point());
				session.setAttribute("id",users);
			}
			else {
				session.setAttribute("result",
				new Result("※1～1000字で入力してください", "/D4/QAServlet"));
			}
		}

		//更新を行う
		// リクエストパラメータを取得する
		//request.setCharacterEncoding("UTF-8");
		String question = request.getParameter("question");
		String judge = request.getParameter("judge");

		QuestionsDAO QDao = new QuestionsDAO();
		if (request.getParameter("submit").equals("更新")) {
			if (QDao.update(new Questions(questions_id, question, users_id, judge))) {
				session.setAttribute("update", new Result("質問内容を更新しました。", "/D4/QAServlet"));
			}
			else {
				session.setAttribute("update",
				new Result("予期しないエラーが発生しました。", "/D4/home.jsp"));
			}
		}


		//詳細ページにリダイレクトする
		response.sendRedirect("/D4/QAServlet");
	}
}
