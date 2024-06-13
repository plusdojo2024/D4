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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("result", null);

		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		HttpSession session = request.getSession();
		session.setAttribute("id", new Users(1, "メールアドレス", "パスワード", 100, new Date(10000000000L)));
		response.sendRedirect("/D4/HomeServlet");
        */

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

		//passとDBのハッシュ値が等しければログイン成功
		// ログイン処理を行う
		UsersDAO iDao = new UsersDAO();
		Users loginUser = iDao.isLoginOK(mail, pass);
		if (loginUser != null) {	// ログイン成功
			// セッションスコープにIDを格納する
			HttpSession session = request.getSession();
			session.setAttribute("id", new Users(1, "メールアドレス", "パスワード", 100, new Date(10000000000L)));
			loginUser.setGrow_point(iDao.addPoint(loginUser) + loginUser.getGrow_point());

			session.setAttribute("id", loginUser);

			// メニューサーブレットにリダイレクトする
			response.sendRedirect("/D4/HomeServlet");
		}
		else {									// ログイン失敗
			// リクエストスコープに、タイトル、メッセージ、戻り先を格納する
			request.setAttribute("result",
			new Result("ログイン失敗！", "入力内容が正しくありません。", "/D4/LoginServlet"));

			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}

	}
}
