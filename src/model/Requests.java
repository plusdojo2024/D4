package model;
import java.io.Serializable;

public class Requests  implements Serializable {
	private int request_id;
	private String address_order;
	private String request;
	private int users_id;


	// 引数がないコンストラクタ（JavaBeansの仕様として必ず作る）
	public Requests() {

	}

	public Requests(int request_id, String address_order, String request, int users_id) {
		super();
		this.request_id = request_id;
		this.address_order = address_order;
		this.request = request;
		this.users_id = users_id;
	}

	public int getRequest_id() {
		return request_id;
	}

	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}

	public String getAddress_order() {
		return address_order;
	}

	public void setAddress_order(String address_order) {
		this.address_order = address_order;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public int getUsers_id() {
		return users_id;
	}

	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}

}
