package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDAO;
import model.Users;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
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

		UsersDAO UDao = new UsersDAO();
		Users loginUser = (Users)session.getAttribute("id");

		long miliseconds = System.currentTimeMillis();
		long now_time = (miliseconds + 32400000)% 86400000;

		if(now_time<=64800000) {
			loginUser.setGrow_point(UDao.addPoint(loginUser) + loginUser.getGrow_point());
		}

		// セッションスコープを破棄する
		session.invalidate();

		// ログインページにリダイレクトする
		response.sendRedirect("/D4/LoginServlet");
	}

}
