package servlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDAO;
import model.Result;
import model.Users;

/**
 * Servlet implementation class RFormServlet
 */
@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
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

		request.setAttribute("id", (Users)session.getAttribute("id"));

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
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
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");

		//取得したpasswordをSHA256ハッシュ値に変換
		String pass = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256"); //任意サイズのデータを取得して固定長のハッシュ値を出力するMessageDigestクラス
			byte[] digest = md.digest(password.getBytes(StandardCharsets.UTF_8)); //String型のpasswordをbyte型配列に変換(getBytes())してハッシュ値を計算(md.digest())
			for (byte b : digest) {
				String a = Integer.toHexString(0xff & b); //バイナリのハッシュ値を16進数に変換
				if (a.length() == 1) {
					pass += "0" + a; //1桁の時0をつける
				} else {
					pass += a;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}


		// 登録処理を行う
		UsersDAO UDao = new UsersDAO();
		if (UDao.insert(new Users(0, mail, pass, 0, new Date(10000000000L), 0))) {
			// 登録成功
			request.setAttribute("result",
					new Result("ユーザーを登録しました。", "/D4/regist.jsp"));
		}
		else {												// 登録失敗
			request.setAttribute("result",
					new Result("予期しないエラーが発生しました。", "/D4/regist.jsp"));
		}

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
		dispatcher.forward(request, response);
	}
}
