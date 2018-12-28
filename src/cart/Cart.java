package cart;

public class Cart {
	private int cart_no;
	private String cart_m_id;
	private int cart_p_num;
	private int cart_amount;
	
	public Cart() {}
	public Cart(int cart_no, String cart_m_id, int cart_p_num, int cart_amount) {
		this.cart_no = cart_no;
		this.cart_m_id = cart_m_id;
		this.cart_p_num = cart_p_num;
		this.cart_amount = cart_amount;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public String getCart_m_id() {
		return cart_m_id;
	}
	public void setCart_m_id(String cart_m_id) {
		this.cart_m_id = cart_m_id;
	}
	public int getCart_p_num() {
		return cart_p_num;
	}
	public void setCart_p_num(int cart_p_num) {
		this.cart_p_num = cart_p_num;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	@Override
	public String toString() {
		return "Cart [cart_no=" + cart_no + ", cart_m_id=" + cart_m_id + ", cart_p_num=" + cart_p_num + ", cart_amount="
				+ cart_amount + "]";
	}
}
