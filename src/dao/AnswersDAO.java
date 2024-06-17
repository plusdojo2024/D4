package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Answers;

public class AnswersDAO {

	//回答一覧
	public List<Answers> select(int questions_id) {
		Connection conn = null;
		List<Answers> AList = new ArrayList<Answers>();


		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * FROM Answers WHERE questions_id = ? ORDER BY answers_id DESC ";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, questions_id);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Answers record = new Answers(
				rs.getInt("answers_id"),
				rs.getInt("question_id"),
				rs.getString("answer"),
				rs.getInt("user_id")
				);
				AList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			AList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			AList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					AList = null;
				}
			}
		}

		// 結果を返す
		return AList;
	}

	//回答登録
	public boolean insert(Answers answer) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SQL文を準備する（AUTO_INCREMENTのNUMBER列にはNULLを指定する）
			String sql = "INSERT INTO Bc VALUES (NULL, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (Integer.toString(answer.getQuestion_id()) != null && !Integer.toString(answer.getQuestion_id()).equals("")) {
				pStmt.setString(1, Integer.toString(answer.getQuestion_id()));
			}
			else {
				pStmt.setString(1, "（未設定）");
			}
			if (answer.getAnswer() != null && !answer.getAnswer().equals("")) {
				pStmt.setString(2, answer.getAnswer());
			}
			else {
				pStmt.setString(2, "（未設定）");
			}
			if (answer.getUser_id() != 0) {
				pStmt.setString(3, Integer.toString(answer.getUser_id()));
			}
			else {
				pStmt.setString(3, "（未設定）");
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
}
