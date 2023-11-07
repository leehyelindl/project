package kr.or.ddit.service.head;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.SalesAnalysisMapper;
import kr.or.ddit.vo.head.HeadMonthVO;

@Service
public class SalesAnalysisServiceImpl implements ISalesAnalysisService {

	@Inject
	private SalesAnalysisMapper mapper;

	/**
	 * 해당년도별 월별 가맹비 서비스 로직
	 */
	@Override
	public List<HeadMonthVO> headmonthChart() {
		
		List<HeadMonthVO> headmonthVO = mapper.headmonthChart();
		
		List<HeadMonthVO> headmonthList = new ArrayList<HeadMonthVO>();
		
		for(int i = 0; i < headmonthVO.size(); i++) {
			HeadMonthVO monthVO = new HeadMonthVO();
			
			switch(i) {
				case 0 :
					monthVO = headmonthVO.get(0);
					break;
				case 1 :
					int febfrcsAmt = 0;
					for(int a = 0; a < 2; a++ ) {
						febfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String febmonth = headmonthVO.get(1).getMonth();
					monthVO.setMonth(febmonth);
					monthVO.setMonthfrcsAmt(febfrcsAmt);
					break;
				case 2 :
					int marfrcsAmt = 0;
					for(int a = 0; a < 3; a++ ) {
						marfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String marmonth = headmonthVO.get(2).getMonth();
					monthVO.setMonth(marmonth);
					monthVO.setMonthfrcsAmt(marfrcsAmt);
					break;
				case 3 :
					int aprfrcsAmt = 0;
					for(int a = 0; a < 4; a++ ) {
						aprfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String aprmonth = headmonthVO.get(3).getMonth();
					monthVO.setMonth(aprmonth);
					monthVO.setMonthfrcsAmt(aprfrcsAmt);
					break;
				case 4 :
					int mayfrcsAmt = 0;
					for(int a = 0; a < 5; a++ ) {
						mayfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String maymonth = headmonthVO.get(4).getMonth();
					monthVO.setMonth(maymonth);
					monthVO.setMonthfrcsAmt(mayfrcsAmt);
					break;
				case 5 :
					int junfrcsAmt = 0;
					for(int a = 0; a < 6; a++ ) {
						junfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String junmonth = headmonthVO.get(5).getMonth();
					monthVO.setMonth(junmonth);
					monthVO.setMonthfrcsAmt(junfrcsAmt);
					break;
				case 6 :
					int julyfrcsAmt = 0;
					for(int a = 0; a < 7; a++ ) {
						julyfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String julymonth = headmonthVO.get(6).getMonth();
					monthVO.setMonth(julymonth);
					monthVO.setMonthfrcsAmt(julyfrcsAmt);
					break;
				case 7 :
					int augfrcsAmt = 0;
					for(int a = 0; a < 8; a++ ) {
						augfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String augmonth = headmonthVO.get(7).getMonth();
					monthVO.setMonth(augmonth);
					monthVO.setMonthfrcsAmt(augfrcsAmt);
					break;
				case 8 :
					int sepfrcsAmt = 0;
					for(int a = 0; a < 9; a++ ) {
						sepfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String sepmonth = headmonthVO.get(8).getMonth();
					monthVO.setMonth(sepmonth);
					monthVO.setMonthfrcsAmt(sepfrcsAmt);
					break;
				case 9 :
					int octfrcsAmt = 0;
					for(int a = 0; a < 10; a++ ) {
						octfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String octmonth = headmonthVO.get(9).getMonth();
					monthVO.setMonth(octmonth);
					monthVO.setMonthfrcsAmt(octfrcsAmt);
					break;
				case 10 :
					int novfrcsAmt = 0;
					for(int a = 0; a < 11; a++ ) {
						novfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String novmonth = headmonthVO.get(10).getMonth();
					monthVO.setMonth(novmonth);
					monthVO.setMonthfrcsAmt(novfrcsAmt);
					break;
				case 11 :
					int decfrcsAmt = 0;
					for(int a = 0; a < 12; a++ ) {
						decfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					String decmonth = headmonthVO.get(11).getMonth();
					monthVO.setMonth(decmonth);
					monthVO.setMonthfrcsAmt(decfrcsAmt);
					break;
			}
			headmonthList.add(monthVO);
		}
		return headmonthList;
	}

//	/**
//	 * 본사 매출 서비스 로직
//	 * 
//	 * @param FeeVO
//	 */
//	@Override
//	public FeeVO headChart() {
//		
//		FeeVO feeVO = new FeeVO();
//		
//		// 본사 년도별 총 (가맹비, 로얄티, 승인된 가격, 매입가) 조회
//		HeadSalesTotalVO headyeartotalVO = mapper.headyeartotalChart();
//		int yearTotalfrcsAmt = headyeartotalVO.getYearTotalfrcsAmt();
//		int yearTotalfrcsRowal = headyeartotalVO.getYearTotalfrcsRowal();
//		int yearTotalselngPrice = headyeartotalVO.getYearTotalselngPrice();
//		int yearTotalpurchasePrice = headyeartotalVO.getYearTotalpurchasePrice();
//		
//		feeVO.setYearTotalfrcsAmt(yearTotalfrcsAmt); // 년도별 총 가맹비
//		feeVO.setYearTotalfrcsRowal(yearTotalfrcsRowal); // 년도별 총 로얄티
//		feeVO.setYearTotalselngPrice(yearTotalselngPrice); // 년도별 총 승인된 가격
//		feeVO.setYearTotalPrice(yearTotalfrcsAmt + yearTotalfrcsRowal + yearTotalselngPrice); // 년도별 총 매출액
//		feeVO.setYearTotalpurchasePrice(yearTotalpurchasePrice); // 년도별 총 매입가
//		
//		// 본사 년도별 총 매출 원가
//		int yearTotalsalePrice = feeVO.getYearTotalPrice()-feeVO.getYearTotalpurchasePrice();
//		
//		feeVO.setYearTotalsalePrice(yearTotalsalePrice);
//		feeVO.setYearTotalprofitPrice(yearTotalsalePrice);
//		feeVO.setYearTotalincomePrice(yearTotalsalePrice - (int)(yearTotalsalePrice*0.1));
//		
//		return feeVO;
//	}
//
//	/**
//	 * 본사 해당년도의 월별 총 매출액 서비스 로직 (1개월 단위)
//	 *
//	 */
//	@Override
//	public List<FeeVO> allmonthheadChart() {
//		
//		List<FeeVO> allmontfeeVO = new ArrayList<FeeVO>();
//		
//		List<HeadSalesTotalVO> headallmonthtotalVO = mapper.allmonthtotalChart();
//		
//		for(int i = 0; i < headallmonthtotalVO.size(); i++) {
//			HeadSalesTotalVO headallmonthtotal = headallmonthtotalVO.get(i);
//			int monthTotalfrcsAmt = headallmonthtotal.getAllmonthfrcsAmt();
//			int monthTotalfrcsRowal = headallmonthtotal.getAllmonthfrcsRowal();
//			int monthTotalselngPrice = headallmonthtotal.getAllmonthselngPrice();
//			
//			int monthTotalPrice = monthTotalfrcsAmt + monthTotalfrcsRowal + monthTotalselngPrice;
//			
//			FeeVO feeVO = new FeeVO();
//			feeVO.setMonthTotalselngPrice(monthTotalselngPrice);
//			feeVO.setMonthTotalfrcsAmt(monthTotalfrcsAmt);
//			feeVO.setMonthTotalfrcsRowal(monthTotalfrcsRowal);
//			feeVO.setMonthTotalPrice(monthTotalPrice);
//			
//			allmontfeeVO.add(feeVO);
//		}
//		return allmontfeeVO;
//	}
//
//	/**
//	 * 본사 해당년도의 월별 총 매출액 서비스 로직 (1개월 단위) - 비동기처리
//	 */
//	@Override
//	public List<FeeVO> allmonthheadChart1(HeadSalesTotalVO headsalesTotalVO) {
//		
//		List<FeeVO> allmontfeeVO = new ArrayList<FeeVO>();
//		
//		String year = headsalesTotalVO.getYear();
//		String startyear = year + "-01" + "-01";
//		String endyear = year + "-12" + "-31";
//		
//		headsalesTotalVO.setStartYear(startyear);
//		headsalesTotalVO.setEndYear(endyear);
//		
//		List<HeadSalesTotalVO> headallmonthtotalVO = mapper.allmonthtotalChart1(headsalesTotalVO);
//		
//		for(int i = 0; i < headallmonthtotalVO.size(); i++) {
//			HeadSalesTotalVO headallmonthtotal = headallmonthtotalVO.get(i);
//			int monthTotalfrcsAmt = headallmonthtotal.getAllmonthfrcsAmt();
//			int monthTotalfrcsRowal = headallmonthtotal.getAllmonthfrcsRowal();
//			int monthTotalselngPrice = headallmonthtotal.getAllmonthselngPrice();
//			
//			int monthTotalPrice = monthTotalfrcsAmt + monthTotalfrcsRowal + monthTotalselngPrice;
//			
//			FeeVO feeVO = new FeeVO();
//			feeVO.setMonthTotalselngPrice(monthTotalselngPrice);
//			feeVO.setMonthTotalfrcsAmt(monthTotalfrcsAmt);
//			feeVO.setMonthTotalfrcsRowal(monthTotalfrcsRowal);
//			feeVO.setMonthTotalPrice(monthTotalPrice);
//			
//			allmontfeeVO.add(feeVO);
//		}
//		return allmontfeeVO;
//	}

}
