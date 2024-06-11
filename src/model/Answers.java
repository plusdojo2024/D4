package model;
import java.io.Serializable;

public class Answers implements Serializable{
	private int answers_id;
	private int question_id;
	private String answer;
	private int user_id;

	//引数がないコンストラクタ
	public Answers() {

	}

	//引数があるコンストラクタ
	public Answers(int answers_id,int question_id,String answer,int user_id) {
		super();
		this.answers_id=answers_id;
		this.question_id=question_id;
		this.answer=answer;
		this.user_id=user_id;

	}

	public int getAnswers_id() {
		return answers_id;
	}

	public void setAnswers_id(int answers_id) {
		this.answers_id = answers_id;
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
}


