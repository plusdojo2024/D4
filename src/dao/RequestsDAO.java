package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Requests;

public class RequestsDAO {

	//投稿（sql準備・DB接続）
	public boolean insert(Requests request) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SQL文を準備する（AUTO_INCREMENTのNUMBER列にはNULLを指定する）
			String sql = "INSERT INTO Requests VALUES (NULL, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (request.getAddress_order() != null && !request.getAddress_order().equals("")) {
				pStmt.setString(1, request.getAddress_order());
			}
			if (request.getRequest() != null && !request.getRequest().equals("")) {
				pStmt.setString(2, request.getRequest());
			}
			if (request.getUsers_id() != 0) {
				pStmt.setString(3, Integer.toString(request.getUsers_id()));
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


	//一覧表示（全件表示）（sql準備・DB接続）
	public List<Requests> select() {
		Connection conn = null;
		List<Requests> requestList = new ArrayList<Requests>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * FROM Requests ORDER BY requests_id DESC ";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Requests record = new Requests(
				rs.getInt("requests_id"),
				rs.getString("address_order"),
				rs.getString("request"),
				rs.getInt("users_id")
				);
				requestList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			requestList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			requestList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					requestList = null;
				}
			}
		}

		// 結果を返す
		return requestList;
	}


	//件数指定表示（ホーム）（sql準備・DB接続）
	public List<Requests> select_home() {
		Connection conn = null;
		List<Requests> requestList = new ArrayList<Requests>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SQL文を準備する
			String sql = "SELECT TOP 3 * FROM Requests ORDER BY requests_id DESC ";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Requests record = new Requests(
				rs.getInt("requests_id"),
				rs.getString("address_order"),
				rs.getString("request"),
				rs.getInt("users_id")
				);
				requestList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			requestList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			requestList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					requestList = null;
				}
			}
		}

		// 結果を返す
		return requestList;
	}

}
