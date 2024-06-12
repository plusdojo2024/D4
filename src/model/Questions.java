package model;
import java.io.Serializable;

public class Questions implements Serializable{
	private int questions_id;
	private String question;
	private int users_id;
	private String judge;

	//引数がないコンストラクタ
	public Questions() {

	}

	//引数があるコンストラクタ
		public Questions(int questions_id,String question,int users_id,String judge) {
			super();
			this.questions_id=questions_id;
			this.question=question;
			this.users_id=users_id;
			this.judge=judge;

		}

		public int getquestions_id() {
			return questions_id;
		}

		public void setquestions_id(int questions_id) {
			this.questions_id = questions_id;
		}

		public String getQuestion() {
			return question;
		}

		public void setQuestion(String question) {
			this.question = question;
		}

		public int getUsers_id() {
			return users_id;
		}

		public void setUser_id(int users_id) {
			this.users_id = users_id;
		}

		public String getJudge() {
			return judge;
		}

		public void setJudge(String judge) {
			this.judge = judge;
		}
}
