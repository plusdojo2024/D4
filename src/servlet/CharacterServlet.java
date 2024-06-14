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
import dao.UsersDAO;
import model.Questions;
import model.Users;

/**
 * Servlet implementation class CharacterServlet
 */
@WebServlet("/CharacterServlet")
public class CharacterServlet extends HttpServlet {
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

		// あと何ptの計算
		Users users = (Users)session.getAttribute("id");
		int grow_point = users.getGrow_point();
		int next_point = 0;
		if (grow_point < 25) {
			next_point = (25 - grow_point);
		} else if (25 <= grow_point && grow_point < 75) {
			next_point = (75 - grow_point);
		} else if (75 <= grow_point && grow_point < 225) {
			next_point = (225 - grow_point);
		} else if (225 <= grow_point && grow_point < 400) {
			next_point = (400 - grow_point);
		} else {
			next_point = 0;
		}

		// 計算結果をリクエストスコープに格納する
		request.setAttribute("next_point", next_point);


		// キャラクター表示ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/character.jsp");
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
	}
}
