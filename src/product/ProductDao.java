package product;

import java.util.ArrayList;

public interface ProductDao {
	void insert(Product p);	// 상품등록
	void delete(int p_num);	// 상품삭제
	void update(Product p);	// 상품수정
	Product select(int p_num);	// 상품 상세보기
	ArrayList<Product> selectAll(int optionVal, int p_cate1, int p_cate2);	// 등록순 정렬
	ArrayList<Product> selectByTitle(String p_title);	// 상품 검색
	ArrayList<Product> selectBySeller(String p_writer);	// 판매자 검색
	void updateHits(int num); // 업데이트 조회수
	
}
