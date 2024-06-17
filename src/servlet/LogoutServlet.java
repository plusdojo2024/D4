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
		// セッションスコープを破棄する
		HttpSession session = request.getSession();
		UsersDAO UDao = new UsersDAO();
		Users loginUser = (Users)session.getAttribute("id");

		long miliseconds = System.currentTimeMillis();
		long now_time = (miliseconds + 32400000)% 86400000;

		//時刻確認用
		//System.out.println(now_time/3600000+":"+(now_time/60000-now_time/3600000*60)+":"+ now_time%60000);

		if(now_time<=64800000) {
			loginUser.setGrow_point(UDao.addPoint(loginUser) + loginUser.getGrow_point());
		}

		session.invalidate();

		// ログインページにリダイレクトする
		response.sendRedirect("/D4/LoginServlet");
	}

}
