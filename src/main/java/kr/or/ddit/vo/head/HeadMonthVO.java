package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class HeadMonthVO {
	
	// 월별 총 가격
	private String month;					// 해당년도 월
	private int monthfrcsAmt; 				// 해당년도 월별 총 가맹비
	private int monthfrcsRowal; 			// 해당년도 월별 총 로열티
	private int monthselngPrice;			// 해당년도 월별 판매액
	private int monthpurchasePrice;			// 해당년도 월별 매입가 (입고단가 * 주문수량(headorder테이블))
}
