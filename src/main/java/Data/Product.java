package Data;

public class Product {
	private int id;
	private String name;
	private String type;
	private float price;
	private String detail;
	private String image;
	
	public Product(int id, String image, String name, String type, float price,String detail){
		this.id = id;
		this.image = image;
		this.name = name;
		this.type = type;
		this.price = price;
		this.detail = detail;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
}
