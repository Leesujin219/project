package product;

import java.util.Date;

public class ProductDataBean {
	//사용자로부터 입력받는값(form에서 넘어오는값)은 String타입인것같다..
	private String categoryid; //카테고리 번호
	private int num;	//품번- 오라클에서 자동생성
	private Date reg_date;	//등록일
	private String new_ch;	
	private String sale_ch;
	private String main_ch;
	private String sell_ch;
	private String main_img;
	private String title;
	private String price;
	private String content;
	private int sellcount; //판매수량- 구매 발생시 자동 카운트


	
}
