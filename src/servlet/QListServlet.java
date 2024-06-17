package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionsDAO;
import model.Questions;

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
		/*
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/D4/LoginServlet");
			return;
		}
		*/

		// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				/*
				int questions_id = Integer.parseInt(request.getParameter("questions_id"));
				String question = request.getParameter("question");
				int users_id = Integer.parseInt(request.getParameter("users_id"));
				String judge = request.getParameter("judge");
				*/

				QuestionsDAO rDao = new QuestionsDAO();
				//List<Bc> cardList = bDao.select(new Bc(0, "", companyName, "", department, position, "", name, "", note));
				List<Questions> requestsList = rDao.select();

		//質問一覧ページにフォワードする。
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/q_list.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
