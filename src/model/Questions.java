package model;
import java.io.Serializable;

public class Questions implements Serializable{
	private int question_id;
	private String question;
	private int user_id;
	private String judge;

	//引数がないコンストラクタ
	public Questions() {

	}

	//引数があるコンストラクタ
		public Questions(int question_id,String question,int user_id,String judge) {
			super();
			this.question_id=question_id;
			this.question=question;
			this.user_id=user_id;
			this.judge=judge;

		}

		public int getQuestion_id() {
			return question_id;
		}

		public void setQuestion_id(int question_id) {
			this.question_id = question_id;
		}

		public String getQuestion() {
			return question;
		}

		public void setQuestion(String question) {
			this.question = question;
		}

		public int getUser_id() {
			return user_id;
		}

		public void setUser_id(int user_id) {
			this.user_id = user_id;
		}

		public String getJudge() {
			return judge;
		}

		public void setJudge(String judge) {
			this.judge = judge;
		}
}
