package model;
import java.io.Serializable;

public class Answers implements Serializable{
	private int answers_id;
	private int questions_id;
	private String answer;
	private int users_id;

	//引数がないコンストラクタ
	public Answers() {

	}

	//引数があるコンストラクタ
	public Answers(int answers_id,int questions_id,String answer,int users_id) {
		super();
		this.answers_id=answers_id;
		this.questions_id=questions_id;
		this.answer=answer;
		this.users_id=users_id;

	}

	public int getAnswers_id() {
		return answers_id;
	}

	public void setAnswers_id(int answers_id) {
		this.answers_id = answers_id;
	}

	public int getQuestion_id() {
		return questions_id;
	}

	public void setQuestion_id(int question_id) {
		this.questions_id = question_id;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getUser_id() {
		return users_id;
	}

	public void setUser_id(int user_id) {
		this.users_id = user_id;
	}
}


