package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Users;

public class UsersDAO {

	public Users isLoginOK(String mail, String password) {
		Connection conn = null;
		Users loginResult = null;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SELECT文を準備する
			String sql = "SELECT * FROM Users WHERE mail = ? AND password = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, mail);
			pStmt.setString(2,password);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザー情報を設定する
			if (rs.next()) {
				loginResult = new Users(
					rs.getInt("users_id"),
					rs.getString("mail"),
					rs.getString("password"),
					rs.getInt("grow_point"),
					rs.getDate("last_login_date")
				);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			loginResult = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			loginResult = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					loginResult = null;
				}
			}
		}

		// 結果を返す
		return loginResult;
	}
	
	//ユーザー登録（sql準備・DB接続）
	public boolean insert(Users users) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");

			// SQL文を準備する（AUTO_INCREMENTのNUMBER列にはNULLを指定する）
			String sql = "INSERT INTO Bc VALUES (NULL, ?, ?, 0, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (users.getMail() != null && !users.getMail().equals("")) {
				pStmt.setString(1, users.getMail());
			}
			else {
				pStmt.setString(1, "（未設定）");
			}
			if (users.getPassword() != null && !users.getPassword().equals("")) {
				pStmt.setString(2, users.getPassword());
			}
			else {
				pStmt.setString(2, "（未設定）");
			}
			if (users.getLast_login_date() != null && !users.getLast_login_date().equals("")) {
			    //Date sqlDate = Date.valueOf(users.getLast_login_date()); // yyyy-MM-dd形式の文字列をjava.sql.Dateに変換
			    pStmt.setDate(3, users.getLast_login_date());
			}
			else {
			    //Date sqlDate = Date.valueOf("2000-01-01"); // 未設定の場合でも何かしらの日付が必要
			    pStmt.setString(3, "日付取得失敗！");
			}


			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}
	
	//ポイント加算（1pt）
	public int addPoint(Users users) {
		Connection conn = null;
		int result = 1;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");
			
			// SQL文を準備する
			String sql = "UPDATE Users SET grow_point = grow_point + 1 WHERE users_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setInt(1, users.getGrow_point());
			pStmt.executeQuery();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
			result = 0;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			result = 0;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					result = 0;
				}
			}
		}

		// 結果を返す
		return result;
	}
	
	//ポイント加算（3pt）
	public int addPoint3(Users users) {
		Connection conn = null;
		int result = 3;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE Users SET grow_point = grow_point + 3 WHERE users_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setInt(1, users.getGrow_point());
			pStmt.executeQuery();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
			result = 0;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			result = 0;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					result = 0;
				}
			}
		}

		// 結果を返す
		return result;
	}
}
