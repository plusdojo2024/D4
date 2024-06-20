package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Questions;

public class QuestionsDAO {

	//投稿（sql準備・DB接続）
	public boolean insert(Questions question) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SQL文を準備する（AUTO_INCREMENTのNUMBER列にはNULLを指定する）
			String sql = "INSERT INTO Questions VALUES (NULL, ?, ?, '回答募集中')";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (question.getQuestion() != null && !question.getQuestion().equals("")) {
				pStmt.setString(1, question.getQuestion());
			}
			// else {
			//	pStmt.setString(1, "");
			// }
			if (question.getUsers_id() != 0) {
				pStmt.setString(2, Integer.toString(question.getUsers_id()));
			}
			else {
				pStmt.setString(2, "（未設定）");
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
	public List<Questions> select() {
		Connection conn = null;
		List<Questions> questionList = new ArrayList<Questions>();


		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * FROM Questions ORDER BY questions_id DESC ";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Questions record = new Questions(
				rs.getInt("questions_id"),
				rs.getString("question"),
				rs.getInt("users_id"),
				rs.getString("judge")
				);
				questionList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			questionList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			questionList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					questionList = null;
				}
			}
		}

		// 結果を返す
		return questionList;
	}


	//件数指定表示（ホーム）（sql準備・DB接続）
	public List<Questions> select_home() {
		Connection conn = null;
		List<Questions> questionList = new ArrayList<Questions>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SQL文を準備する
			String sql = "SELECT TOP 3 * FROM Questions ORDER BY questions_id DESC ";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Questions record = new Questions(
				rs.getInt("questions_id"),
				rs.getString("question"),
				rs.getInt("users_id"),
				rs.getString("judge")
				);
				questionList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			questionList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			questionList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					questionList = null;
				}
			}
		}

		// 結果を返す
		return questionList;
	}

	// 質問一覧で選択された質問を表示する
	public List<Questions> select(int questions_id) {
		Connection conn = null;
		List<Questions> QList = new ArrayList<Questions>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * FROM Questions WHERE questions_id = ?  ";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, questions_id);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Questions record = new Questions(
				rs.getInt("questions_id"),
				rs.getString("question"),
				rs.getInt("users_id"),
				rs.getString("judge")
				);
				QList.add(record);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			QList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			QList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					QList = null;
				}
			}
		}

		// 結果を返す
		return QList;
	}


	// 引数paramaterで検索項目を指定し、検索結果のリストを返す
	public List<Questions> select(Questions question) {
		Connection conn = null;
		List<Questions> questionList = new ArrayList<Questions>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

	// SQL文を準備する
	String sql = "SELECT * FROM Questions WHERE question LIKE ? AND judge LIKE ? ORDER BY questions_id DESC";
	PreparedStatement pStmt = conn.prepareStatement(sql);
	// SQL文を完成させる
	if (question.getQuestion() != null) {
		pStmt.setString(1, "%" + question.getQuestion() + "%");
	}
	else {
		pStmt.setString(1, "%");
	}
	if (question.getJudge() != null) {
		pStmt.setString(2, "%" + question.getJudge() + "%");
	}
	else {
		pStmt.setString(2, "%");
	}

	// SQL文を実行し、結果表を取得する
	ResultSet rs = pStmt.executeQuery();

	// 結果表をコレクションにコピーする
	while (rs.next()) {
		Questions record = new Questions(
		rs.getInt("questions_id"),
		rs.getString("question"),
		rs.getInt("users_id"),
		rs.getString("judge")
		);
		questionList.add(record);
	}
}
catch (SQLException e) {
	e.printStackTrace();
	questionList = null;
}
catch (ClassNotFoundException e) {
	e.printStackTrace();
	questionList = null;
}
finally {
	// データベースを切断
	if (conn != null) {
		try {
			conn.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
			questionList = null;
		}
	}
}

// 結果を返す
return questionList;
}

	// 引数cardで指定されたレコードを更新し、成功したらtrueを返す
	public boolean update(Questions Question) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D4/data/div", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE Questions SET question=?, judge=? WHERE questions_id=? AND users_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (Question.getQuestion() != null && !Question.getQuestion().equals("")) {
				pStmt.setString(1, Question.getQuestion());
			}
			else {
				pStmt.setString(1, null);
			}
			if (Question.getJudge() != null && !Question.getJudge().equals("")) {
				pStmt.setString(2, Question.getJudge());
			}
			else {
				pStmt.setString(2, null);
			}
			int Qid = Question.getQuestions_id();
			pStmt.setInt(3, Qid);
			int id = Question.getUsers_id();
			pStmt.setInt(4, id);

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
